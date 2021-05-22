# combine NHIS person and sample adult files from 2000-2015 into a single
#   multiyear table

library(here)
library(tidyverse)

dir(here("NHIS", "data"))

# person00 <- readRDS(here("NHIS", "data", "2000", "personsx.rds"))

# for 2004 only, psu and stratum variables are in the person file instead of
#   the sample adult file
# insert code here to process 2004 separately
# this function reads the person and sample adult files for each of the other
#   years and joins them into an annual data table 
readNHIS <- function(yr) {
  person <- readRDS(here("NHIS", "data", paste0("20", yr), "personsx.rds")) %>% 
    select(srvy_yr, hhx, fmx, ends_with("px"), ends_with("pub"), 
           ends_with("chip"), medicaid, private, notcov)
  samadult <- readRDS(here("NHIS", "data", paste0("20", yr), 
                           "samadult.rds")) %>% 
    select(srvy_yr, hhx, fmx, ends_with("px"), wtfa_sa, ahernoy2,
           starts_with("psu"), starts_with("strat"))
  inner_join(person, samadult)
  }

# stratum, psu variable names apparently changed during period
# stratum is "stratum" 2000-2005 and "strat_p" 2006-2015--both in 2004?
# PSU is "psu" 2000-2005 and "psu_p" 2006-2015--both in 2004?
# for 2004, stratum and psu are apparently in person file
# INQUIRE TO CONFIRM

# person00 <- readNHIS("00")
# person15 <- readNHIS("15")
nhis_svy <- map_dfr(sprintf("%02d", 0:15), ~ readNHIS(.x)) %>% 
  unnest(cols = srvy_yr) 
count(nhis_svy, srvy_yr)
# ADD INSURANCE RECODE
# ADD ANALYSIS

# chk <- readRDS(here("NHIS", "data", "2015", "samadult.rds")) %>% 
#   names()

# map(paste0("20", sprintf("%02d", 0:15)), ~ dir(here("NHIS", "data", .x)))



