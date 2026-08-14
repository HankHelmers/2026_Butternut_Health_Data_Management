## ------------------------------------------------------------------
# Presence of several different ways of saying an NA. Here I clarify them all to actual NA values.
june_health_assess <- june_health_assess %>% mutate(
  gps_north = case_when(
    gps_north == 0 ~ NA,
    gps_north == "Na" ~ NA,
    gps_north == "N/A" ~ NA,
    gps_north == "X" ~ NA,
    TRUE ~ gps_north
  ),
  gps_west = case_when(
    gps_west == 0 ~ NA,
    gps_west == "Na" ~ NA,
    gps_west == "N/A" ~ NA,
    gps_west == "X" ~ NA,
    TRUE ~ gps_west
  )
)


## ------------------------------------------------------------------
cleaning <- june_health_assess

# Change to "Few (<50)" or "Lots (>50)"
cleaning <- cleaning %>% 
  mutate(
    # Safely convert to number first without cluttering the console
    num_val = suppressWarnings(parse_number(seed_estimate)),
    
    seed_estimate = case_when(
      str_detect(tolower(seed_estimate), "unable|unsure") ~ NA_character_,
      tolower(seed_estimate) == "few"                      ~ "Few (<50)",
      tolower(seed_estimate) == "hundreds"                 ~ "Lots (>50)",
      num_val <= 50                                        ~ "Few (<50)",
      num_val > 50                                         ~ "Lots (>50)",
      TRUE                                                 ~ NA_character_
    )
  ) %>% 
  select(-num_val) # Drop the temporary column

# Demonstrating changes
comparison <- tibble(
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  original  = june_health_assess$seed_estimate,
  clean = cleaning$seed_estimate,
)

# Table of before and after for verification
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



## ------------------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(
  aspect = case_when(
    aspect == "N/A" ~ NA,
    aspect == "n/a" ~ NA,
    aspect == 0 ~ NA, # For some slopes which were 0, aspect was also noted as 0
    aspect == "North" ~ "N",
    aspect == "East" ~ "E",
    aspect == "South" ~ "S",
    aspect == "West" ~ "W",
    TRUE ~ aspect
  )
)



## ------------------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(adult_or_seedling = case_when(
  adult_or_seedling == "Yes" ~ "Seedling",
  adult_or_seedling == "No" ~ "Adult"
))


## ------------------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(
  upland_rip = recode(
    june_health_assess$upland_rip,
    "Upland: For our purposes, any land that is not riparian (even if not particularly hilly or even elevated)" = "Upland",
    "Riparian: On land immediately adjacent to rivers, streams, lakes, etc. or within flooding zone" = "Riparian",
  )
)


## ----cleaning_purdue_1---------------------------------------------
june_health_assess <- june_health_assess %>% mutate(
  purdue_severity_canker = recode(
    june_health_assess$purdue_severity_canker,
    "1. Fewer than 3 active cankers that are all smaller than 2-3 inches in length or diameter OR fewer than 3 inactive cankers." = "1",
    "2. More than 3 active cankers, OR 2-5 shallow (with no dead tissue) healed over with cracks less than 7 inches long." = "2",
    "3. More than 5 active OR inactive cankers cracked through the bark to the tissue below which have healed over, but you still see the level of damage." = "3",
    "4. Cankers occur all over the 10-foot area, with deep cracks and both active and inactive cankers." = "4",
    "5. Tree almost dead, mostly inactive cankers with deep cracks to dead tissue." = "5"
  )
)

june_health_assess <- june_health_assess %>% mutate(
  purdue_severity_canopy = recode(
    june_health_assess$purdue_severity_canopy,
    "1. No apparent crown dieback." = "1",
    "2. Some but limited crown dieback." = "2",
    "3. Significant dieback in canopy, limited degree of new growth." = "3",
    "4. Major dieback in canopy, and limited or no new growth on terminal branches. Often segments of shredded or broken pieces of bark.  Epicormic branches present." = "4",
    "5. The canopy shows significant damage (large dead limbs, often broken limbs) also. Leaves only or mostly present as epicormic branches on trunk or base." = "5"
  )
)


## ------------------------------------------------------------------
# Select columns of interest for this correction
cleaning <- june_health_assess %>% select(timestamp, plant_number, site_name, adult_or_seedling, signs_of_damage_seedling)

# Signs of dmg only affects seedlings
cleaning <- cleaning %>% filter(adult_or_seedling == "Seedling") 

# Seperate rows by the comma-seperated values to correct naming directly 
cleaning <- cleaning %>% separate_rows(signs_of_damage_seedling, sep = ",\\s*") 

# Rename the individual responses 
cleaning <- cleaning %>% mutate(signs_of_damage_seedling = case_when(
  signs_of_damage_seedling == "Deer browse" ~ "Deer browse",
  signs_of_damage_seedling == "Deer rub" ~ "Deer rub",
  signs_of_damage_seedling == "Having been mowed in the past" ~ "Mowed",
  signs_of_damage_seedling == "Vole (nibbling on the bark)" ~ "Vole damage",
  signs_of_damage_seedling == "Rabbit browse" ~ "Rabbit browse",
  signs_of_damage_seedling == NA ~ "No damage",
  TRUE ~ "No damage"
))

# Recombine rows based on site, plant_number 
cleaning <- cleaning %>% group_by(timestamp) %>% mutate(signs_of_damage_seedling = paste(signs_of_damage_seedling, collapse = ", ")) %>% ungroup()

cleaning <- cleaning %>% distinct()

# Demonstrating changes 
original <- june_health_assess %>% select(timestamp, plant_number, site_name, adult_or_seedling, signs_of_damage_seedling)

cleaning <- original %>% rows_update(cleaning, by = c("timestamp", "site_name", "plant_number"))

comparison <- tibble(
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  adult_or_seedling = cleaning$adult_or_seedling,
  original = original$signs_of_damage_seedling,
  cleaned = cleaning$signs_of_damage_seedling
)

comparison <- comparison %>%
  arrange(factor(adult_or_seedling, levels = c("Seedling", "Adult")))  

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
june_health_assess <- june_health_assess %>% rows_update(cleaning, by = c("timestamp", "site_name", "plant_number"))

