# download YRBSS national files from 1991 to 2011

# install {lodown} package
# devtools::install_github("ajdamico/lodown")

library(lodown)
library(here)

# download YRBSS catalog
yrbss_cat <- get_catalog("yrbss",
                        output_dir = file.path(path.expand( "~" ), "YRBSS"))
save(yrbss_cat, file = here("YRBSS", "nhis_cat.Rdata"))

# download data files from 1991, 1993, ..., 2011 in .rds format
lodown("yrbss", subset(yrbss_cat, year %in% 1991:2011),
       output_dir = file.path(path.expand( "~" ), "YRBSS"))

