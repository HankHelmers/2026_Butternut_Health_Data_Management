## ----cleaning_height_2, message=FALSE, warning=FALSE----
cleaning <- june_health_assess %>% select(timestamp, site_name, plant_number, plant_height_ft) %>% mutate(
  # Big picture height cleaning:
  #   * Assume in feet if no units are written into the box
  #   * If units are written in the box: extract them and re-calculate the heigh

  # ------------------ Process:
  # Clean up the text for consistency (e.g., remove extra spaces, make lowercase)
  height_str = str_to_lower(str_trim(plant_height_ft)),

  # Extract the first decimal number, this will always be the feet
    # Note that broadly "\\d+\\.?\\d*" selection nomenclature simily breaks down to: get the "Digits, maybe a dot, maybe more digits"
    # Where the "\\d+" gets all the first whole digits,
    # then the "\\.?" will check whether there is a literal decimal point,
    # if there is then "\\d*" gets all remaining digits
  feet_str = str_extract(height_str, "\\d+\\.?\\d*\\s*(ft)"),
  feet = as.numeric(str_extract(feet_str, "\\d+\\.?\\d*")),

  # Get the string of inches which will be based on either the presence of "inches" or "in",
    # e.g., "7 inches" or "7in"
  inches_str = str_extract(height_str, "\\d+\\.?\\d*\\s*(inches|in)"),
  # Extract the decimal from the isolated inches string, like the feet
  inches = as.numeric(str_extract(inches_str, "\\d+\\.?\\d*")),

  # Convert using the numerical values
    # Where 'coalesce' will use a 0 if feet/inches is an NA value
  calculated_from_text_feet = (coalesce(feet, 0)) + (coalesce(inches, 0) / 12.0),

  # Seeing if the entry has additional text in it like "ft" or "inches"
  contains_text = str_detect(height_str, "ft") | str_detect(height_str, "inches") | str_detect(height_str, "in"),

  # Assume the plant_height_ft is the string as a number if the entry doesn't have text.
  plant_height_ft_cleaned = if_else(!contains_text, as.numeric(height_str), calculated_from_text_feet)

) %>% select(timestamp, site_name, plant_number, plant_height_ft, plant_height_ft_cleaned)


