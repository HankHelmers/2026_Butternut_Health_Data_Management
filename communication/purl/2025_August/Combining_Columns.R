## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_visible_canker = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_visible_canker, a_d_visible_canker 
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Adult") %>% select(site_name, plant_number, a_a_visible_canker, a_d_visible_canker, a_visible_canker),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(a_visible_canker = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_visible_canker, a_d_visible_canker 
)) %>% select(-a_a_visible_canker, -a_d_visible_canker)


## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_base_canker_area = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_base_canker_area, a_d_base_canker_area 
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Adult") %>% select(site_name, plant_number, a_a_base_canker_area, a_d_base_canker_area, a_base_canker_area),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(a_base_canker_area = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_base_canker_area, a_d_base_canker_area 
)) %>% select(-a_a_base_canker_area, -a_d_base_canker_area )


## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_9_feet_canker_area = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_9_feet_canker_area, a_d_9_feet_canker_area 
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Adult") %>% select(site_name, plant_number, a_a_9_feet_canker_area, a_d_9_feet_canker_area, a_9_feet_canker_area),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(a_9_feet_canker_area = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_9_feet_canker_area, a_d_9_feet_canker_area 
)) %>% select(-a_a_9_feet_canker_area, -a_d_9_feet_canker_area)


## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_trunk_canker_area = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_trunk_canker_area, a_d_trunk_canker_area
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Adult") %>% select(site_name, plant_number, a_a_trunk_canker_area, a_d_trunk_canker_area, a_trunk_canker_area),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(a_trunk_canker_area = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_trunk_canker_area, a_d_trunk_canker_area
)) %>% select(-a_a_trunk_canker_area, -a_d_trunk_canker_area)


## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_circum_girdled = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_circum_girdled, a_d_circum_girdled
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Adult") %>% select(site_name, plant_number, a_a_circum_girdled, a_d_circum_girdled, a_circum_girdled),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(a_circum_girdled = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_circum_girdled, a_d_circum_girdled
)) %>% select(-a_a_circum_girdled, -a_d_circum_girdled)


## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_trunk_epicormics = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_trunk_epicormics, a_d_trunk_epicormics
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Adult") %>% select(site_name, plant_number, a_a_trunk_epicormics, a_d_trunk_epicormics, a_trunk_epicormics),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(a_trunk_epicormics = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_trunk_epicormics, a_d_trunk_epicormics
)) %>% select(-a_a_trunk_epicormics, -a_d_trunk_epicormics )


## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_base_epicormics = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_base_epicormics, a_d_base_epicormics
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Adult") %>% select(site_name, plant_number, a_a_base_epicormics, a_d_base_epicormics, a_base_epicormics),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(a_base_epicormics = if_else(
  after_health_assess$a_dead_or_alive == "Alive", a_a_base_epicormics, a_d_base_epicormics
)) %>% select(-a_a_base_epicormics, -a_d_base_epicormics)


## ----------------------------------------------------------
cleaning <- after_health_assess %>% mutate(s_visible_canker = if_else(
  after_health_assess$s_dead_or_alive == "Alive", s_a_visible_canker, s_d_visible_canker
))

# Table of before and after for verification
datatable(
  cleaning %>% filter(adult_or_seedling == "Seedling") %>% select(site_name, plant_number, s_a_visible_canker, s_d_visible_canker, s_visible_canker),
  options = list(
    pageLength = 10,
    scrollY = "400px",
    scrollX = TRUE
  ),
  class = "stripe hover row-border order-column" # forces light theme
)

# Apply to original dataset
after_health_assess <- after_health_assess %>% mutate(s_visible_canker = if_else(
  after_health_assess$s_dead_or_alive == "Alive", s_a_visible_canker, s_d_visible_canker 
)) %>% select(-s_a_visible_canker, -s_d_visible_canker)

