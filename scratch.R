# trends in diabetes

source("01-setup.R")
library(segmented)
library(broom)
library(magrittr)

percent <- function(x) 100 * x
inv_logit <- function(x) exp(x) / (1 + exp(x))

# crude prevalence
# linear trend
# observed values
prevalence_crude <- brfs_svy %>% 
  group_by(SURVYEAR) %>% 
  summarize(pct = survey_mean(diabetes == "Told have diabetes",
                              na.rm = TRUE, vartype = c("se", "ci"))) %>% 
  mutate(across(starts_with("pct"), percent))

# fitted values
prevalence_crude_linear_model <- 
  svyglm(I(diabetes == "Told have diabetes") ~ SURVYEAR, 
         design = brfs_svy, family = quasibinomial)

prevalence_crude_linear_trend <- prevalence_crude_linear_model %>% 
  augment(type.predict = "response") %>%
  # augment 
  distinct(SURVYEAR, .fitted) %>% 
  mutate(.fitted = 100 * .fitted) %>% 
  inner_join(prevalence_crude, by = "SURVYEAR")

# graph of prevalence by year with trend line added
ggplot(prevalence_crude_linear_trend, aes(x = SURVYEAR)) +
  labs(title = "Prevalence of diabetes (crude)",
       caption = "Trend is not statistically significant",
       y = "Percent", x = NULL) +
  geom_point(aes(y = pct)) + # add weights?
  geom_line(aes(y = .fitted), linetype = "dotted") +
  scale_x_continuous(breaks = 2011:2019) +
  scale_y_continuous(limits =
                       c(floor(min(prevalence_crude_linear_trend$pct_low)),
                         ceiling(max(prevalence_crude_linear_trend$pct_upp))
                       )) +
  new_theme +
  theme(legend.position = "none")

# age-adjusted prevalence
# linear trend
# observed values
prevalence_adj <- brfs_age_adj %>% 
  group_by(SURVYEAR) %>% 
  summarize(pct = survey_mean(diabetes == "Told have diabetes",
                              na.rm = TRUE, vartype = c("se", "ci"))) %>% 
  mutate(across(starts_with("pct"), percent))

# fitted values
prevalence_adj_linear_model <- 
  svyglm(I(diabetes == "Told have diabetes") ~ SURVYEAR, 
         design = brfs_age_adj, family = quasibinomial)

prevalence_adj_linear_trend <- prevalence_adj_linear_model %>% 
  augment(type.predict = "response", interval = "confidence") %>%
  # apparently ignoring interval argument?
  distinct(SURVYEAR, .fitted) %>% 
  mutate(.fitted = 100 * .fitted) %>% 
  inner_join(prevalence_adj, by = "SURVYEAR")

# graph of prevalence by year with trend line added
ggplot(prevalence_adj_linear_trend, aes(x = SURVYEAR)) +
  labs(title = "Prevalence of diabetes, age-adjusted",
       caption = "Trend is not statistically significant",
       y = "Percent", x = NULL) +
  geom_point(aes(y = pct)) + # add weights?
  geom_line(aes(y = .fitted), linetype = "dotted") +
  scale_x_continuous(breaks = 2011:2019) +
  scale_y_continuous(limits =
                       c(floor(min(prevalence_adj_linear_trend$pct_low)),
                         ceiling(max(prevalence_adj_linear_trend$pct_upp))
                       )) +
  new_theme +
  theme(legend.position = "none")

# OK TO HERE --------------------------------------------------------------


# Trend by age group ------------------------------------------------------
prevalence_crude_age <- brfs_svy %>% 
  group_by(SURVYEAR, agegrp3) %>% 
  summarize(pct = survey_mean(diabetes == "Told have diabetes",
                              na.rm = TRUE, vartype = c("se", "ci"))) %>% 
  drop_na() %>% 
  mutate(across(starts_with("pct"), percent)) %>% 
  arrange(agegrp3, SURVYEAR) %T>% 
  write_csv("prevalence_by_age.csv")
# Joinpoint shows prevalence slightly decreasing (APC = -1.42)
# fit models by agegroup using modelr (?)

prevalence_crude_age %>% 
  ggplot(aes(x = SURVYEAR, y = pct, linetype = agegrp3, shape = agegrp3)) +
  geom_line() +
  geom_point()

# fit multiple models
f3 <- function(df) {
  as_survey_design(df, strata = c(SURVYEAR, X.STSTR), weights = X.LLCPWT)  
  }

f4 <- function(svy) {
  svyglm(I(diabetes == "Told have diabetes") ~ SURVYEAR, design = svy, 
         family = quasibinomial)
  }

f5 <- function(svyglm) {
  augment(svyglm, type.predict = "response", interval = "confidence") %>%
    distinct(SURVYEAR, .fitted) %>% 
    # add intervals here?
    mutate(.fitted = as.numeric(.fitted))
  }

