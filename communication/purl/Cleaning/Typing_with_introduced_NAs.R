## ------------------------------------------------------------------
cleaning <- after_health_assess

# Apply retyping
cleaning <- cleaning %>% mutate(gps_west = as.double(gps_west)) 
cleaning <- cleaning %>% mutate(gps_north = as.double(gps_north))

# Demonstrating changes 
comparison <- tibble(
  timestamp = cleaning$timestamp,
  site_name = cleaning$site_name,
  og_gps_north = june_health_assess$gps_north,
  cleaned_gps_north = cleaning$gps_north,
  og_gps_west = june_health_assess$gps_west,
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



## ------------------------------------------------------------------
cleaning <- after_health_assess

# Apply retyping
cleaning <- cleaning %>% mutate(slope = as.integer(slope))

# Demonstrating changes 
comparison <- tibble(
  timestamp = cleaning$timestamp,
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  og = after_health_assess$slope,
  cleaned = cleaning$slope,
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
after_health_assess <- after_health_assess %>% mutate(slope = as.integer(slope))


## ------------------------------------------------------------------
cleaning <- after_health_assess

# Apply retyping
cleaning <- after_health_assess %>% mutate(plant_height_ft = as.double(plant_height_ft))

# Demonstrating changes 
comparison <- tibble(
  timestamp = cleaning$timestamp,
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  og_height = after_health_assess$plant_height_ft,
  cleaned_height = cleaning$plant_height_ft
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
after_health_assess <- after_health_assess %>% mutate(plant_height_ft = as.double(plant_height_ft))


## ------------------------------------------------------------------
cleaning <- after_health_assess 

# Apply retyping
cleaning <- after_health_assess %>% mutate(a_DBH_cm = as.double(a_DBH_cm))
cleaning <- cleaning %>% filter(adult_or_seedling == "Adult")

# Demonstrating changes 
comparison <- tibble(
  timestamp = cleaning$timestamp,
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  og = (after_health_assess %>% filter(adult_or_seedling == "Adult"))$a_DBH_cm,
  cleaned = cleaning$a_DBH_cm
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
after_health_assess <- after_health_assess %>% mutate(a_DBH_cm = as.double(a_DBH_cm))


## ------------------------------------------------------------------
# Parsing failure
# Trunk canker area
june_health_assess$trunk_canker_area <- as.integer(parse_number(june_health_assess$trunk_canker_area))

# Parsing failure
# Circumference girdled
june_health_assess$circum_girdled_canker <- as.integer(parse_number(june_health_assess$circum_girdled_canker))
#--------------------

cleaning <- june_health_assess 

# Apply retyping
cleaning <- june_health_assess %>% mutate(trunk_canker_area = parse_number(trunk_canker_area))

# Demonstrating changes 
comparison <- tibble(
  timestamp = cleaning$timestamp,
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  og = (june_health_assess)$trunk_canker_area,
  cleaned = cleaning$trunk_canker_area
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
after_health_assess <- after_health_assess %>% mutate(a_DBH_cm = as.double(a_DBH_cm))



