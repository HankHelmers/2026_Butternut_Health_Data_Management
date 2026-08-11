# Convert timestamp 8/15/2025 12:33:57 --> 2025-08-15 12:33:57
june_health_assess <- june_health_assess %>% mutate(timestamp = mdy_hms(timestamp))