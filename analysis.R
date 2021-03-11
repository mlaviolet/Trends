library(here)
library(tidyverse)
library(survey)
library(srvyr)
library(segmented)
library(polypoly)
library(ggthemes)
library(broom)


# set R to produce conservative standard errors instead of crashing
# http://r-survey.r-forge.r-project.org/survey/exmample-lonely.html
options(survey.lonely.psu = "adjust")
# this setting matches the MISSUNIT option in SUDAAN
#   SAS uses "remove" instead of "adjust" by default,
#   the table target replication was generated with SAS,
#   so to get closer to that, use "remove"

# helper functions
percent <- function(x) 100 * x
inv_logit <- function(x) exp(x) / (1 + exp(x))

load(here("YRBSS data", "yrbs.Rdata"))

# construct raceeth variable with four categories:
# 1 = White, 2 = Black, 3 = Hispanic, 4 = All other nonmissing
# Recode specific years as follows:
# 1991-1997
#   4, 5, 6 -> 4
# 1999-2005
#   6 -> 1 
#   3 -> 2 
#   4, 7 -> 3 
#   1, 2, 5, 8 -> 4
# 2007-2011
#   5 -> 1
#   3 -> 2
#   6 -> 3
#   1, 2, 4, 8 -> 4
yrbs_dat <- yrbs_dat %>% 
  mutate(raceeth = 
           case_when(
             # 1991, 1993, 1995, 1997
             survyear %in% 1991:1997 & race %in% 4:6           ~ 4,
             # 1999, 2001, 2003, 2005
             survyear %in% 1999:2005 & race == 6               ~ 1,
             survyear %in% 1999:2005 & race == 3               ~ 2,
             survyear %in% 1999:2005 & race %in% c(4, 7)       ~ 3,
             survyear %in% 1999:2005 & race %in% c(1, 2, 5, 8) ~ 4,
             # 2007, 2009, 2011
             survyear %in% 2007:2011 & race == 5               ~ 1,
             survyear %in% 2007:2011 & race == 3               ~ 2,
             survyear %in% 2007:2011 & race %in% c(6, 7)       ~ 3,
             survyear %in% 2007:2011 & race %in% c(1, 2, 4, 8) ~ 4,
             TRUE ~ race)) 

# Reference groups:
#   female
#   ever smoked = yes 
#   white 
#   9th graders

yrbs_dat <- yrbs_dat %>% 
  mutate(sex = factor(sex, 2:1, c("Girls", "Boys")),
         smoke = factor(smoke, 1:2, c("Yes", "No")),
         raceeth = factor(raceeth, 1:4, c("White", "Black", "Hispanic",
                                          "All other")),
         grade = factor(grade, 1:4, c("9th", "10th", "11th", "12th")))

# for each record in the data, tack on the linear, quadratic, and cubic 
#   contrast value
#   these contrast values will serve as replacement for the linear `year` 
#   variable in any regression
yrbs_dat <- poly_add_columns(yrbs_dat, survyear, 3)

# construct a complex sample survey design object, accounting for `survyear` 
#   in the nested strata
yrbs_svy <- as_survey_design(yrbs_dat, ids = psu, strata = stratum,
                             weights = weight, nest = TRUE) %>% 
  # immediately remove records with missing smoking status
  filter(!is.na(smoke))

# unadjusted smoking rates by year
smoke_unadj <- yrbs_svy %>% 
  group_by(survyear, smoke) %>% 
  summarize(pct = survey_mean(na.rm = TRUE, vartype = c("ci", "se"))) %>%
  filter(smoke == "Yes") %>% 
  mutate(across(starts_with("pct"), ~ 100 * .x))
# MATCHES CDC DOCUMENT on Conducting Trend Analysis, 2014 version

# plot
ggplot(smoke_unadj, aes(x = survyear, y = pct)) +
  geom_point() + 
  geom_errorbar(aes(ymax = pct_upp, ymin = pct_low), width = 0.2) +
  geom_line() +
  theme_tufte() +
  ggtitle("Figure 1. Unadjusted smoking prevalence 1999-2011") +
  theme(plot.title = element_text(size = 9, face = "bold"))

# Calculate the "ever smoked" binomial regression, adjusted by sex, age, 
#   race-ethnicity, and linear year contrasts
linyear <- svyglm(I(smoke == "Yes") ~ sex + raceeth + grade + survyear1, 
                  design = yrbs_svy, family = quasibinomial)
summary(linyear)

# Add quadratic contrasts
quadyear <-
  svyglm(I(smoke == "Yes") ~ sex + raceeth + grade + survyear1 + survyear2,  
         design = yrbs_svy, family = quasibinomial)
summary(quadyear)

# Add cubic contrasts
cubyear <-
  svyglm(I(smoke == "Yes") ~ sex + raceeth + grade + survyear1 + survyear2 + 
           survyear3,
         design = yrbs_svy, family = quasibinomial)
summary(cubyear)

# Calculate the survey-year-independent predictor effects and store 
#   these results into a separate object.
marginals <- svyglm(formula = I(smoke == "Yes") ~ sex + raceeth + grade,
         design = yrbs_svy, family = quasibinomial)
# Second, run these marginals through the svypredmeans function 
means_for_joinpoint <- svypredmeans(marginals, ~ factor(survyear))
# means_for_joinpoint
# confint(means_for_joinpoint)
# merge(means_for_joinpoint, confint(means_for_joinpoint), by = 0)

