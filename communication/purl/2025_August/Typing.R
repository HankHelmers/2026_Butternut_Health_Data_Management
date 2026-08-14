## ---------------------------------------------------
cleaning <- after_health_assess

row_index <- which(cleaning$site_name == "ILM" & cleaning$plant_number == 586)
cleaning$gps_west[row_index] <- -73.329

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(site_name == "ILM") %>% filter(plant_number == 586))$site_name,
  og_value = (after_health_assess %>% filter(site_name == "ILM") %>% filter(plant_number == 586))$gps_west,
  cleaned_value = (cleaning %>% filter(site_name == "ILM") %>% filter(plant_number == 586))$gps_west,
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
after_health_assess <- after_health_assess %>% rows_update(cleaning, by=c("timestamp", "site_name"))



## ---------------------------------------------------
cleaning <- after_health_assess

# Apply retyping
cleaning <- cleaning %>% mutate(gps_west = as.double(gps_west)) 
cleaning <- cleaning %>% mutate(gps_north = as.double(gps_north))

# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning$site_name,
  og_gps_north = after_health_assess$gps_north,
  cleaned_gps_north = cleaning$gps_north,
  og_gps_west = after_health_assess$gps_west,
  cleaned_gps_west = cleaning$gps_west,
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
after_health_assess <- after_health_assess %>% mutate(gps_west = as.double(gps_west)) 
after_health_assess <- after_health_assess %>% mutate(gps_north = as.double(gps_north))



## ---------------------------------------------------
after_health_assess <- after_health_assess %>% mutate(a_base_canker_area = as.integer(a_base_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_9_feet_canker_area = as.integer(a_9_feet_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_trunk_canker_area = as.integer(a_trunk_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_circum_girdled = as.integer(a_circum_girdled))


## ---------------------------------------------------
after_health_assess <- after_health_assess %>% mutate(s_base_canker_area = as.integer(s_base_canker_area))
after_health_assess <- after_health_assess %>% mutate(s_stem_canker_area = as.integer(s_stem_canker_area))
after_health_assess <- after_health_assess %>% mutate(s_circum_girdled = as.integer(s_circum_girdled))

