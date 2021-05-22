# download NHIS person and sample adult data files from 2000 to 2015

# install {lodown} package
# devtools::install_github("ajdamico/lodown")

library(lodown)
# download NHIS catalog
nhis_cat <- get_catalog("nhis",
                        output_dir = file.path(path.expand( "~" ), "NHIS"))
save(nhis_cat, file = "NHIS/nhis_cat.Rdata")

# download person and sample adult files from 2000-2015
lodown("nhis", subset(nhis_cat, year %in% 2000:2015 & 
                        type %in% c("personsx", "samadult")),
       output_dir = "NHIS/data")
# parsing failures in 2001--check out--key variables seem OK
