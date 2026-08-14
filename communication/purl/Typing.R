## ------------------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(shape_terminal_bud = as.character(shape_terminal_bud))
june_health_assess <- june_health_assess %>% mutate(shape_lenticels = as.character(shape_lenticels))
june_health_assess <- june_health_assess %>% mutate(shape_leaf_scar = as.character(shape_leaf_scar))
june_health_assess <- june_health_assess %>% mutate(shape_hairs = as.character(shape_hairs))


## ------------------------------------------------------------------
# Trunk canker area
june_health_assess$trunk_canker_area <- as.integer(parse_number(june_health_assess$trunk_canker_area))

# Circumference girdled
june_health_assess$circum_girdled_canker <- as.integer(parse_number(june_health_assess$circum_girdled_canker))

# Base canker area
june_health_assess$base_canker_area <- as.integer(parse_number(june_health_assess$base_canker_area))

# Percent live canopy
june_health_assess$percent_live_canopy <- as.integer(parse_number(june_health_assess$percent_live_canopy))

