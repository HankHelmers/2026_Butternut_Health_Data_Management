
# Convert timestamp 8/15/2025 12:33:57 --> 2025-08-15 12:33:57
after_health_assess <- after_health_assess %>% mutate(timestamp = mdy_hms(timestamp))

# Cankers
after_health_assess <- after_health_assess %>% mutate(a_base_canker_area = as.integer(a_base_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_9_feet_canker_area = as.integer(a_9_feet_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_trunk_canker_area = as.integer(a_trunk_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_circum_girdled = as.integer(a_circum_girdled))

