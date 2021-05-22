library(here)
library(SAScii)
library(tidyverse)
library(srvyr)
library(survey)

# yrbs2011 <- 
#   read_fwf(here("YRBSS data", "yrbs2011.dat"),
#                 fwf_positions(c(18, 19, 60, 364, 374, 377, 388),
#                               c(18, 19, 60, 373, 376, 382, 389),
#                               
#            col_names = 
#              c("sex", "grade", "eversmoke", "weight", "stratum", "psu", "race")),
#            na = ".") 

# ever smoked question
# 1991:            q23
# 1993, 2001-2009: q28
# 1995-1997:       q26
# 1999:            q27
# 2011:            q29

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

# all begin positions followed by all end positions
yrs <- seq(1991, 2011, 2)
begin_pos <- list(c(2, 3, 23, 76, 86, 84, 4),
                  c(2, 3, 28, 88, 103, 98, 4),
                  c(2, 3, 26, 89, 106, 101, 4),
                  c(2, 3, 26, 90, 107, 102, 4),
                  c(2, 3, 41, 107, 115, 118, 4),
                  c(2, 3, 42, 110, 124, 118, 4),
                  c(2, 3, 43, 216, 230, 224, 4),
                  c(18, 19, 53, 258, 375, 370, 20),
                  c(18, 19, 59, 358, 375, 370, 384),
                  c(18, 19, 59, 363, 373, 376, 393),
                  c(18, 19, 60, 364, 374, 377, 388))

end_pos <- list(c(2, 3, 23, 83, 88, 85, 4),
                c(2, 3, 28, 97, 106, 102, 4),
                c(2, 3, 26, 100, 108, 105, 4),
                c(2, 3, 26, 101, 109, 106, 4),
                c(2, 3, 41, 114, 117, 123, 4),
                c(2, 3, 42, 117, 126, 123, 4),
                c(2, 3, 43, 223, 232, 229, 4),
                c(18, 19, 53, 369, 378, 374, 21),
                c(18, 19, 59, 369, 378, 374, 385),
                c(18, 19, 59, 372, 375, 382, 394),
                c(18, 19, 60, 373, 376, 382, 389))

f1 <- function(year, data_file, begin, end) {
  read_fwf(here("YRBSS data", data_file),
           fwf_positions(begin, end,
                         col_names = 
                           c("sex", "grade", "eversmoke", "weight", "stratum", 
                             "psu", "race")),
           na = ".") %>%
    mutate(survyear = year) %>% 
    relocate(survyear)
  }
yrbs2011 <- f1(yrs[11], "yrbs2011.dat", begin_pos[[11]], end_pos[[11]])

# assemble data frame with data files, begin vectors and end vectors as
#   list-columns

# get marginal estimates of ever smoked adjusting for sex, race, grade
# yrbs2011 <- read.SAScii(here("YRBSS data", "yrbs2011.dat"),
#                         here("YRBSS data", "YRBS_2011_SAS_Input_Program.sas"),
#                         beginline = 23, lrecl = 400)


setwd("YRBSS data")
yrbs2011 <- read.SAScii("yrbs2011.dat", "YRBSS data/YRBS_2011-input.txt",
                        beginline = 24, lrecl = 400)
