# Aligning variable names
#   Here, I rename the variables across June/August such that they match and can be easily combined using left join.

## June/July renames

### All individuals
june_health_assess <- june_health_assess %>% rename(additional_notes = notes)

### Adults
june_health_assess <- june_health_assess %>% rename(a_DBH_cm = dbh_cm)
june_health_assess <- june_health_assess %>% rename(a_crown_class = crown_class)
june_health_assess <- june_health_assess %>% rename(a_percent_live_canopy = percent_live_canopy)

june_health_assess <- june_health_assess %>% rename(a_purdue_severity_canker = purdue_severity_canker)
june_health_assess <- june_health_assess %>% rename(a_purdue_severity_canopy = purdue_severity_canopy)

june_health_assess <- june_health_assess %>% rename(a_visible_canker = visible_canker)
june_health_assess <- june_health_assess %>% rename(a_base_canker_area = base_canker_area)
june_health_assess <- june_health_assess %>% rename(a_trunk_canker_area = trunk_canker_area)
june_health_assess <- june_health_assess %>% rename(a_circum_girdled = circum_girdled_canker)

june_health_assess <- june_health_assess %>% rename(a_base_epicormics = base_epicormics)
june_health_assess <- june_health_assess %>% rename(a_trunk_epicormics = trunk_epicormics)

### Alive adults 
june_health_assess <- june_health_assess %>% rename(a_a_producing_seed = producing_seed)
june_health_assess <- june_health_assess %>% rename(a_a_seed_estimate = seed_estimate)
june_health_assess <- june_health_assess %>% rename(a_a_seed_per_bunch = seeds_per_bunch)
june_health_assess <- june_health_assess %>% rename(a_a_visible_callous = has_callous)

### Seedling
june_health_assess <- june_health_assess %>% rename(s_densio_north = densio_north)
june_health_assess <- june_health_assess %>% rename(s_densio_east = densio_east)
june_health_assess <- june_health_assess %>% rename(s_densio_south = densio_south)
june_health_assess <- june_health_assess %>% rename(s_densio_west = densio_west)

june_health_assess <- june_health_assess %>% rename(s_signs_damage = signs_of_damage_seedling)

