## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2025-09-12 09:40:47")

# ILM 586 "--73.329" --> remove "-73.329"
row_index <- which(cleaning$timestamp == individuals_timestamp)
cleaning$gps_west[row_index] <- -73.329

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og_gps_west = (after_health_assess %>% filter(timestamp == individuals_timestamp))$gps_west,
  cleaned = (cleaning %>% filter(timestamp == individuals_timestamp))$gps_west
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



## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2025-07-03 10:05:45")

# 2025-09-15T08:38:10Z, SR 3, slope="Yes (no measurement tool with me)"
row_index <- which(cleaning$timestamp == individuals_timestamp)
cleaning$slope[row_index] <- NA
cleaning$aspect[row_index] <- NA

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og_slope = (after_health_assess %>% filter(timestamp == individuals_timestamp))$slope,
  cleaned_slope = (cleaning %>% filter(timestamp == individuals_timestamp))$slope,
  og_aspect = (after_health_assess %>% filter(timestamp == individuals_timestamp))$aspect,
  cleaned_aspect = (cleaning %>% filter(timestamp == individuals_timestamp))$aspect
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


## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2025-09-25T13:41:48Z")

# 2025-09-15T08:38:10Z, ILM 500, slope="o"
row_index <- which(cleaning$timestamp == individuals_timestamp)
cleaning$slope[row_index] <- "0" # must be a character before numeric typing is imposed in "Typing with introduced NAs"

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og_slope = (after_health_assess %>% filter(timestamp == individuals_timestamp))$slope,
  cleaned_slope = (cleaning %>% filter(timestamp == individuals_timestamp))$slope
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


## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2025-09-19T13:48:15Z")

# 2025-09-19T13:48:15Z, ILM	#364, aspect = 0, slope = NA
row_index <- which(cleaning$timestamp ==individuals_timestamp)
cleaning$slope[row_index] <- 0
cleaning$aspect[row_index] <- NA

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og_slope = (after_health_assess %>% filter(timestamp == individuals_timestamp))$slope,
  cleaned_slope = (cleaning %>% filter(timestamp == individuals_timestamp))$slope,
  og_aspect = (after_health_assess %>% filter(timestamp == individuals_timestamp))$aspect,
  cleaned_aspect = (cleaning %>% filter(timestamp == individuals_timestamp))$aspect
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


## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2025-09-15 08:38:10")

# 2025-09-19T13:48:15Z, ILM	#364, aspect = 0, slope = NA
row_index <- which(cleaning$timestamp ==individuals_timestamp)
cleaning$plant_height_ft[row_index] <- 0

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og_slope = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_height_ft,
  cleaned_slope = (cleaning %>% filter(timestamp == individuals_timestamp))$plant_height_ft
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


## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2025-11-11T16:17:47Z")

# Implement change
row_index <- which(cleaning$timestamp ==individuals_timestamp)
cleaning$a_DBH_cm[row_index] <-17.9
cleaning$additional_notes <- paste0(cleaning$additional_notes, ", two-stemmed split trunk with DBHs 17.9, 14.0. The greater was chosen during data cleaning - Hank Helmers.")

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og = (after_health_assess %>% filter(timestamp == individuals_timestamp))$a_DBH_cm,
  cleaned = (cleaning %>% filter(timestamp == individuals_timestamp))$a_DBH_cm,
  notes = (cleaning %>% filter(timestamp == individuals_timestamp))$additional_notes
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


## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2026-06-05T15:08:18Z")

# Implement change
row_index <- which(cleaning$timestamp ==individuals_timestamp)
cleaning$a_DBH_cm[row_index] <-44.0
cleaning$additional_notes <- paste0(cleaning$additional_notes, ", two-stemmed split trunk with DBHs 34.5, 44. The greater was chosen during data cleaning - Hank Helmers.")

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og = (after_health_assess %>% filter(timestamp == individuals_timestamp))$a_DBH_cm,
  cleaned = (cleaning %>% filter(timestamp == individuals_timestamp))$a_DBH_cm,
  notes = (cleaning %>% filter(timestamp == individuals_timestamp))$additional_notes
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


## ----------------------------------------------------
cleaning <- after_health_assess

individuals_timestamp = ymd_hms("2025-08-27T10:31:09Z")

# Implement change
row_index <- which(cleaning$timestamp ==individuals_timestamp)
cleaning$a_DBH_cm[row_index] <-43.6
cleaning$additional_notes <- paste0(cleaning$additional_notes, ", two-stemmed split trunk with DBHs 43.6, 30.7 (as noted by Kylie). The greater was chosen during data cleaning - Hank Helmers.")

# Demonstrating changes 
comparison <- tibble(
  site_name = (cleaning %>% filter(timestamp == individuals_timestamp))$site_name,
  plant_number = (after_health_assess %>% filter(timestamp == individuals_timestamp))$plant_number,
  og = (after_health_assess %>% filter(timestamp == individuals_timestamp))$a_DBH_cm,
  cleaned = (cleaning %>% filter(timestamp == individuals_timestamp))$a_DBH_cm,
  notes = (cleaning %>% filter(timestamp == individuals_timestamp))$additional_notes
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

