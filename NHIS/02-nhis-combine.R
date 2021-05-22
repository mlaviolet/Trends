# combine NHIS person and sample adult files from 2000-2015 into a single
#   multiyear table

library(here)
library(tidyverse)
library(srvyr)

# dir(here("NHIS", "data"))

# for 2004 only, psu and stratum variables are in the person file instead of
#   the sample adult file--process 2004 separately
person_04 <- readRDS(here("NHIS", "data", "2004", "personsx.rds")) %>% 
  select(srvy_yr, hhx, fmx, ends_with("px"), ends_with("pub"), psu, stratum,
         ends_with("chip"), medicaid, private, notcov)
samadult_04 <- readRDS(here("NHIS", "data", "2004", "samadult.rds")) %>% 
  select(srvy_yr, hhx, fmx, ends_with("px"), wtfa_sa, ahernoy2,
         starts_with("strat"))
nhis_04 <- inner_join(person_04, samadult_04, 
                      by = c("srvy_yr", "hhx", "fmx", "fpx"))
rm(person_04, samadult_04)
# this function reads the person and sample adult files for each of the other
#   years and joins them into an annual data table 
readNHIS <- function(yr) {
  person <- readRDS(here("NHIS", "data", paste0("20", yr), "personsx.rds")) %>% 
    select(srvy_yr, hhx, fmx, ends_with("px"), ends_with("pub"), 
           ends_with("chip"), medicaid, private, notcov)
  samadult <- readRDS(here("NHIS", "data", paste0("20", yr), 
                           "samadult.rds")) %>% 
    select(srvy_yr, hhx, fmx, ends_with("px"), starts_with("wtfa"), ahernoy2,
           starts_with("psu"), starts_with("strat"))
  inner_join(person, samadult)
  }

# combine 16 yearly tables into a single table and make into survey object
nhis_svy <- map_dfr(sprintf("%02d", (0:15)[-5]), readNHIS) %>% 
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
  select(-othpub, -schip) %>% 
  # ADD INSURANCE RECODE
  # create survey object for analysis
  as_survey_design(ids = psu, strata = c(srvy_yr, stratum), weight = wtfa_sa, 
                   nest = TRUE)
# CHECK THAT PSU, STRATA, AND WEIGHTS ARE CORRECT
rm(nhis_04)
# count(nhis_svy, srvy_yr)
# ADD ANALYSIS






