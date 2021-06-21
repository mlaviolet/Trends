# devtools::install_github("ajdamico/lodown")
library(lodown)
# http://asdfree.com/youth-risk-behavior-surveillance-system-yrbss.html

yrbss_cat <- 
  get_catalog("yrbss", output_dir = file.path(path.expand("~"), "YRBSS"), 
              catalog = yrbss)

lodown("yrbss", yrbss_cat)

setwd("C:/Users/ML/Documents/YRBSS")

df <- list.files(pattern = ".rds") 

# remove 1998 file
df_list <- lapply(df[-5], readRDS)

df_list <- setNames(df_list, paste0("YRBSS", seq(1991, 2019, 2)))
lapply(df_list, dim)

save(yrbss_cat, df_list, file = "YRBSS.Rdata")
