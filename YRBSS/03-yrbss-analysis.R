# number and location of joinpoints

marginals <- 
  svyglm(I(smoking == "Yes") ~ sex + race_eth + grade,
         design = yrbss_svy, family = quasibinomial)

means_for_segmented <- svypredmeans(marginals, ~ svy_year) %>% 
  as_tibble(bind_cols(coef(.), SE(.)), rownames = "svy_year") %>% 
  mutate(wgt = mean/(SE^2),
         yr = 1:nrow(.)) %>% 
  poly_add_columns(yr, 3)

model1 <- lm(mean ~ yr1 + yr2 + yr3, weights = wgt, data = means_for_segmented)
model1_seg <- segmented(model1, npsi = 2)
knot <- round(as.vector(model1_seg$psi[, "Est."]))

slope(model1_seg, APC = TRUE)
