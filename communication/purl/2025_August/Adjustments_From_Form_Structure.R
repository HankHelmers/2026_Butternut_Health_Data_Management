## ----------------------------------------------------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_base_canker_area = if_else(a_visible_canker == "No", 0, a_base_canker_area))

cleaning <- cleaning %>% mutate(a_9_feet_canker_area = if_else(a_visible_canker == "No", 0, a_9_feet_canker_area))

cleaning <- cleaning %>% mutate(a_trunk_canker_area = if_else(a_visible_canker == "No", 0, a_trunk_canker_area))

cleaning <- cleaning %>% mutate(a_circum_girdled = if_else(a_visible_canker == "No", 0, a_circum_girdled))

cleaning_adults <- cleaning %>% filter(adult_or_seedling == "Adult")
original_adults <- after_health_assess %>% filter(adult_or_seedling == "Adult")
# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning_adults$site_name,
  plant_number = cleaning_adults$plant_number,
  original_a_visible_canker = original_adults$a_visible_canker,
  original_a_base_canker = original_adults$a_base_canker_area,
  clean_a_base_canker  = cleaning_adults$a_base_canker_area,
)

datatable(
  comparison,
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Applying the changes
after_health_assess <- after_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))


## ----------------------------------------------------------------------------------------------------
cleaning <- after_health_assess %>% mutate(s_base_canker_area = if_else(s_visible_canker == "No", 0, s_base_canker_area))

cleaning <- cleaning %>% mutate(s_stem_canker_area = if_else(s_visible_canker == "No", 0, s_stem_canker_area))

cleaning <- cleaning %>% mutate(s_circum_girdled = if_else(s_visible_canker == "No", 0, s_circum_girdled))

cleaning_seedlings <- cleaning %>% filter(adult_or_seedling == "Seedling")
original_seedlings <- after_health_assess %>% filter(adult_or_seedling == "Seedling")

# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning_seedlings$site_name,
  plant_number = cleaning_seedlings$plant_number,
  original_a_visible_canker = original_seedlings$s_visible_canker,
  original_a_base_canker = original_seedlings$s_base_canker_area,
  clean_a_base_canker  = cleaning_seedlings$s_base_canker_area,
)

datatable(
  comparison,
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Applying the changes
after_health_assess <- after_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))


## ----------------------------------------------------------------------------------------------------
cleaning <- after_health_assess

# Implement these changes
cleaning <- after_health_assess %>% mutate(a_percent_live_canopy = if_else(a_dead_or_alive == "Dead", 0, a_a_percent_live_canopy))  %>% select(-a_a_percent_live_canopy)


# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(adult_or_seedling == "Adult"))$site_name,
  plant_number = (cleaning %>% filter(adult_or_seedling == "Adult"))$plant_number,
  a_dead_or_alive = (cleaning %>% filter(adult_or_seedling == "Adult"))$a_dead_or_alive,
  original = (after_health_assess %>% filter(adult_or_seedling == "Adult"))$a_a_percent_live_canopy,
  clean  = (cleaning %>% filter(adult_or_seedling == "Adult"))$a_percent_live_canopy,
)

datatable(
  comparison,
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Applying the changes
after_health_assess <- after_health_assess %>% mutate(a_percent_live_canopy = if_else(a_dead_or_alive == "Dead", 0, a_a_percent_live_canopy))  %>% select(-a_a_percent_live_canopy)



## ----------------------------------------------------------------------------------------------------
cleaning <- after_health_assess

# Implement change
cleaning <- after_health_assess %>% mutate(s_percent_live_canopy = if_else(s_dead_or_alive == "Dead", 0, s_a_percent_live_canopy))  %>% select(-s_a_percent_live_canopy)

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(adult_or_seedling == "Seedling"))$site_name,
  plant_number = (cleaning %>% filter(adult_or_seedling == "Seedling"))$plant_number,
  a_dead_or_alive = (cleaning %>% filter(adult_or_seedling == "Seedling"))$s_dead_or_alive,
  original = (after_health_assess %>% filter(adult_or_seedling == "Seedling"))$s_a_percent_live_canopy,
  clean  = (cleaning %>% filter(adult_or_seedling == "Seedling"))$s_percent_live_canopy,
)

datatable(
  comparison,
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Applying the changes
after_health_assess <- after_health_assess %>% mutate(s_percent_live_canopy = if_else(s_dead_or_alive == "Dead", 0, s_a_percent_live_canopy))  %>% select(-s_a_percent_live_canopy)



## ----------------------------------------------------------------------------------------------------
cleaning <- after_health_assess

# Implement these changes
cleaning <- after_health_assess %>% mutate(
  a_purdue_severity_canker = if_else(a_dead_or_alive == "Dead", "5", a_a_purdue_severity_canker),
  a_purdue_severity_canopy = if_else(a_dead_or_alive == "Dead", "5", a_a_purdue_severity_canopy)
        # Remove originals
    )  %>% select(-a_a_purdue_severity_canker, -a_a_purdue_severity_canopy)


# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(adult_or_seedling == "Adult"))$site_name,
  plant_number = (cleaning %>% filter(adult_or_seedling == "Adult"))$plant_number,
  a_dead_or_alive = (cleaning %>% filter(adult_or_seedling == "Adult"))$a_dead_or_alive,
  original_canker = (after_health_assess %>% filter(adult_or_seedling == "Adult"))$a_a_purdue_severity_canker,
  clean_canker  = (cleaning %>% filter(adult_or_seedling == "Adult"))$a_purdue_severity_canker,
  original_canopy = (after_health_assess %>% filter(adult_or_seedling == "Adult"))$a_a_purdue_severity_canopy,
  clean_canopy  = (cleaning %>% filter(adult_or_seedling == "Adult"))$a_purdue_severity_canopy,
)

datatable(
  comparison,
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Applying the changes
after_health_assess <- after_health_assess %>% mutate(
  a_purdue_severity_canker = if_else(a_dead_or_alive == "Dead", "5", a_a_purdue_severity_canker),
  a_purdue_severity_canopy = if_else(a_dead_or_alive == "Dead", "5", a_a_purdue_severity_canopy)
        # Remove originals
    )  %>% select(-a_a_purdue_severity_canker, -a_a_purdue_severity_canopy)


