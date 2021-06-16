library(here)
library(tidyverse)
library(srvyr)

# this function reads the national files for each year and joins them into an 
#   annual data table 
# modify to add ever-smoked question as second argument
readYRBS <- function(yr) {
  readRDS(here("YRBSS", "data", paste(yr, "main.rds"))) %>% 
    mutate(svy_year = yr) %>% 
    # # add code to harmonize ever-smoked, grade, race-Hispanic, sex as below
    mutate(smoking = case_when(
      svy_year == 1991                 ~ q22,
      svy_year %in% c(1993, 2001:2009) ~ q28,
      svy_year %in% c(1995:1997)       ~ q26,
      svy_year == 1999                 ~ q27,
      svy_year == 2011                 ~ q29)) %>%
    # mutate(race_eth = case_when(
    #   # 1991-1997
    #   svy_year %in% 1991:1997 & q4 %in% 1:3 ~ q4,
    #   svy_year %in% 1991:1997 & q4 %in% 4:6 ~ 4,
    #   # 1999- 2005
    #   svy_year %in% 1999:2005 & q4 == 6               ~ 1,
    #   svy_year %in% 1999:2005 & q4 == 3               ~ 2,
    #   svy_year %in% 1999:2005 & q4 %in% c(4, 7)       ~ 3,
    #   svy_year %in% 1999:2005 & q4 %in% c(1, 2, 5, 8) ~ 4,
    # # 2007-2011
    # # svy_year %in% 2007:2011 & raceeth == 5            ~ 1,
    # # svy_year %in% 2007:2011 & raceeth == 3            ~ 2,
    # # svy_year %in% 2007:2011 & raceeth %in% 6:7        ~ 3,
    # # svy_year %in% 2007:2011 & raceeth %in% c(1,2,4,8) ~ 4,
    # TRUE ~ NA_real_))
    select(svy_year, smoking)
    # relocate(svy_year)
  }

chk1 <- readYRBS(1991)
yrbss_svy <- map_dfr(seq(1991, 2011, 2), readYRBS) %>% 
  unnest(cols = svy_year) 

chk2 <- count(yrbss_svy, svy_year, smoking)
# this works
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
