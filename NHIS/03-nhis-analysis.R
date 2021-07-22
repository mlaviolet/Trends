library(tidyverse)
library(here)
library(srvyr)
library(survey)
library(segmented)
library(broom)

load(file = here("NHIS", "data", "nhis.Rdata"))

# Inital assessment of nonlinearity ---------------------------------------
model0 <- 
  svyglm(I(anyeruse == "One or more") ~ 
           srvy_yr1 + srvy_yr2 + srvy_yr3 + srvy_yr4,
         subset(nhis_svy, instype == "Private"), 
         family = quasibinomial(log), start = c(-0.5, rep(0, 4)))
summary(model0)
# results agree with Table B
# check for probabilities in [0,1]
model0_results <- augment(model0)
summary(exp(model0_results$`.fitted`))

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
model1 <- lm(log(pct) ~ srvy_yr, weights = wgt, 
             data = subset(results, instype == "Medicaid"))

# selgmented(model1, ~srvy_yr)
# Error in eval(predvars, data, env) : object 'pct' not found
# WON'T WORK with weights argument or function of response variable

model1_seg <- segmented(model1, ~ srvy_yr)
# one knot at 2012
summary(model1_seg) 
knot <- round(as.vector(model1_seg$psi[, "Est."]))
# obtain the annual percent change (APC=) estimates for each time point
slope(model1_seg, APC = TRUE)

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
  filter(instype == "Medicaid") %>% 
  svyglm(I(anyeruse == "One or more") ~ srvy_yr, design = .,
         family = quasibinomial(log), start = c(-0.5, 0)) %>% 
  tidy(conf.int = TRUE) %>% 
  filter(term != "(Intercept)") %>% 
  mutate(across(c(estimate, conf.low, conf.high), ~ 100 * (exp(.x) - 1))) %>% 
  select(term, APC = estimate, APC_low = conf.low, APC_upp = conf.high)





