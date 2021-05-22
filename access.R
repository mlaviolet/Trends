# reproduce results from CDC YRBSS trend analysis document from 2014
# run 01-download.R script first 

library(here)
library(DBI)
library(dbplyr)
library(tidyverse)
library(srvyr)
library(survey)
# also using {odbc}

# ever smoked question
# 1991:            q23
# 1993, 2001-2009: q28
# 1995-1997:       q26
# 1999:            q27
# 2011:            q29
smoke_questions <- 
  c(paste0("Q", c(23, 28, 26, 26, 27, rep(28, 5), 29)))

# check process with 1991 survey                            

yrs <- seq(1991, 2011, 2)

con1991 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs1991.mdb")
con1993 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs1993.mdb")
con1995 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs1995.mdb")
con1997 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs1997.mdb")
con1999 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs1999.mdb")
con2001 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs2001.mdb")
con2003 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs2003.mdb")
con2005 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs2005.mdb")
con2007 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs2007.mdb")
con2009 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs2009.mdb")
con2011 <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs2011.mdb")

yrbs_all_years <- 
  data.frame(year = yrs, 
             connections = c(con1991, con1993, con1995, con1997, con1999, 
                             con2001, con2003, con2005, con2007, con2009, 
                             con2011))


  mutate(con_strings = make_string(year)) %>% 
  mutate(connections = make_con(con_strings))


# lapply(con_list, dbDisconnect)

get_table <- function(df) {
  tbl(df, "XXHq")
  }

# OK TO HERE --------------------------------------------------------------
make_string <- function(x) 
  paste0("\"Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs", x, ".mdb\"")
make_con <- function(x) dbConnect(odbc::odbc(), con_string = x)

yrbs_all_years <- data.frame(year = yrs) %>% 
  mutate(con_strings = make_string(year)) %>% 
  mutate(connections = make_con(con_strings))

con <-
  dbConnect(odbc::odbc(),
            .connection_string = yrbs_all_years[1,2])



             con_string = 
               paste0("Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs", yrs, ".mdb"))



lapply(yrs, make_string)




make_connection <- function(x) dbConnect(odbc::odbc, .connection_string = x)





str1 <- paste0("\"Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs", 1991, ".mdb\"")



dbConnect(odbc::odbc, .connection_string = str1)

lapply(make_connection, yrs)

yrbs_all_years <- 
  data.frame(year = yrs,
             con_string = 
               paste0("Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs", yrs, ".mdb"))

yrbs_all_years <- yrbs_all_years %>% 
  mutate(connections = dbConnect(odbc:odbc: .connection_string = con_string))
# field names are caps 1991-2003; lower case 2005-2019
#
# data table called XXHq in all years
yr <- 2007
yrbs2007 <- yrbs2007_tbl %>% 
  select(sex = q2, grade = q3, race = raceeth, eversmoke = q28, psu, stratum, 
         weight) 
  # toupper()
  # setNames(toupper(colnames(.)))
  # if(yr == 2007) {
  # } else {
  #   select(sex = Q2, grade = Q3, raceeth, eversmoke = q28, psu, stratum, 
  #          weight) 
    # } 
  collect()
dbDisconnect(con)

# yrbs2007 <- yrbs2007_tbl %>% 
#   grepl("[a-z]", colnames(.))
#   colnames(.)
#   when (, "[a-z]") ~ cat("Lower case"))

# capitalization of field names not consistent year to year
# try purrr::when()
#   use colnames() contain at least one lowercase letter as test
#   maybe str_detect("[a-z]")
# https://stackoverflow.com/questions/30604107/r-conditional-evaluation-when-using-the-pipe-operator
# https://stackoverflow.com/questions/51833873/r-regex-match-at-least-1-lowercase-letter-1-number-and-no-special-characters

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

chk1 <- "this is a quote"
chk1

con <-
  dbConnect(odbc::odbc(),
            .connection_string =
              "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs2007.mdb")
yrbs2007_tbl <- tbl(con, "XXHq")

# con <-
#   dbConnect(odbc::odbc(),
#             .connection_string =
#               "Driver={Microsoft Access Driver (*.mdb, *.accdb)}; Dbq=C:/Users/michael.j.laviolette/Desktop/Trends/YRBSS data/yrbs1991.mdb")

