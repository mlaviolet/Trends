# replicating Example A in NCHS trend guidelines, 2015 only for now
# https://www.cdc.gov/nchs/data/series/sr_02/sr02_179.pdf
#   Example A, replicating results in Table A, page 22

library(here)
library(tidyverse)
library(srvyr)
library(survey)

options(survey.lonely.psu = "adjust") 

# Data sources
# ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2015/personsx.zip
# ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2015/samadult.zip

# for 2015:
#  srvy_yr 3-6
#  hhx 7-12 (household ID)
#  fmx 16-17 (family ID)
#  fpx 18-19 (person ID within family)
#  cover 543-543 (health insurance under age 65)

person_15 <- read_fwf(here("NHIS", "2015", "personsx.dat"),
           fwf_positions(c(3, 7, 16, 18, 543),
                         c(6, 12, 17, 19, 543),
                         c("srvy_yr", "hhx", "fmx", "fpx", "cover")))

samadult_15 <- 
  read_fwf(here("NHIS", "2015", "samadult.dat"),
           fwf_positions(c(3, 7, 16, 18, 27, 34, 37, 48, 772),
                         c(6, 12, 17, 19, 32, 36, 38, 49, 773),
                         c("srvy_yr", "hhx", "fmx", "fpx", "wtfa", 
                           "stratum", "psu", "age", "ahernoy2")))

nhis15_svy <- inner_join(person_15, samadult_15, 
                      by = c("srvy_yr", "hhx", "fmx", "fpx")) %>% 
  mutate(across(c(wtfa, ahernoy2), as.numeric),
         # group ages by 18-64 and 65+
         agegrp = cut(age, c(18, 65, Inf), c("18-64", "65+"),  right = FALSE), 
         # dichotomize ER visits into 0 and 1+
         anyeruse = cut(ahernoy2, c(0, 1, 8), c("None", "One or more"),
                        right = FALSE, include.lowest = TRUE),
         # code insurance types to match example
         instype = factor(cover, c(4, 2, 1, 3), 
                          c("Uninsured", "Medicaid", "Private", "Other"))) %>% 
  as_survey_design(ids = psu, strata = stratum, weight = wtfa, nest = TRUE)

# percent of adults 18-64 with at least one ED visit, 2015
nhis15_svy %>%
  filter(agegrp == "18-64") %>% 
  group_by(instype) %>%
  summarize(pct = survey_mean(anyeruse == "One or more", na.rm = TRUE)) %>% 
  drop_na() %>% 
  mutate(across(starts_with("pct"), ~ 100 * .x))
# point estimates OK, stderrs slightly off  
# possibly because analysis used non-public data?
# svyciprop with method logit affects CIs, not SEs

svyby(~ anyeruse, ~ instype, subset(nhis15_svy, agegrp == "18-64"), svymean,
      na.rm = TRUE)

svyby(~ anyeruse, ~ instype, subset(nhis15_svy, agegrp == "18-64"), 
      svyciprop, method = "logit", na.rm = TRUE) %>% confint()

# 2014





