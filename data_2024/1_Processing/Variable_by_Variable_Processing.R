
# Parse the plant number (of the form JC-W-WCP-SHX) to a plant number (1) and the site initials
#   Since all individuals are from WCP, they all have the same initials "SH"
health_assess_2024 <- health_assess_2024 %>% mutate(plant_initials = "SH") 

health_assess_2024 <- health_assess_2024 %>% mutate(plant_number =as.numeric(str_extract(plant_number, "\\d+$")))

# Seeds per bunch
#   For those producing seed with some information in seeds_per_bunch, standardized to the same outputs as others
health_assess_2024 <- health_assess_2024 %>% mutate(seed_per_bunch = case_when(
  parse_number(seed_per_bunch) <= 50 ~ "Few (<50)",
  parse_number(seed_per_bunch) > 50 ~ "Lots (>50)",
  TRUE ~ NA
))
