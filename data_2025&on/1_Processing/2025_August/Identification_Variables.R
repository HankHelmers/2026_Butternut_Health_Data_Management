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

# Numeric NA renamings
## GPS
# Presence of several different ways of saying an NA. Here I clarify them all to actual NA values.
after_health_assess <- after_health_assess %>% mutate(
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