chk1 <- brfs_dat %>% 
  group_by(agegrp3) %>% 
  nest() %>% 
  drop_na() %>% 
  mutate(surveys = map(data, f3)) %>% 
  mutate(models = map(surveys, f4)) %>% 
  mutate(results = map(models, f5)) %>% 
  unnest(cols = results) %>% 
  select(agegrp3, SURVYEAR, .fitted)
# looking good so far--need to add observed prevalence for graphing

# diabetes by year as cell means regression model
prevalence_crude_trend <- 
  svyglm(I(diabetes == "Told have diabetes") ~ 1, 
         design = brfs_svy, family = quasibinomial) %>% 
  svypredmeans(~ factor(SURVYEAR)) %>% 
  merge(confint(.), by = "row.names") %>% 
  setNames(c("SURVYEAR", "pct", "pct_se", "pct_low", "pct_upp")) %>% 
  mutate(across(starts_with("pct"), percent),
         wgt = 1 / pct_se ^ 2,
         SURVYEAR = as.numeric(SURVYEAR)) %T>% 
         # SURVYEAR = as.numeric(SURVYEAR)) 
  write_csv("prevalence_crude_trend.csv")

prevalence_crude_graph <- 
  inner_join(prevalence_crude_data, prevalence_crude_linear_trend)
  ggplot(prevalence_crude_data, 
         aes(x = SURVYEAR, y = pct)) +
  labs(title = "Prevalence of diabetes (crude)",
       y = "Percent", x = NULL) +
  geom_point(aes(size = wgt)) +
  geom_line(linetype = "dotted") +
  scale_x_continuous(breaks = 2011:2019) +
  scale_y_continuous(limits =
                       c(floor(min(prevalence_crude_data$pct_low)),
                         ceiling(max(prevalence_crude_data$pct_upp))
                       )) +
  new_theme +
  theme(legend.position = "none")
  
  
# Joinpoint indicates trend is stable; no knots

# compare next results with previous--should be same
chk1 <- brfs_svy %>% 
  group_by(SURVYEAR) %>% 
  summarize(pct = survey_mean(diabetes == "Told have diabetes",
                              na.rm = TRUE, vartype = c("se", "ci"))) %>% 
  mutate(across(starts_with("pct"), percent),
         wgt = 1 / pct_se ^ 2) %>% 
  lm(log(pct) ~ SURVYEAR, weights = wgt, data = .) %>% 
  augment(interval = "confidence") %>% 
  mutate(across(c(.fitted, .lower, .upper), exp)) %>% 
  mutate(pct = exp(`log(pct)`)) 

chk1 %>% 
  ggplot(aes(x = SURVYEAR)) +
  labs(title = "Prevalence of diabetes",
       y = "Percent",
       caption = "Data source: New Hampshire BRFSS") +
  geom_point(aes(y = pct)) +
  scale_size_area() +
  geom_line(aes(y = .fitted), linetype = "dashed") +
  scale_x_continuous(breaks = 2011:2019) +
  scale_y_continuous(limits = c(floor(min(chk1$`.lower`)), 
                                ceiling(max(chk1$`.upper`)))) +

  new_theme
# OK TO HERE--refine graph
  
# rough graph
# ggplot(prevalence_crude_trend, aes(x = SURVYEAR, y = pct)) +
#   geom_point()

trend_model <- 
  lm(log(pct) ~ SURVYEAR, weights = wgt, data = prevalence_crude_data) #%>% 
  #summary()
# get APC
exp(trend_model$coefficients[2]) - 1 # 0.61 APC


chk1 <- augment(trend_model, 
                # data = prevalence_crude_trend,
        interval = "confidence") %>% 
  mutate(across(c(.fitted, .lower, .upper), exp)) %>% 
  # use intervals from record-level data
  ggplot(aes(x = SURVYEAR)) +
  labs(title = "Prevalence of diabetes, NH BRFSS",
       y = "Percent",
       caption = "Trend is stable\nData source: New Hampshire BRFSS") + 
  geom_point(aes(y = pct)) +
  geom_line(aes(y = .fitted), linetype = "dotted") +
  scale_x_continuous(breaks = 2011:2019) +
  new_theme
ggsave("diabetes_trend.png")



brfs_fit <- svyglm(I(X.BMI5CAT == "Obese") ~ seg1 + seg2, design = brfs_model,
                   family = quasibinomial)

seg_model <- segmented(trend_model, ~ SURVYEAR)
summary(seg_model)
joinpoint <- round(as.vector(seg_model$psi[, "Est."]))
slope(seg_model, APC = TRUE)

# trend with record level data
 


                                   
                                   
