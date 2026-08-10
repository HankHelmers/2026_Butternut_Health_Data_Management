
# Parse the plant number (of the form JC-W-WCP-SHX) to a plant number (1) and the site initials
#   Since all individuals are from WCP, they all have the same initials "SH"
health_assess_2024 <- health_assess_2024 %>% mutate(plant_initials = "SH") 

health_assess_2024 <- health_assess_2024 %>% mutate(plant_number =as.numeric(str_extract(plant_number, "\\d+$")))

