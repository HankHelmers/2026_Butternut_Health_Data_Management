## ----------------------------------------------------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(timestamp = mdy_hms(timestamp))


## ----------------------------------------------------------------------------------------------------
# Remove 'SH' or 'SH ' from the beginning of plant numbers 
june_health_assess$plant_number <- sub("^SH\\s*", "", june_health_assess$plant_number)

cleaning <- june_health_assess
cleaning$plant_number <- parse_number(cleaning$plant_number)

# Demonstrating changes
comparison <- tibble(
  site = june_health_assess$site_name,
  original = june_health_assess$plant_number,
  clean = as.character(cleaning$plant_number)
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
june_health_assess <- june_health_assess %>% mutate(plant_number = as.character(parse_number(plant_number)))


## ----------------------------------------------------------------------------------------------------
# Site name is WCP for all trees up until July 1st
last_wcp_time <- ymd_hms("2025-07-01 10:57:46")

june_health_assess <- june_health_assess %>%
  mutate(site_name = ifelse(timestamp < last_wcp_time, "WCP", site_name))

# Correct capitalization inconsistencies with CPVT and Sugar River
june_health_assess <- june_health_assess %>%
  mutate(site_name = case_when(
    site_name == "Cpvt" ~ "CPVT",
    site_name == "Sugar river" ~ "SR",
    site_name == "Sugar River" ~ "SR",
    TRUE ~ site_name # Otherwise, keep name the same
  ))



## ----------------------------------------------------------------------------------------------------
june_6th = ymd_hms("2025-06-6 23:59:59") # "this is black walnut!"

june_health_assess <- june_health_assess %>%
  mutate(adult_or_seedling = if_else(
    timestamp < june_6th,
    # If TRUE (before June 6th), update labels by densiometer:
    case_when(
      is.na(densio_north) ~ "Adult",
      TRUE ~ "Seedling" 
    ),
    # If FALSE (June 6th or later), keep whatever was already there
    adult_or_seedling
  ))



## ----------------------------------------------------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(plant_initials = case_when(
  site_name == "WCP" ~ "SH",
  site_name == "SR" ~ "SR",
  site_name == "ILM" ~ "BU",
  site_name == "CPVT" ~ "BU",
  TRUE ~ plant_initials
))