# Demonstrating changes
comparison <- tibble(
  site_name = cleaning$site_name, 
  plant_number = cleaning$plant_number,
  original_height_ft  = cleaning$plant_height_ft,
  clean_height_ft = cleaning$plant_height_ft_cleaned
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

# Applying changes 
cleaning <- cleaning %>% select(timestamp, site_name, plant_number, plant_height_ft_cleaned) %>% rename(plant_height_ft = plant_height_ft_cleaned)

june_health_assess <- june_health_assess %>% mutate(plant_height_ft = as.numeric(plant_height_ft))

june_health_assess <- june_health_assess %>% rows_update(cleaning, by = c("timestamp", "site_name", "plant_number"))



## ----------------------------------------------------
# Parse cm
june_health_assess <- june_health_assess %>% mutate(
  # Clean up the text for consistency (e.g., remove extra spaces, make lowercase)
  height_str = str_to_lower(str_trim(dbh_cm)),
  
  # Extract the first decimal number, this will always be the cm
  # Note that broadly "\\d+\\.?\\d*" selection nomenclature simily breaks down to: get the "Digits, maybe a dot, maybe more digits"
  # Where the "\\d+" gets all the first whole digits,
  # then the "\\.?" will check whether there is a literal decimal point,
  # if there is then "\\d*" gets all remaining digits
  dbh_cm = as.numeric(str_extract(height_str, "\\d+\\.?\\d*")),
  
) %>% select(-height_str) # Only keep the new dbh value


## ----message=FALSE, warning=FALSE--------------------
cleaning <- june_health_assess %>%
  mutate(
    densio_north = as.integer(parse_number(densio_north)),
    densio_south = as.integer(parse_number(densio_south)),
    densio_east  = as.integer(parse_number(densio_east)),
    densio_west  = as.integer(parse_number(densio_west))
  )


## ----warning=FALSE-----------------------------------
# Plants 6, 17, 22, 38, 43, 44, 47, 71, 72

# Plant 6
    # Read: "Same as SH5"
    # SH5's densio readings: 48 56 94 96
row_index <- which(cleaning$plant_number == 6 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- 48
cleaning$densio_east[row_index]  <- 56
cleaning$densio_south[row_index] <- 94
cleaning$densio_west[row_index]  <- 96

# Plant 17
    # Read: "W - 33. E - 12. N - 68. S - 2. 30% open, 70% canopy cover"
row_index <- which(cleaning$plant_number == 17 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- 68
cleaning$densio_east[row_index]  <- 12
cleaning$densio_south[row_index] <- 2
cleaning$densio_west[row_index]  <- 33

# Plant 22
  # Read: "22  -- a number Densiometer measures not relevant because seedling was overtaken by honeysuckle. Honeysuckle was cut away before assessing. ng"
row_index <- which(cleaning$plant_number == 22 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- NA
cleaning$densio_east[row_index]  <- NA
cleaning$densio_south[row_index] <- NA
cleaning$densio_west[row_index]  <- NA

# Plant 38
    # Read: "Not relevant because this individual's highest point is below the line of forb vegetation cover which is not consistent throughout the season. Therefore, the densiometer read right now is not representative. Also, the tree is dead."
row_index <- which(cleaning$plant_number == 38 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- NA
cleaning$densio_east[row_index]  <- NA
cleaning$densio_south[row_index] <- NA
cleaning$densio_west[row_index]  <- NA

# Plant 43
    # Read: "E - 7. S - 6. W - 1. N - 5. 19.76% open, 80.24% canopy cover"
row_index <- which(cleaning$plant_number == 43 &  cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- 5
cleaning$densio_east[row_index]  <- 7
cleaning$densio_south[row_index] <- 6
cleaning$densio_west[row_index]  <- 1

# Plant 44
    # Read: "E - 8. S - 5. W - 10. N - 95 30.7% filled, 69.3% canopy cover"
row_index <- which(cleaning$plant_number == 44 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- 95
cleaning$densio_east[row_index]  <- 8
cleaning$densio_south[row_index] <- 5
cleaning$densio_west[row_index]  <- 10

# Plant 47
    # Read: "E - 7. N - 4. S - 12. W - 3. 27% open, 73% canopy cover."
row_index <- which(cleaning$plant_number == 47 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- 4
cleaning$densio_east[row_index]  <- 7
cleaning$densio_south[row_index] <- 12
cleaning$densio_west[row_index]  <- 3

# Plant 71
    # Read: "W - 32. E - 76. S - 10. N - 32. 39% empty or 61% canopy cover."
row_index <- which(cleaning$plant_number == 71 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- 32
cleaning$densio_east[row_index]  <- 76
cleaning$densio_south[row_index] <- 10
cleaning$densio_west[row_index]  <- 32

# Plant 72
    # Read: "S - 1. E - 56. N - 53. W - 54. 43% open or 57% canopy cover."
row_index <- which(cleaning$plant_number == 72 & cleaning$site_name == "WCP")
cleaning$densio_north[row_index] <- 53
cleaning$densio_east[row_index]  <- 56
cleaning$densio_south[row_index] <- 1
cleaning$densio_west[row_index]  <- 54

comparison <- tibble(
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  original_north = june_health_assess$densio_north,
  clean_north    = cleaning$densio_north,
  
  original_south = june_health_assess$densio_south,
  clean_south    = cleaning$densio_south,
  
  original_east  = june_health_assess$densio_east,
  clean_east     = cleaning$densio_east,
  
  original_west  = june_health_assess$densio_west,
  clean_west     = cleaning$densio_west
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

# Overwrite original densio columns with cleaned versions
june_health_assess <- june_health_assess %>%
  mutate(
    densio_north = as.integer(parse_number(densio_north)),
    densio_south = as.integer(parse_number(densio_south)),
    densio_east  = as.integer(parse_number(densio_east)),
    densio_west  = as.integer(parse_number(densio_west))
  )

june_health_assess <- june_health_assess %>% rows_update(cleaning, by = c("timestamp", "plant_number", "site_name"))



## ----cleaning_canker_3-------------------------------
cleaning <- cleaning %>% mutate(base_canker_area = if_else(visible_canker == "No", 0, base_canker_area))
cleaning <- cleaning %>% mutate(trunk_canker_area = if_else(visible_canker == "No", 0, trunk_canker_area))
cleaning <- cleaning %>% mutate(circum_girdled_canker = if_else(visible_canker == "No", 0, circum_girdled_canker))
 
# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  visible_canker = june_health_assess$visible_canker,
  original_trunk  = june_health_assess$trunk_canker_area,
  clean_trunk = cleaning$trunk_canker_area,
  original_base   = june_health_assess$base_canker_area,
  clean_base  = cleaning$base_canker_area,
  original_girdle = june_health_assess$circum_girdled_canker,
  clean_girdle = cleaning$circum_girdled_canker
)

comparison <- comparison %>%
  arrange(factor(visible_canker, levels = c("No", "Yes")))  # "No" first, then "Yes"

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
june_health_assess <- june_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))



## ----------------------------------------------------
cleaning <- june_health_assess %>%
  mutate(
    base_epicormics = if_else(!is.na(base_epicormics) & base_epicormics != 0, "Yes", "No"),
    trunk_epicormics = if_else(!is.na(trunk_epicormics) & trunk_epicormics != 0, "Yes", "No")
  )

# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  original_base_ep = june_health_assess$base_epicormics,
  clean_base_ep  = cleaning$base_epicormics,
  
  original_trunk_ep = june_health_assess$trunk_epicormics,
  clean_trunk_ep    = cleaning$trunk_epicormics,
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
june_health_assess <- june_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))