# coerce the results to a tibble object; need to join point estimates and CIs
means_for_joinpoint <- 
  as_tibble(means_for_joinpoint, rownames = "survyear") %>% 
  inner_join(as_tibble(confint(means_for_joinpoint), rownames = "survyear"),
             by = "survyear") %>% 
  mutate(survyear = as.numeric(survyear)) %>% 
  set_names(c("year", "pct", "pct_se", "pct_low", "pct_upp")) 
  
ggplot(means_for_joinpoint, aes(x = year, y = pct)) +
  geom_point() + 
  geom_errorbar(aes(ymax = pct_upp, ymin = pct_low), width = 0.2) +
  geom_line() +
  theme_tufte() +
  ggtitle("Figure 2. Adjusted smoking prevalence 1999-2011") +
  theme(plot.title = element_text(size = 9, face = "bold"))

ggplot(means_for_joinpoint, aes(x = year, y = pct)) +
  geom_point(aes(size = pct_se)) +
  theme_tufte() +
  ggtitle( "Figure 3. Standard Error at each timepoint\n(smaller dots indicate greater confidence in each adjusted value)")

# Create a weight variable.
means_for_joinpoint <- means_for_joinpoint %>% 
  mutate(wgt = (pct / pct_se ) ^ 2) %>% 
  mutate(across(starts_with("pct"), ~ 100 * .x))
# CHANGE WEIGHT TO 1 / pct_se^2

# Fit a piecewise linear regression
# Estimate the 'starting' linear model with the usual "lm" function using 
#   the log values and the weights.
model_lm <- lm(log(pct) ~ year, weights = wgt, data = means_for_joinpoint)
model_seg <- segmented(model_lm, ~ year)

# Note that the Estimated Break-Point is not necessarily an integer.
breakpoint <- round(as.vector(model_seg$psi[, "Est."]))
# obtain the annual percent change (APC=) estimates for each time point
slope(model_seg, APC = TRUE)

# estimated breakpoint is 1999

# fit record-level model as recommended by NCHS
brfs_seg <- yrbs_svy  %>% 
  mutate(seg1 = ifelse(survyear <= breakpoint, survyear, breakpoint),
         seg2 = ifelse(survyear <= breakpoint, 0, survyear - breakpoint))
brfs_fit <- svyglm(I(smoke == "Yes") ~ seg1 + seg2, design = brfs_seg,
                   family = quasibinomial)

brfs_result <- augment(brfs_fit) %>% 
  mutate(survyear = seg1 + seg2) %>% 
  distinct(survyear, `.fitted`) %>% 
  mutate(pct_fitted = 100 * inv_logit(`.fitted`)) %>% 
  inner_join(means_for_joinpoint, by = c("survyear" = "year"))
# graph observed adjusted estimates and fitted values
brfs_result %>% 
  ggplot(aes(x = survyear)) +
  geom_line(aes(y = pct_fitted)) +
  geom_point(aes(y =pct))
# find APCs, drop intercept term 
tidy(brfs_fit, conf.int = TRUE) %>% 
  slice(-1) %>% 
  mutate(across(c(estimate, conf.low, conf.high),
                ~ 100 * (exp(.x) - 1)))
# MAKES SENSE, BUT DIFFERENT FROM segmented--CHECK OUT
#  this analysis uses record level data; {segmented} uses aggregated measures 
# EXPLORE USING RELATIVE RISK REGRESSION TO DETERMINE AVERAGE PERCENT CHANGE IN PREVALENCE
rr_fit <- svyglm(I(smoke == "Yes") ~ seg1 + seg2, design = brfs_seg,
                   family = quasibinomial(log), 
                 start = c(-0.5, rep(0, 2)))
# marginals_rr <- svypredmeans(rr_fit, ~  seg1 + seg2)
rr_results <- augment(rr_fit) %>% 
  mutate(survyear = seg1 + seg2) %>% 
  distinct(survyear, `.fitted`) %>% 
  mutate(pct_fitted = 100 * exp(`.fitted`)) %>% 
  inner_join(means_for_joinpoint, by = c("survyear" = "year")) %>% 
  ggplot(aes(x = survyear)) +
  geom_point(aes(y = pct)) +
  geom_line(aes(y = pct_fitted))

tidy(rr_fit, conf.int = TRUE) %>% 
  slice(-1) %>% 
  mutate(across(c(estimate, conf.low, conf.high),
                ~ 100 * (exp(.x) - 1))) 

# in manuscript make table of smoking estimates with question number, sample 
#   sizes, etc.

# LOOKS GOOD!
rr_adj_fit <- 
  svyglm(I(smoke == "Yes") ~ seg1 + seg2, #+ sex + grade + raceeth, 
         design = brfs_model, family = quasibinomial(log), 
         start = c(-0.5, rep(0, 2))) # 0, 9 if using covariates
# TRY USING MODEL WITH COVARIATES, THEN MARGINAL MEANS WITH BOTH seg1 AND
#   seg2 AS MARGINS--WOULD IT PRODUCE THE SAME RESULTS AS USING YEAR?

rr_adj_results <- augment(rr_adj_fit) %>% 
  mutate(survyear = seg1 + seg2) %>% 
  distinct(survyear, `.fitted`) %>% 
  mutate(pct_fitted = 100 * exp(`.fitted`)) %>% 
  inner_join(means_for_joinpoint, by = c("survyear" = "year")) %>% 
  ggplot(aes(x = survyear)) +
  geom_point(aes(y = pct)) +
  geom_line(aes(y = pct_fitted))

