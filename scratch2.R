# standard parameterization per Joinpoint software; "Parameterization B" per
#   NCHS guidelines

# modified theme for graphs
new_theme <- theme_bw() + 
  theme(axis.title.x = element_blank(),
        legend.title = element_blank(),
        aspect.ratio = 0.62)

# get estimates as cell means model to feed to segmented()
cell_means_model <- svyglm(I(X.BMI5CAT == "Obese") ~ 1, 
                              design = subset(brfs_svy, SEX == "Female"), 
                              family = quasibinomial) %>% 
  svypredmeans(~ factor(SURVYEAR)) 

# data frame with estimates, std. errors, confints  
trend_data <- cell_means_model %>% 
  cbind(SE(.), confint(.)) %>% 
  as_tibble(rownames = "SURVYEAR", .name_repair = "unique") %>% 
  setNames(c("SURVYEAR", "pct", "pct_se", "pct_low", "pct_upp")) %>% 
  mutate(across(starts_with("pct"), function(x) 100 * x),
         wgt = 1 / pct_se ^ 2,
         SURVYEAR = as.numeric(SURVYEAR)) 

# get joinpoint         
trend_model <- lm(log(pct) ~ SURVYEAR, weights = wgt, data = trend_data)
seg_model<- segmented(trend_model, ~ SURVYEAR)
summary(seg_model)
joinpoint <- round(as.vector(seg_model$psi[, "Est."]))

# fit joinpoint model with identified changepoint
# using standard parameterization
brfs_model <- brfs_svy %>% 
  mutate(seg1 = ifelse(SURVYEAR <= joinpoint, SURVYEAR, joinpoint),
         seg2 = ifelse(SURVYEAR <= joinpoint, 0, SURVYEAR - joinpoint))
brfs_fit <- svyglm(I(X.BMI5CAT == "Obese") ~ seg1 + seg2, design = brfs_model,
                   family = quasibinomial)

# get APC
tidy(brfs_fit, conf.int = TRUE) %>% 
  filter(term != "(Intercept)") %>% 
  mutate(across(c(estimate, starts_with("conf")),
                ~ 100 * (exp(.x) - 1)))

# graph trend with line segments
augment(brfs_fit) %>% 
  mutate(SURVYEAR = seg1 + seg2) %>% 
  distinct(SURVYEAR, `.fitted`) %>% 
  mutate(SURVYEAR = 2011:2019,
         pct_fitted = 100 * as.numeric(boot::inv.logit(`.fitted`))) %>% 
  inner_join(trend_data, by = "SURVYEAR") %>% 
  ggplot() +
  ggtitle("Prevalence of obesity, NH BRFSS") +
  geom_point(aes(x = SURVYEAR, y = pct)) +
  geom_line(aes(x = SURVYEAR, y = pct_fitted)) +
  scale_x_continuous(breaks = 2011:2019) +
  ylab("Percent") +
  theme_bw() +
  theme(axis.title.x = element_blank(),
        aspect.ratio = 0.62)

# alternate parameterization
spline_data <- brfs_svy %>% 
  mutate(year_knot = 
           if_else(SURVYEAR > joinpoint, SURVYEAR - joinpoint, 0)) 
spline_model <- spline_data %>% 
  svyglm(I(X.BMI5CAT == "Obese") ~ SURVYEAR + year_knot, design = .,
         family = quasibinomial)


one_joinpoint <- function(svy = brfs_svy, var, demo) {
  survey_subset <- filter(svy, {{ var }} == demo)
  cell_means_model <- svyglm(I(X.BMI5CAT == "Obese") ~ 1, 
                             design = survey_subset, 
                             family = quasibinomial) %>% 
    svypredmeans(~ factor(SURVYEAR)) 
  trend_data <- cell_means_model %>% 
    cbind(SE(.), confint(.)) %>% 
    as_tibble(rownames = "SURVYEAR", .name_repair = "unique") %>% 
    setNames(c("SURVYEAR", "pct", "pct_se", "pct_low", "pct_upp")) %>% 
    mutate(across(starts_with("pct"), function(x) 100 * x),
           wgt = 1 / pct_se ^ 2,
           SURVYEAR = as.numeric(SURVYEAR)) 

  trend_model <- lm(log(pct) ~ SURVYEAR, weights = wgt, data = trend_data)
  seg_model<- segmented(trend_model, ~ SURVYEAR)
  joinpoint <- round(as.vector(seg_model$psi[, "Est."]))
  
  brfs_model <- survey_subset %>% 
    mutate(seg1 = ifelse(SURVYEAR <= joinpoint, SURVYEAR, joinpoint),
           seg2 = ifelse(SURVYEAR <= joinpoint, 0, SURVYEAR - joinpoint))
  brfs_fit <- svyglm(I(X.BMI5CAT == "Obese") ~ seg1 + seg2, design = brfs_model,
                     family = quasibinomial)
  augment(brfs_fit) %>% 
    mutate(SURVYEAR = seg1 + seg2) %>% 
    distinct(SURVYEAR, `.fitted`) %>% 
    mutate(SURVYEAR = 2011:2019,
           pct_fitted = 100 * boot::inv.logit(`.fitted`)) %>% 
    mutate(across(where(~ class(.x) == "svystat"), as.numeric)) %>% 
    mutate(subpop = demo) %>% 
    relocate(subpop) %>% 
    inner_join(trend_data, by = "SURVYEAR") 
  }

one_joinpoint(brfs_svy, X.STATE)


bind_rows(one_joinpoint(brfs_svy, var = SEX, demo = "Male"),
          one_joinpoint(brfs_svy, var = SEX, demo = "Female")) %>% 
  mutate(SEX = factor(subpop, c("Male", "Female"))) %>% 
  ggplot() +
  ggtitle("Prevalence of obesity, NH BRFSS") +
  geom_point(aes(x = SURVYEAR, y = pct, shape = SEX)) +
  geom_line(aes(x = SURVYEAR, y = pct_fitted, linetype = SEX)) +
  scale_x_continuous(breaks = 2011:2019) +
  ylab("Percent") +
  new_theme
  











