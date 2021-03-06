# reproduce results from "Conducting Trend Analyses of YRBS data" (2014 ed.)
# combine data from 1991, 1993, ..., 2011 into a single data frame

# source("01-yrbss-download.R")

library(here)
library(tidyverse)
library(survey)
library(srvyr)
library(polypoly)
library(segmented)

options(survey.lonely.psu = "adjust")
# this function reads the national files for each year and joins them into an 
#   annual data table 
# some variable with the same names can't be stacked due to incompatible
# data types--process 1991-2005 and 2007 separately, then row-bind the two
#   resulting tables to get around incompatible data types

# process 1991-2005
readYRBS1 <- function(yr) {
  # read downloaded .rbs file
  readRDS(here("YRBSS", "data", paste(yr, "main.rds"))) %>% 
    # add year columns
    mutate(svy_year = yr) %>%
    # variables for ever smoked cigarette
    mutate(across(c(q2, q3, q4, q23, q26, q27, q28), as.numeric)) %>% 
    # recode race-Hispanic origin into 1 = White, 2 = Black, 3 = Hispanic,
    #   4 = Other
    mutate(race_eth = case_when(
      # 1991-1997
      svy_year %in% 1991:1997 & q4 %in% 1:3 ~ q4,
      svy_year %in% 1991:1997 & q4 %in% 4:6 ~ 4,
      # 1999-2005
      svy_year %in% 1999:2005 & q4 == 6               ~ 1,
      svy_year %in% 1999:2005 & q4 == 3               ~ 2,
      svy_year %in% 1999:2005 & q4 %in% c(4, 7)       ~ 3,
      svy_year %in% 1999:2005 & q4 %in% c(1, 2, 5, 8) ~ 4,
      TRUE ~ NA_real_)) %>% 
    select(svy_year, race_eth, q2, q3, q4, q23, q26, q27, q28,
           weight, psu, stratum)
  }

yrbss1_dat <- map_dfr(seq(1991, 2005, 2), readYRBS1) %>% 
  unnest(cols = svy_year) 

# similar processing for 2007-2011
readYRBS2 <- function(yr) {
  readRDS(here("YRBSS", "data", paste(yr, "main.rds"))) %>% 
    mutate(svy_year = yr) %>%
    mutate(across(c(q2, q3, q23, q28, q29, raceeth), as.numeric)) %>% 
    mutate(race_eth = case_when(
    # 2007-2011
    raceeth == 5            ~ 1,
    raceeth == 3            ~ 2,
    raceeth %in% 6:7        ~ 3,
    raceeth %in% c(1,2,4,8) ~ 4,
    TRUE ~ NA_real_)) %>%
    select(svy_year, q2, q3, q28, q29, race_eth, weight, psu, stratum)
  }

yrbss2_dat <- map_dfr(seq(2007, 2011, 2), readYRBS2) %>% 
  unnest(cols = svy_year) 

# stack the two tables into one, create ever-smoked variable, make sex, grade,
#   smoking, race-hispanic into factors
yrbss_svy <- bind_rows(yrbss1_dat, yrbss2_dat) %>% 
  # add code to harmonize ever-smoked, grade, race-Hispanic, sex as below
  mutate(smoking = case_when(
    svy_year == 1991                 ~ q23,
    svy_year %in% c(1993, 2001:2009) ~ q28,
    svy_year %in% c(1995:1997)       ~ q26,
    svy_year == 1999                 ~ q27,
    svy_year == 2011                 ~ q29)) %>% 
  mutate(sex = factor(q2, 1:2, c("Boys", "Girls")),
         grade = factor(q3, 1:4, c("9th", "10th", "11th", "12th")),
         smoking = factor(smoking, 1:2, c("Yes", "No")),
         race_eth = factor(race_eth, 1:4, c("White", "Black", "Hispanic",
                                            "Other"))) %>% 
  select(-starts_with("q")) %>%
  # filter(!is.na(smoking)) %>% 
  # one extra row in 1997 read as missing--remove
  filter(!is.na(psu)) %>% 
  # add orthogonal polynomials to degree 3
  poly_add_columns(svy_year, 3) %>% 
  # create survey object for analysis
  as_survey_design(ids = psu, strata = c(stratum, svy_year),
                   weights = weight, nest = TRUE)
# clean up
rm(readYRBS1, readYRBS2, yrbss1_dat, yrbss2_dat)

# check that unadjusted estimates match those in CDC document
# looks good!

yrbss_svy %>% 
  group_by(svy_year) %>% 
  summarize(pct = survey_mean(smoking == "Yes", na.rm = TRUE))

yrbss_svy <- yrbss_svy %>% 
  mutate(svy_year = as.numeric(svy_year))
# BEGIN ANALYSIS ----------------------------------------------------------
marginals <- 
  svyglm(I(smoking == "Yes") ~ sex + race_eth + grade,
         design = yrbss_svy, family = quasibinomial)

# Second, run these marginals through the svypredmeans function 
means_for_joinpoint <- svypredmeans(marginals, ~ svy_year) %>% 
  as_tibble(bind_cols(coef(.), SE(.)), rownames = "svy_year") %>% 
  mutate(wgt = (mean / SE ) ^ 2) 
means_for_joinpoint
# coef() gives point estimates; SE() for standard errors
# RESUME HERE
model1 <- lm(log(mean) ~ as.numeric(svy_year), weights = wgt, data = means_for_joinpoint)
model1_seg <- segmented(model1)


# PLOT POINTS WITH SEGMENTED LINES ADDED
# augment(indicator1_2_seg) %>% 
# mutate(Year = seg1 + seg2 + seg3) %>% 
#   ggplot(aes(x = Year, y = exp(`log(adj_rate)`))) +
#   labs(title = "Mortality from diseases of the heart",
#        x = NULL, y = "Adjusted rate per 100,000",
#        caption = "Data source: New Hampshire Vital Records") +
#   geom_point() +
#   # scale_y_continuous(breaks = seq(140, 240, 20)) +
#   geom_line(aes(y = exp(`.fitted`))) +
#   theme_bw() +
#   theme(aspect.ratio = 0.62)
