# Create missing columns
# In aligning June/July and August 2025, the number of variables measured does not align. This is because we added questions in August leading to more columns. 
# For many of these columns, the information in June is still available. In August, we split up adults and seedling questions leading to seperate columns for their questions. This includes shared variables like percent live canopy and canker areas. Thus, in June we have a single percent_live_canopy that contains both the seedling and adult information. When merging, we need to create the missing seedling specific, s_percent_live_canopy. These types of additions happen here.

## Adults
june_health_assess <- june_health_assess %>% mutate(a_dead_or_alive = NA)

june_health_assess <- june_health_assess %>% mutate(a_9_feet_canker_area = NA)

## Seedlings
june_health_assess <- june_health_assess %>% mutate(s_basal_diameter = NA)
june_health_assess <- june_health_assess %>% mutate(s_germ_year_estimate = NA)
june_health_assess <- june_health_assess %>% mutate(s_dead_or_alive = NA)
june_health_assess <- june_health_assess %>% mutate(s_percent_live_canopy = NA)

june_health_assess <- june_health_assess %>% mutate(s_previous_stem_present = NA)
june_health_assess <- june_health_assess %>% mutate(s_visible_canker = NA)
june_health_assess <- june_health_assess %>% mutate(s_base_canker_area = NA)
june_health_assess <- june_health_assess %>% mutate(s_stem_canker_area = NA)
june_health_assess <- june_health_assess %>% mutate(s_circum_girdled = NA)

### Alive seedlings
june_health_assess <- june_health_assess %>% mutate(s_a_visible_callous = NA)


### -------------------------------
### Re-order June/July -- with its new variables -- to match August 
june_health_assess <- june_health_assess %>%
  select(
    # Shared across both adults and seedlings
    timestamp, email, date, site_name, plant_number, plant_initials, 
    first_photo, last_photo, camera, adult_or_seedling, gps_north, gps_west,
    slope, aspect, plant_height_ft, shape_terminal_bud, shape_leaf_scar, shape_lenticels,
    shape_hairs, upland_rip, associated_trees, competition, other_competition_response, additional_notes,
    
    # All Adults
    a_DBH_cm, a_crown_class, a_dead_or_alive,
    a_percent_live_canopy, a_purdue_severity_canker, a_purdue_severity_canopy,
    
    a_visible_canker, a_base_canker_area, a_9_feet_canker_area, a_trunk_canker_area,
    a_circum_girdled, 
    
    a_trunk_epicormics, a_base_epicormics,
    
    # Alive, adults only
    a_a_producing_seed, a_a_seed_estimate, a_a_seed_per_bunch, 
    a_a_visible_callous, 
    
    # All seedlings
    s_basal_diameter, s_germ_year_estimate, s_dead_or_alive, 
    s_percent_live_canopy, 
    s_densio_north, s_densio_east, s_densio_south, s_densio_west,
    s_signs_damage, s_previous_stem_present,
    s_visible_canker, s_base_canker_area, s_stem_canker_area, s_circum_girdled, 
    
    # Alive, seedlings only
    s_a_visible_callous
  )
