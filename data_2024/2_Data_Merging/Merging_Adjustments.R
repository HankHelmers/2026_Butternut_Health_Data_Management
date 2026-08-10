
# Translate seedling_y_n to adult_or_seedling
health_assess_2024 <- health_assess_2024 %>% mutate(adult_or_seedling = case_when(
  seedling_y_n == "Y" ~ "Seedling",
  seedling_y_n == "N" ~ "Adult",
  TRUE ~ "Something went wrong."
))

# Remove this column once we have adult_or_seedling 
health_assess_2024 <- health_assess_2024 %>% select(-seedling_y_n)
