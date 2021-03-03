library(tidyverse)
library(here)
library(srvyr)


col_names <- c("sex", "grade", "smoke", "weight", "stratum", "psu", "race")
yrbs2011 <- read_fwf(here("YRBSS data", "yrbs2011.dat"),
                     fwf_positions(c(18, 19, 60, 364, 374, 377, 388),
                                   c(18, 19, 60, 373, 376, 382, 389),
                                   col_names))

start_pos <- c(18, 19, 60, 364, 374, 377, 388)
end_pos <- c(18, 19, 60, 373, 376, 382, 389)

read_yrbs <- function(df, start, end)
  read_fwf(here("YRBSS data", df),
           fwf_positions(start_pos, end_pos,
                         c("sex", "grade", "smoke", "weight", "stratum", 
                           "psu", "race")))
yrbs2011 <- read_yrbs("yrbs2011.dat", start_pos, end_pos)
# works, now assemble list of all argument values

  
count(yrbs2011, race) # looks good

yrbs2011_svy <- as_survey_design(yrbs2011, ids = psu, strata = stratum,
                                 weights = weight)

yrbs2011_svy %>% 
  filter(!is.na(race)) %>% 
  group_by(race) %>% 
  summarize(pct = survey_mean()) %>% 
  mutate(across(starts_with("pct"), ~ 100 * .x))


