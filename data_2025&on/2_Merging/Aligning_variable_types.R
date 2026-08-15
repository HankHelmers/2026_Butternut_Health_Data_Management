

## All individuals
june_health_assess <- june_health_assess %>% mutate(plant_height_ft = as.character(plant_height_ft))


### Adults
june_health_assess <- june_health_assess %>% mutate(a_DBH_cm = as.character(a_DBH_cm))

june_health_assess <- june_health_assess %>% mutate(a_dead_or_alive = as.character(a_dead_or_alive))

june_health_assess <- june_health_assess %>% mutate(a_9_feet_canker_area = as.integer(a_9_feet_canker_area))

### Seedlings
june_health_assess <- june_health_assess %>% mutate(s_basal_diameter = as.double(s_basal_diameter))

june_health_assess <- june_health_assess %>% mutate(s_germ_year_estimate = as.integer(s_germ_year_estimate))

june_health_assess <- june_health_assess %>% mutate(s_dead_or_alive = as.character(s_dead_or_alive))

june_health_assess <- june_health_assess %>% mutate(s_percent_live_canopy = as.integer(s_percent_live_canopy))


june_health_assess <- june_health_assess %>% mutate(s_previous_stem_present = as.integer(s_previous_stem_present))

june_health_assess <- june_health_assess %>% mutate(s_visible_canker = as.character(s_visible_canker))

june_health_assess <- june_health_assess %>% mutate(s_base_canker_area = as.integer(s_base_canker_area))
june_health_assess <- june_health_assess %>% mutate(s_stem_canker_area = as.integer(s_stem_canker_area))
june_health_assess <- june_health_assess %>% mutate(s_circum_girdled = as.integer(s_circum_girdled))

june_health_assess <- june_health_assess %>% mutate(s_a_visible_callous = as.character(s_a_visible_callous))
