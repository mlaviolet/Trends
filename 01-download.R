# download data and users' guide for YRBSS 1991-2019
library(here)
library(purrr)

yrs <- seq(2013, 1991, -2)

# download data files
yrbs_url <- c(
  "https://www.cdc.gov/healthyyouth/data/yrbs/files/2019/XXH2019_YRBS_Data.zip",
  "https://www.cdc.gov/healthyyouth/data/yrbs/files/2017/XXH2017_YRBS_Data.zip",
  "https://www.cdc.gov/healthyyouth/data/yrbs/files/YRBS2015.zip",
  paste0("ftp://ftp.cdc.gov/pub/data/yrbs/", yrs, "/YRBS", yrs, ".zip"))
yrbs_files <- c("XXH2019_YRBS_Data.zip", "XXH2017_YRBS_Data.zip",
                paste0("YRBS", seq(2015, 1991, -2), ".zip"))
walk2(yrbs_url, here("YRBSS data", yrbs_files), download.file, mode = "wb")

# unzip Access files
walk(here("YRBSS data", yrbs_files), unzip, exdir = "YRBSS data")

# unzip user guides
yrbs_pdf_url <- c(
"https://www.cdc.gov/healthyyouth/data/yrbs/pdf/2019/2019_National_YRBS_Data_Users_Guide.pdf",
"https://www.cdc.gov/healthyyouth/data/yrbs/pdf/2017/2017_YRBS_Data_Users_Guide.pdf",
"https://www.cdc.gov/healthyyouth/data/yrbs/pdf/2015/2015_yrbs-data-users_guide_smy_combined.pdf",
  paste0("ftp://ftp.cdc.gov/pub/data/yrbs/", yrs, "/YRBS_", yrs, "_National_User_Guide.pdf"))

yrbs_pdf_files <- c(
  "2019_National_YRBS_Data_Users_Guide.pdf",
  "2017_YRBS_Data_Users_Guide.pdf",
  "2015_yrbs-data-users_guide_smy_combined.pdf",
  paste0("YRBS_", yrs, "_National_User_Guide.pdf"))

walk2(yrbs_pdf_url, here("YRBSS data", yrbs_pdf_files), download.file, 
      mode = "wb")
  