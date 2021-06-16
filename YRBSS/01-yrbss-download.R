# download YRBSS national files from 1991 to 2011

# install {lodown} package
# devtools::install_github("ajdamico/lodown")

library(lodown)
library(here)

# download YRBSS catalog
yrbss_cat <- get_catalog("yrbss",
                        output_dir = file.path(path.expand( "~" ), "YRBSS"))
save(yrbss_cat, file = here("YRBSS", "nhis_cat.Rdata"))

# download data files from 1991, 1993, ..., 2011
lodown("yrbss", subset(yrbss_cat, year %in% 1991:2011),
       output_dir = file.path(path.expand( "~" ), "YRBSS"))

# # construct year-specific recodes so that
# # "ever smoked a cigarette" // grade // sex // race-ethnicity align across 
# #   years
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
