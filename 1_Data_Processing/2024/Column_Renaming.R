## Renaming columns & creating variables for readability

# Plant Height (ft)
health_assess_2024 <- health_assess_2024 %>% rename(plant_height_ft = `Plant height (ft)`)

# DBH
health_assess_2024 <- health_assess_2024 %>% rename(dbh_cm = `DBH (cm)`)

# % live canopy
health_assess_2024 <- health_assess_2024 %>% rename(percent_live_canopy = `Percent live canopy`)

# base_epicormics_2024
health_assess_2024 <- health_assess_2024 %>% rename(base_epicormics = `Number of epicormic branches/ sprouts from the base`)

# trunk_epicormics_2024
health_assess_2024 <- health_assess_2024 %>% rename(trunk_epicormics = `Number of epicormic branches/ sprouts from the trunk`)

# has_canker_2024
health_assess_2024 <- health_assess_2024 %>% rename(has_canker = `Visible cankers? (according to health assessment form)`)

# has_callous_2024
health_assess_2024 <- health_assess_2024 %>% rename(has_callous = `If large cankers present, are they being calloused over?`)

# trunk_canker_area_2024
health_assess_2024 <- health_assess_2024 %>% rename(trunk_canker_area = `Area of trunk infected by canker (%)`)

# base_canker_area_2024
health_assess_2024 <- health_assess_2024 %>% rename(base_canker_area = `Area of base/ root flare infected by canker (%)`)


# purdue_severity_2024
health_assess_2024 <- health_assess_2024 %>% rename(purdue_severity = `If trees are infected, severity of infection`)

# seedling_y_n_2024
health_assess_2024 <- health_assess_2024 %>% rename(seedling_y_n = `Seedling (Y/N)`)
