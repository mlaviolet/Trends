library(here)
library(tidyverse)
library(srvyr)

# this function reads the national files for each year and joins them into an 
#   annual data table 
# read YRBSS data files 1991-2005 to get around incompatible data types
readYRBS1 <- function(yr) {
  readRDS(here("YRBSS", "data", paste(yr, "main.rds"))) %>% 
    mutate(svy_year = yr) %>%
    mutate(across(c(q2, q3, q4, q23, q26, q27, q28), as.numeric)) %>% 
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

# read YRBSS data files 2007-2011
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
  as_survey_design(ids = psu, strata = c(stratum, svy_year),
                   weights = weight, nest = TRUE)

rm(readYRBS1, readYRBS2, yrbss1_dat, yrbss2_dat)
  
# BEGIN ANALYSIS ----------------------------------------------------------

# recodes from Damico
# add code to harmonize ever-smoked, grade, race-Hispanic, sex as below
# mutate(smoking = case_when(
#   svy_year == 1991                 ~ q23,
#   svy_year %in% c(1993, 2001:2009) ~ q28,
#   svy_year %in% c(1995:1997)       ~ q26,
#   svy_year == 1999                 ~ q27,
#   svy_year == 2011                 ~ q29)) %>%

# construct year-specific recodes so that
# "ever smoked a cigarette" // grade // sex // race-ethnicity align across 
#   years
# y <- transform(y,
#                smoking = 
#                  as.numeric(ifelse(year == 1991, q23,
#                                    ifelse(year %in% c(1993, 2001:2009), q28,
#                                           ifelse(year %in% 1995:1997, q26,
#                                                  ifelse(year %in% 1999, q27,
#                                                         ifelse(year %in% 2011, q29, NA)))))),
#                raceeth = ifelse(year %in% 1991:1997,
#                                 ifelse(q4 %in% 1:3, q4, 
#                                        ifelse(q4 %in% 4:6, 4, NA)),
#                                 ifelse(year %in% 1999:2005,
#                                        ifelse(q4 %in% 6, 1,
#                                               ifelse(q4 %in% 3, 2,
#                                                      ifelse(q4 %in% c(4, 7), 3,
#                                                             ifelse( q4 %in% c(1, 2, 5, 8), 4, NA)))),
#                                        ifelse(year %in% 2007:2011,
#                                               ifelse(raceeth %in% 5, 1,
#                                                      ifelse(raceeth %in% 3, 2,
#                                                             ifelse(raceeth %in% c(6, 7), 3,
#                                                                    ifelse(raceeth %in% c(1, 2, 4, 8), 4, NA)))),
#                                               NA))),
#                grade = ifelse(q3 == 5, NA, as.numeric(q3)),
#                sex = ifelse(q2 %in% 1:2, q2, NA))
