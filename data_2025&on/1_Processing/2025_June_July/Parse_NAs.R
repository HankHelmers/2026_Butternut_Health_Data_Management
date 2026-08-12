# Numeric NA renamings

## Slope
# Presence of "Na" --> NA
# Sugar River 3: Slope = "Yes (no measurement tool with me)"

# Eventually, I'd like to parse this as a number, but currently it would lose
# some information since there is the "Yes ..." option.
#june_health_assess$slope <- parse_number(june_health_assess$slope)


## GPS
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
