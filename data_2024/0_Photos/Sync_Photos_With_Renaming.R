

# -----------------------------------------------------
# Create a camera column
health_assess_2024 <- health_assess_2024 %>% mutate(camera = NA)

# Need a first and last photo number...
health_assess_2024 <- health_assess_2024 %>% rename(first_photo = )
