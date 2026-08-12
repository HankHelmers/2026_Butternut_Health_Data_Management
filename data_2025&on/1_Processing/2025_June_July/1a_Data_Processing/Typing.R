# Convert timestamp 8/15/2025 12:33:57 --> 2025-08-15 12:33:57
june_health_assess <- june_health_assess %>% mutate(timestamp = mdy_hms(timestamp))

## GPS to double
june_health_assess$gps_north <- as.double(june_health_assess$gps_north)
june_health_assess$gps_west <- as.double(june_health_assess$gps_west)

## ****Canker areas to integer 
# NOTE: Right now, "Less than 10, but more than 0" just reads in as 10
  
# Note: Using 'parse_number' first is very important. Parse_number retrieves the number from
#     within a string, removing excess characters, e.g. parse_number("70%") = 70.
#
#     Then, as.integer turns it into an integer, but if you used only as.integer
#     any excess characters would lead to parsing the whole value as NA, e.g.
#     as.integer("70%") = NA.

# Trunk canker area
june_health_assess$trunk_canker_area <- as.integer(parse_number(june_health_assess$trunk_canker_area))

# Circumference girdled
june_health_assess$circum_girdled_canker <- as.integer(parse_number(june_health_assess$circum_girdled_canker))

# Base canker area
june_health_assess$base_canker_area <- as.integer(parse_number(june_health_assess$base_canker_area))

# Percent live canopy
june_health_assess$percent_live_canopy <- as.integer(parse_number(june_health_assess$percent_live_canopy))
