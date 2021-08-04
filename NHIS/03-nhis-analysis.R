library(tidyverse)
library(here)
library(srvyr)
library(survey)
library(segmented)
library(broom)

load(file = here("NHIS", "data", "nhis.Rdata"))

# Inital assessment of nonlinearity ---------------------------------------
# model0 <- 
#   svyglm(I(anyeruse == "One or more") ~ 
#            srvy_yr1 + srvy_yr2 + srvy_yr3 + srvy_yr4,
#          subset(nhis_svy, instype == "Private"), 
#          family = quasibinomial(log), start = c(-0.5, rep(0, 4)))
# summary(model0)
# # results agree with Table B
# # check for probabilities in [0,1]
# model0_results <- augment(model0)
# summary(exp(model0_results$`.fitted`))

type_list <- c("Private", "Medicaid", "Uninsured")
get_model <- function(coverage) {
  svyglm(I(anyeruse == "One or more") ~ 
           srvy_yr1 + srvy_yr2 + srvy_yr3 + srvy_yr4,
         subset(nhis_svy, instype == coverage), 
         family = quasibinomial(log), start = c(-0.5, rep(0, 4))) %>% 
    summary()
  }

model_list <- map(type_list, get_model) %>% 
  setNames(type_list)

# Number and location of changepoints -------------------------------------
# Private coverage
# WORKAROUND--current version of selgmented() can't find vectors within
#   data frame--break data into individual vectors
# use this model when selgmented() is fixed
# model1 <- lm(log(pct) ~ srvy_yr, weights = wgt, 
#              data = subset(results, instype == "Private"))
private <- subset(results, instype == "Private")
log_pct <- log(private$pct)
srvy_yr <- 0:15
wgt <- private$wgt
model1 <- lm(log_pct ~ srvy_yr, weights = wgt)
selgmented(model1) # using default score method
# two knots at 2004 and 2010; Joinpoint gives 2010 and 2013
model1_seg <- segmented(model1, ~ srvy_yr, npsi = 2)
# segmented(model1, ~ srvy_yr, npsi = 2)

# knots at 2004, 2010
summary(model1_seg) 
knot <- round(as.vector(model1_seg$psi[, "Est."]))
# obtain the annual percent change (APC=) estimates for each time point
slope(model1_seg, APC = TRUE)

# Medicaid or other public
medicaid <- subset(results, instype == "Medicaid")
log_pct <- log(medicaid$pct)
srvy_yr <- 0:15
wgt <- medicaid$wgt
model2 <- lm(log_pct ~ srvy_yr, weights = wgt)
selgmented(model2) # using default score method
# gives knots at 2004 and 2010; Joinpoint gives no knots

model2 <- lm(log(pct) ~ srvy_yr, weights = wgt, 
             data = subset(results, instype == "Medicaid"))
# selgmented() with type = "davies" shows no knots, same as NCHS
tidy(model2) %>% 
  filter(term != "(Intercept)")

model2_seg <- segmented(model1, ~ srvy_yr)
# one knot at 2012
summary(model2_seg) 
knot <- round(as.vector(model2_seg$psi[, "Est."]))
# obtain the annual percent change (APC=) estimates for each time point
slope(model2_seg, APC = TRUE)

# uninsured
uninsured <- subset(results, instype == "Uninsured")
log_pct <- log(uninsured$pct)
srvy_yr <- 0:15
wgt <- uninsured$wgt
model3 <- lm(log_pct ~ srvy_yr, weights = wgt)
selgmented(model3) # using default score method
# gives knots at 2004 and 2010; Joinpoint gives no knots

#                  Joinpoint      selgmented()
# uninsured       one (2010)   two (2006, 2010)
# medicaid              none   two (2004, 2010)
# private   two (2010, 2013)   two (2004, 2010)
# selgmented uses default score method



model3 <- lm(log(pct) ~ srvy_yr, weights = wgt, 
             data = subset(results, instype == "Medicaid"))

# Slope estimates and trend tests -----------------------------------------
model2 <- nhis_svy %>% 
  filter(instype == "Medicaid") %>% 
  mutate(seg1 = ifelse(srvy_yr <= knot, srvy_yr, knot),
         seg2 = ifelse(srvy_yr <= knot, 0, srvy_yr - knot)) %>% 
  svyglm(I(anyeruse == "One or more") ~ seg1 + seg2, design = .,
         family = quasibinomial(log), start = c(-0.5, 0, 0))

tidy(model2, conf.int = TRUE) %>% 
  filter(term != "(Intercept)") %>% 
  mutate(across(c(estimate, conf.low, conf.high), ~ 100 * (exp(.x) - 1))) %>% 
  select(term, APC = estimate, APC_low = conf.low, APC_upp = conf.high)

# Medicaid, no knot
model2a <- nhis_svy %>% 
  filter(instype == "Medicaid", agegrp == "18-64") %>% 
  svyglm(I(anyeruse == "One or more") ~ srvy_yr, design = .,
         family = quasibinomial(log), start = c(-0.5, 0)) %>% 
  tidy(conf.int = TRUE) %>% 
  filter(term != "(Intercept)") %>% 
  mutate(across(c(estimate, conf.low, conf.high), ~ 100 * (exp(.x) - 1))) %>% 
  select(term, APC = estimate, APC_low = conf.low, APC_upp = conf.high)

nhis_svy %>% 
  filter(instype == "Medicaid", agegrp == "18-64") %>% 
  mutate(timept = srvy_yr - 2000) %>% 
  mutate(anyeruse_b = as.numeric(anyeruse) - 1) %>% 
  svyglm(I(anyeruse_b == 1) ~ timept, design = ., family = quasibinomial)


  



