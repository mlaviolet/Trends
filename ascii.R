# stack YRBSS data files 1991, 1993, ..., 2011 into a single data table
# keeping variables sex, grade, weight, stratum, psu
# analysis variable is ever smoked cigarettes, even one or two puffs (smoke)


library(tidyverse)
library(here)

col_names <- c("sex", "grade", "smoke", "weight", "stratum", "psu", "race")

begin_list <- list(c(2, 3, 23, 76, 87, 84, 4),
                   c(2, 3, 28, 88, 103, 98, 4),
                   c(2, 3, 26, 89, 106, 101, 4),
                   c(2, 3, 26, 90, 107, 102, 4),
                   c(2, 3, 41, 107, 115, 118, 4),
                   c(2, 3, 42, 110, 124, 118, 4),
                   c(2, 3, 43, 216, 230, 224, 4), 
                   c(18, 19, 53, 358, 375, 370, 20),
                   c(18, 19, 59, 358, 375, 370, 384),
                   c(18, 19, 59, 363, 373, 376, 393),
                   c(18, 19, 60, 364, 374, 377, 388))

end_list <- list(c(2, 3, 23, 83, 91, 86, 4),
                 c(2, 3, 28, 97, 107, 102, 4),
                 c(2, 3, 26, 100, 108, 105, 4),
                 c(2, 3, 26, 101, 109, 106, 4),
                 c(2, 3, 41, 114, 117, 123, 4),
                 c(2, 3, 42, 117, 126, 123, 4),
                 c(2, 3, 43, 223, 232, 229, 4),
                 c(18, 19, 53, 369, 378, 374, 21),
                 c(18, 19, 59, 369, 378, 374, 385),
                 c(18, 19, 59, 372, 375, 382, 394),
                 c(18, 19, 60, 373, 376, 382, 389))

dat_files <- c(paste0("YRBS", seq(1991, 2009, 2), ".dat"), "yrbs2011.dat")

read_yrbs <- function(df, start, end) {
  read_fwf(here("YRBSS data", df),
           fwf_positions(start, end,
                         c("sex", "grade", "smoke", "weight", "stratum", 
                           "psu", "race"))) %>% 
    mutate(survyear = df) %>% 
    relocate(survyear)
  }

yrbs_all_dat <- list()
for(i in 1:length(dat_files)) {
  yrbs_all_dat[[i]] <- 
    read_yrbs(dat_files[i], begin_list[[i]], end_list[[i]]) 
  }

# FINALLY  
yrbs_dat <- bind_rows(yrbs_all_dat) %>% 
  mutate(survyear = as.numeric(str_sub(survyear, 5, 8)))
rm(i, begin_list, end_list, yrbs_all_dat, col_names, dat_files, read_yrbs)
  
count(yrbs_dat, survyear)
save(yrbs_dat, file = here("YRBSS data", "yrbs.Rdata"))

# OK TO HERE --------------------------------------------------------------

