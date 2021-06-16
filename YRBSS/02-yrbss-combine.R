# combine YRBSS national from 1991-2011 into a single multiyear table

library(here)
library(tidyverse)
library(srvyr)



# this function reads the person and sample adult files for each of the other
#   years and joins them into an annual data table 
# modify to add ever-smoked question as second argument
readYRBS <- function(yr) {
 readRDS(here("YRBSS", "data", paste(1991, "main.rds")))
  }

chk1 <- readYRBS("1991")
# combine 16 yearly tables into a single table and make into survey object
nhis_svy <- map_dfr(as.character(seq(1991, 2011, 2)), readYRBS) %>% 
  unnest(cols = srvy_yr) %>% 
  # add 2004 to table and arrange in year order
  bind_rows(nhis_04) %>% 
  arrange(srvy_yr, hhx) %>% 
  # remove extraneous variable
  select(-smknotpx) %>% 
  # collect psu and stratum variables into a single column for each
  mutate(psu = if_else(srvy_yr %in% 2000:2005, psu, psu_p),
         stratum = if_else(srvy_yr %in% 2000:2005, stratum, strat_p)) %>% 
  select(-psu_p, -strat_p) %>% 
  # same for otherpub and chip variables
  mutate(otherpub = if_else(srvy_yr %in% 2000:2007, otherpub, othpub),
         chip = if_else(srvy_yr %in% 2000:2003, chip, schip)) %>% 
  select(-c(othpub, schip)) %>% 
  # select(-c(hhx, fmx, px, fpx)) %>% 
  mutate(
    # group ages by 18-64 and 65+
    agegrp = cut(age_p, c(18, 65, Inf), c("18-64", "65+"),  right = FALSE), 
    # dichotomize ER visits into 0 and 1+
    anyeruse = cut(ahernoy2, c(0, 1, 8), c("None", "One or more"),
                   right = FALSE, include.lowest = TRUE)) %>% 
  # INSURANCE RECODE
  # "OR UNKNOWN ON SUCH COVERAGE"--SHOULD UNKNOWN BE TREATED AS "NO"?
  # IF SO, CHANGE NA_real_ to 2 below
  mutate(mcaid = case_when(
    srvy_yr %in% 2000:2003 & (medicaid %in% 1:2 | otherpub == 1 | chip == 1) ~ 1,
    srvy_yr %in% 2000:2003 & (medicaid %in% 7:9 | otherpub %in% 7:9 | chip %in% 7:9) ~ 9,
    srvy_yr %in% 2004:2015 & (medicaid %in% 1:2 | otherpub %in% 1:2 | chip %in% 1:2) ~ 1,
    srvy_yr %in% 2004:2015 & (medicaid %in% 7:9 | otherpub %in% 7:9 | chip %in% 7:9) ~ 9,
    TRUE ~ 2)) %>% 
  # mutate(mcaid = case_when(medicaid %in% 1:2 ~ 1,
  #                          medicaid == 3     ~ 2,
  #                          TRUE              ~ NA_real_)) %>% 
  # mutate(chp = case_when(srvy_yr %in% 2000:2003 & chip == 1     ~ 1,
  #                        srvy_yr %in% 2000:2003 & chip == 2     ~ 2,
  #                        srvy_yr %in% 2004:2015 & chip %in% 1:2 ~ 1,
  #                        srvy_yr %in% 2004:2015 & chip == 3     ~ 2,
  #                        TRUE                                   ~ NA_real_)) %>% 
  # mutate(othpub = case_when(
  #   srvy_yr %in% 2000:2003 & otherpub == 1     ~ 1,
  #   srvy_yr %in% 2000:2003 & otherpub == 2     ~ 2,
  #   srvy_yr %in% 2004:2015 & otherpub %in% 1:2 ~ 1,
  #   srvy_yr %in% 2004:2015 & otherpub == 3     ~ 2,
  #   TRUE                                       ~ 9)) %>% 
  # mutate(mcaid = case_when(
  #   medicaid %in% c(1:2, 7:9) | chp == 1 | othpub == 1 ~ 1,
  #   medicaid == 3 & chp == 2 & othpub == 2     ~ 2,
  #   TRUE                                       ~ 9)) %>% 
  # TRANSLATE SAS CODE FOLLOWING "DICHOTOMIZED PRIVATE COVERAGE"
  # create survey object for analysis
  as_survey_design(ids = psu, strata = c(srvy_yr, stratum), weight = wtfa_sa,
                   nest = TRUE)
# CHECK THAT PSU, STRATA, AND WEIGHTS ARE CORRECT
rm(nhis_04)
    
chk4 <- count(nhis_svy$variables, srvy_yr, medicaid)
# ADD ANALYSIS

er_use <- nhis_svy %>% 
  filter(mcaid == 1) %>% 
  # filter(!is.na(anyeruse)) %>% 
  # filter(agegrp == "18-64") %>% 
  group_by(agegrp, srvy_yr) %>% 
  summarize(pct = survey_mean(anyeruse == "One or more", na.rm = TRUE)) %>% 
  mutate(across(starts_with("pct"), ~ 100 * .x))
# seems consistently lower--should I count unknowns with Yes, as implied by
#   notes in SAS code?





