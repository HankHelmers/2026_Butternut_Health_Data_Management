## ----------------------------------------------------------
after_health_assess <- after_health_assess %>% mutate(timestamp = mdy_hms(timestamp))


## ----------------------------------------------------------
cleaning <- after_health_assess %>%
  mutate(
    plant_number = sub("^0+", "", plant_number)
  )

# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning$site_name,
  original_plant_number = after_health_assess$plant_number,
  cleaned_plant_number = cleaning$plant_number,
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


## ----------------------------------------------------------
# Correct capitalization inconsistencies with CPVT and Sugar River
after_health_assess <- after_health_assess %>%
  mutate(site_name = case_when(
    site_name == "Cpvt" ~ "CPVT",
    str_detect(site_name, "SR") ~ "SR", # Some of the SR's include the individual by accident, e.g. "SR-10"
    TRUE ~ site_name # Otherwise, keep name the same
  ))


## ----------------------------------------------------------
after_health_assess <- after_health_assess %>% mutate(plant_initials = case_when(
  site_name == "WCP" ~ "SH",
  site_name == "SR" ~ "SR",
  site_name == "ILM" ~ "BU",
  site_name == "CPVT" ~ "BU",
  TRUE ~ plant_initials
))

