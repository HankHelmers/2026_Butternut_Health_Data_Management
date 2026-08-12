## Renaming columns & creating variables for readability

# ---------------
# Beginning questions

# site
health_assess_2024 <- health_assess_2024 %>% rename(site = `Site number or initial`)

# date
health_assess_2024 <- health_assess_2024 %>% rename(date = `Date Sampled`)

# Plant number
health_assess_2024 <- health_assess_2024 %>% rename(plant_number = `Sample ID`)

# Plant Height (ft)
health_assess_2024 <- health_assess_2024 %>% rename(plant_height_ft = `Plant height (ft)`)

# Site owner 
health_assess_2024 <- health_assess_2024 %>% rename(site_owner = `Site Owner`)

# Lat / long
health_assess_2024 <- health_assess_2024 %>% rename(gps_north = Latitude)
health_assess_2024 <- health_assess_2024 %>% rename(gps_west = Longitude)

# DBH
health_assess_2024 <- health_assess_2024 %>% rename(dbh_cm = `DBH (cm)`)

# Slope
health_assess_2024 <- health_assess_2024 %>% rename(slope = Slope)

# Aspect
health_assess_2024 <- health_assess_2024 %>% rename(aspect = Aspect)

# Producing seed
health_assess_2024 <- health_assess_2024 %>% rename(producing_seed = `Producing seed?`)

# ---------------
# Health characters

# % live canopy
health_assess_2024 <- health_assess_2024 %>% rename(percent_live_canopy = `Percent live canopy`)

# base_epicormics
health_assess_2024 <- health_assess_2024 %>% rename(base_epicormics = `Number of epicormic branches/ sprouts from the base`)

# trunk_epicormics
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

# ----------------
# Hybrid characters
health_assess_2024 <- health_assess_2024 %>% rename(seed_per_bunch = `If fruits are visible, how many in a bunch?`)
health_assess_2024 <- health_assess_2024 %>% rename(shape_terminal_bud = `Shape of terminal bud (true/ hybrid character)`)
health_assess_2024 <- health_assess_2024 %>% rename(shape_leaf_scar = `Shape of bud scar (true/ hybrid character)`)
health_assess_2024 <- health_assess_2024 %>% rename(shape_lenticels = `Shape/ length of lenticels (true/ hybrid character)`)

# ----------------
# Misc. 
# plant_associates
health_assess_2024 <- health_assess_2024 %>% rename(plant_associates = `Plant associates`)

# additional notes
health_assess_2024 <- health_assess_2024 %>% rename(additional_notes = `Any additional notes (from health assessment form)`)
