library(tidyverse)
library(here)
library(srvyr)

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
# dat_files <- paste0("\"", dat_files, "\"")
# dat_files <- as.list(paste0("\"", dat_files, "\""))

read_yrbs <- function(df, start, end) {
  read_fwf(here("YRBSS data", df),
           fwf_positions(start, end,
                         c("sex", "grade", "smoke", "weight", "stratum", 
                           "psu", "race"))) %>% 
    mutate(survyear = df) %>% 
    relocate(survyear)
  }

yrbs_all_dat <- list(11)
for(i in 1:length(dat_files)) {
  yrbs_all_dat[[i]] <- 
    read_yrbs(dat_files[i], begin_list[[i]], end_list[[i]]) 
  }

# FINALLY  
yrbs_dat <- bind_rows(yrbs_all_dat) %>% 
  mutate(survyear = as.numeric(str_sub(survyear, 5, 8)))
rm(i, begin_list, end_list, yrbs_all_dat, col_names, dat_files, read_yrbs)
  
# read_yrbs(dat_files[1], begin_list[[1]], end_list[[1]])

count(yrbs_dat, survyear)
save(yrbs_dat, file = here("YRBSS data", "yrbs.Rdata"))

# OK TO HERE --------------------------------------------------------------



dat_yrbs <- list(dat_files, begin_list, end_list) 




dat <- list(dat_files, begin_list, end_list) %>% 
  set_names(c("datafile", "begin", "end"))

map2(begin_list, end_list, `+`)
map2(begin_list, end_list, ~ .x + .y)

map2(dat_files, begin_list, ~ paste(.x, .y) )



yrbs_all_dat <- tibble(
  data_file = map_chr(dat_files)
  
  
)




pmap(dat_files, begin_list, end_list, ~ paste(..1, ..2, ..3) )


yrbs_all_dat <- 
  map_dfr(dat_files, begin_list, end_list,
          ~ read_fwf(here("YRBSS data", ..1),
                     fwf_positions(..2, ..3,
                                   c("sex", "grade", "smoke", "weight", 
                                     "stratum", "psu", "race"))))
                        
                        


read_yrbs <- function(df, start, end)
  read_fwf(here("YRBSS data", df),
           fwf_positions(start, end,
                         c("sex", "grade", "smoke", "weight", "stratum", 
                           "psu", "race")))

yrbs_all_dat <- tibble(year = seq(1991, 2011, 2),
                       yrbs_dat = dat_files,
                       begin = begin_list,
                       end = end_list)
pmap_dfr(yrbs_all_dat, function(df, start, end)
  read_fwf(here("YRBSS data", df),
           fwf_positions(start, end,
                         c("sex", "grade", "smoke", "weight", "stratum", 
                           "psu", "race"))))

%>% 
  # PROBLEM HERE--USE map() INSTEAD?
  mutate(smoke = read_yrbs(yrbs_dat, begin, end))

# big_list <- list(dat_files, begin_list, end_list)
# map(~ read_yrbs(.big_list))

read_yrbs("YRBS2011.dat", begin_list[[11]], end_list[[11]])

map(yrbs_all_dat, ~ read_yrbs())

yrbs1993 <- read_fwf(here("YRBSS data", "YRBS1993.dat"),
                     fwf_positions(begin_list[[2]], end_list[[2]],
                                   col_names))







yrbs2009 <- read_yrbs("yrbs2009.dat", begin_list[[10]], end_list[[10]])
# works, now assemble list of all argument values

  
count(yrbs2011, race) # looks good

yrbs2011_svy <- as_survey_design(yrbs2011, ids = psu, strata = stratum,
                                 weights = weight)

yrbs2011_svy %>% 
  filter(!is.na(race)) %>% 
  group_by(race) %>% 
  summarize(pct = survey_mean()) %>% 
  mutate(across(starts_with("pct"), ~ 100 * .x))


yrbs1991 <- read_yrbs("YRBS1991.dat", begin_list[[1]], end_list[[1]] )
yrbs1993 <- read_yrbs("YRBS1993.dat", begin_list[[2]], end_list[[2]] )
yrbs2011 <- read_yrbs("yrbs2011.dat", begin_list[[11]], end_list[[11]] )
