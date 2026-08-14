
# Identification Variables
#   Here, I re-type and fix the primary problems with the most important identification variables prior to the data management which requires specifically referring to data entries.
#   Specifically, timestamp, site name and plant initials.


## Timestamp
# Convert timestamp 8/15/2025 12:33:57 --> 2025-08-15 12:33:57
after_health_assess <- after_health_assess %>% mutate(timestamp = mdy_hms(timestamp))

## Site names
# Correct capitalization inconsistencies with CPVT and Sugar River.
after_health_assess <- after_health_assess %>%
  mutate(site_name = case_when(
    site_name == "Cpvt" ~ "CPVT",
    str_detect(site_name, "SR") ~ "SR", # Some of the SR's include the individual by accident, e.g. "SR-10"
    TRUE ~ site_name # Otherwise, keep name the same
  ))

## Plant initials
# Standardizing the plant initials according to site.
after_health_assess <- after_health_assess %>% mutate(plant_initials = case_when(
  site_name == "WCP" ~ "SH",
  site_name == "SR" ~ "SR",
  site_name == "ILM" ~ "BU",
  site_name == "CPVT" ~ "BU",
  TRUE ~ plant_initials
))