## ----------------------------------------------------
after_health_assess <- after_health_assess %>% mutate(shape_terminal_bud = as.character(shape_terminal_bud))
after_health_assess <- after_health_assess %>% mutate(shape_lenticels = as.character(shape_lenticels))
after_health_assess <- after_health_assess %>% mutate(shape_leaf_scar = as.character(shape_leaf_scar))
after_health_assess <- after_health_assess %>% mutate(shape_hairs = as.character(shape_hairs))


## ----------------------------------------------------
# Canker
after_health_assess <- after_health_assess %>% mutate(a_base_canker_area = as.integer(a_base_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_9_feet_canker_area = as.integer(a_9_feet_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_trunk_canker_area = as.integer(a_trunk_canker_area))
after_health_assess <- after_health_assess %>% mutate(a_circum_girdled = as.integer(a_circum_girdled))


## ----------------------------------------------------
after_health_assess <- after_health_assess %>% mutate(s_base_canker_area = as.integer(s_base_canker_area))
after_health_assess <- after_health_assess %>% mutate(s_stem_canker_area = as.integer(s_stem_canker_area))
after_health_assess <- after_health_assess %>% mutate(s_circum_girdled = as.integer(s_circum_girdled))

