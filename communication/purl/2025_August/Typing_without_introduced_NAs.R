## ------------------------------------------------------------------
after_health_assess <- after_health_assess %>% mutate(shape_terminal_bud = as.character(shape_terminal_bud))
after_health_assess <- after_health_assess %>% mutate(shape_lenticels = as.character(shape_lenticels))
after_health_assess <- after_health_assess %>% mutate(shape_leaf_scar = as.character(shape_leaf_scar))
after_health_assess <- after_health_assess %>% mutate(shape_hairs = as.character(shape_hairs))


## ------------------------------------------------------------------
# Canker
after_health_assess <- after_health_assess %>% mutate(a_base_canker_area = as.integer(a_base_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_9_feet_canker_area = as.integer(a_9_feet_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_trunk_canker_area = as.integer(a_trunk_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_circum_girdled = as.integer(a_circum_girdled))


## ------------------------------------------------------------------
# Densio
after_health_assess <- after_health_assess %>% mutate(s_densio_north = as.integer(s_densio_north))
after_health_assess <- after_health_assess %>% mutate(s_densio_east = as.integer(s_densio_east))
after_health_assess <- after_health_assess %>% mutate(s_densio_south = as.integer(s_densio_south))
after_health_assess <- after_health_assess %>% mutate(s_densio_west = as.integer(s_densio_west))

# Previous stems
after_health_assess <- after_health_assess %>% mutate(s_previous_stem_present = as.integer(s_previous_stem_present))

# Germ year
after_health_assess <- after_health_assess %>% mutate(s_germ_year_estimate = as.integer(s_germ_year_estimate))

# Canker
after_health_assess <- after_health_assess %>% mutate(s_base_canker_area = as.integer(s_base_canker_area))
after_health_assess <- after_health_assess %>% mutate(s_stem_canker_area = as.integer(s_stem_canker_area))
after_health_assess <- after_health_assess %>% mutate(s_circum_girdled = as.integer(s_circum_girdled))


## ------------------------------------------------------------------
# Canopy
after_health_assess <- after_health_assess %>% mutate(s_a_percent_live_canopy = as.integer(s_a_percent_live_canopy))

