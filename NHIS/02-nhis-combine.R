# combine NHIS person and sample adult files from 2000-2015 into a single
#   multiyear table

library(here)
library(tidyverse)
library(srvyr)
options(survey.lonely.psu = "adjust")

# for 2004 only, psu, stratum, age variables are in the person file instead of
#   the sample adult file--process 2004 separately
person_04 <- readRDS(here("NHIS", "data", "2004", "personsx.rds")) %>% 
  select(srvy_yr, hhx, fmx, ends_with("px"), ends_with("pub"), psu, stratum,
         ends_with("chip"), medicaid, private, notcov, age_p)
samadult_04 <- readRDS(here("NHIS", "data", "2004", "samadult.rds")) %>% 
  select(srvy_yr, hhx, fmx, ends_with("px"), starts_with("wtfa"), ahernoy2, 
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
           starts_with("psu"), starts_with("strat"), age_p,
           ends_with("chip"), ends_with("pub"))
  inner_join(person, samadult)
  }

# combine 16 yearly tables into a single table and make into survey object
# combine all years except 2004
nhis_dat <- map_dfr(sprintf("%02d", (0:15)[-5]), readNHIS) %>% 
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
  mutate(
    # group ages by 18-64 and 65+
    agegrp = cut(age_p, c(18, 65, Inf), c("18-64", "65+"),  right = FALSE), 
    # dichotomize ER visits into 0 and 1+
    anyeruse = cut(ahernoy2, c(0, 1, 8), c("None", "One or more"),
                   right = FALSE, include.lowest = TRUE))
  # INSURANCE RECODE
nhis_dat <- nhis_dat %>% 
  mutate(otherpub = if_else(srvy_yr > 2007, othpub, otherpub),
         chip = if_else(srvy_yr > 2003, schip, chip)) %>% 
  # Medicaid or any public coverage?
  mutate(mcaid = case_when(
    srvy_yr %in% 2000:2003 & (medicaid %in% 1:2 | otherpub == 1 | chip == 1) ~ 1,
    srvy_yr %in% 2000:2003 & (medicaid == 3 | otherpub == 2 | chip == 2) ~ 2,
    srvy_yr %in% 2000:2003 & (medicaid %in% 7:9 | otherpub %in% 7:9 | chip %in% 7:9) ~ 9,
    srvy_yr %in% 2004:2015 & (medicaid %in% 1:2 | otherpub %in% 1:2 | chip %in% 1:2) ~ 1,
    srvy_yr %in% 2004:2015 & (medicaid == 3 | otherpub == 3 | chip == 3) ~ 2,
    srvy_yr %in% 2004:2015 & (medicaid %in% 7:9 | otherpub %in% 7:9 | chip %in% 7:9) ~ 9,
    TRUE ~ 9)) %>% 
  # dichotomized private coverage
  mutate(pricov = case_when(private %in% 1:2 ~ 1,
                            private == 3     ~ 2,
                            private > 3      ~ 3,
                            TRUE             ~ NA_real_)) %>% 
  # hierarchy of uninsured, Medicaid, private, other
  mutate(instype = case_when(
    notcov == 1 & pricov == 2 & mcaid == 2 ~ 1, # uninsured
    notcov == 2 & pricov == 2 & mcaid == 1 ~ 2, # Medicaid or other public
    notcov == 2 & pricov == 1              ~ 3, # private
    notcov == 2 & pricov == 2 & mcaid == 2 ~ 4, # other
    TRUE                                   ~ NA_real_),
    instype = factor(instype, 1:4, 
                     c("Uninsured", "Medicaid", "Private", "Other"))) 
  
# check unweighted counts for age 18-64
# n_18_64 <- nhis_dat %>% 
#   filter(agegrp == "18-64") %>% 
#   count(srvy_yr, instype)
# looks good!

# survey object  
nhis_svy <- as_survey_design(nhis_dat, ids = psu, strata = c(stratum, srvy_yr),
                             weight = wtfa_sa, nest = TRUE)

# export data for SAS
# nhis_dat %>% 
#   mutate(across(c(agegrp, anyeruse), as.numeric)) %>% 
#   select(srvy_yr, age_p, otherpub, othpub, chip, schip, medicaid, private, 
#          notcov, anyeruse, psu, stratum, wtfa_sa) %>% 
#   write.csv(here("NHIS", "data", "nhis.csv"), row.names = FALSE, na = ".")

# CHECK THAT PSU, STRATA, AND WEIGHTS ARE CORRECT--AGAINST SUDAAN?
rm(nhis_04)
    
# READY FOR ANALYSIS
results <- nhis_svy %>% 
  filter(agegrp == "18-64") %>% 
  #, !is.na(anyeruse), !is.na(INSTYPE)
  group_by(srvy_yr, instype) %>% 
  summarize(n = unweighted(n()),
            pct = survey_mean(anyeruse == "One or more", na.rm = TRUE)) %>% 
  filter(instype != "Other") %>% 
  # arrange(srvy_yr, instype) %>% 
  mutate(across(starts_with("pct"), ~ 100 * .x))
# point estimates match
# std errors slightly off but match SAS--why? would SUDAAN match?




