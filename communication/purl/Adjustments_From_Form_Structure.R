## --------------------------------------------------------
cleaning <- after_health_assess %>%
  mutate(
    # Seperating discretely to "Y"/"N" ensures that seedlings don't get assigned a epicormic value
    a_visible_canker = if_else(a_visible_canker == "Y", "Yes", a_visible_canker),
    a_visible_canker = if_else(a_visible_canker == "N", "No", a_visible_canker),
    s_visible_canker = if_else(s_visible_canker == "Y", "Yes", s_visible_canker),
    s_visible_canker = if_else(s_visible_canker == "N", "No", s_visible_canker)
  )

# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  original_a_vis_canker = after_health_assess$a_visible_canker,
  clean_a_vis_canker  = cleaning$a_visible_canker,
  
  original_s_vis_canker = after_health_assess$s_visible_canker,
  clean_s_vis_canker    = cleaning$s_visible_canker,
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
after_health_assess <- after_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))


## --------------------------------------------------------
cleaning <- after_health_assess %>%
  mutate(
    # Seperating discretely to "Y"/"N" ensures that seedlings don't get assigned a epicormic value
    a_a_visible_callous = if_else(a_a_visible_callous == "Y", "Yes", a_a_visible_callous),
    a_a_visible_callous = if_else(a_a_visible_callous == "N", "No", a_a_visible_callous),
    s_a_visible_callous = if_else(s_a_visible_callous == "Y", "Yes", s_a_visible_callous),
    s_a_visible_callous = if_else(s_a_visible_callous == "N", "No", s_a_visible_callous)
  )

# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning$site_name,
  plant_number = cleaning$plant_number,
  original_a_vis_callous = after_health_assess$a_a_visible_callous,
  clean_a_vis_callous  = cleaning$a_a_visible_callous,
  
  original_s_vis_canker = after_health_assess$s_a_visible_callous,
  clean_s_vis_callous   = cleaning$s_a_visible_callous,
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
after_health_assess <- after_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))


## --------------------------------------------------------
cleaning <- after_health_assess %>% mutate(a_base_canker_area = if_else(a_visible_canker == "No", 0, a_base_canker_area))

cleaning <- cleaning %>% mutate(a_9_feet_canker_area = if_else(a_visible_canker == "No", 0, a_9_feet_canker_area))

cleaning <- cleaning %>% mutate(a_trunk_canker_area = if_else(a_visible_canker == "No", 0, a_trunk_canker_area))

cleaning <- cleaning %>% mutate(a_circum_girdled = if_else(a_visible_canker == "No", 0, a_circum_girdled))

cleaning_adults <- cleaning %>% filter(adult_or_seedling == "Adult")
original_adults <- after_health_assess %>% filter(adult_or_seedling == "Adult")
# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning_adults$site_name,
  plant_number = cleaning_adults$plant_number,
  original_a_visible_canker = original_adults$a_visible_canker,
  original_a_base_canker = original_adults$a_base_canker_area,
  clean_a_base_canker  = cleaning_adults$a_base_canker_area,
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
after_health_assess <- after_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))


## --------------------------------------------------------
cleaning <- after_health_assess %>% mutate(s_base_canker_area = if_else(s_visible_canker == "No", 0, s_base_canker_area))

cleaning <- cleaning %>% mutate(s_stem_canker_area = if_else(s_visible_canker == "No", 0, s_stem_canker_area))

cleaning <- cleaning %>% mutate(s_circum_girdled = if_else(s_visible_canker == "No", 0, s_circum_girdled))

cleaning_seedlings <- cleaning %>% filter(adult_or_seedling == "Seedling")
original_seedlings <- after_health_assess %>% filter(adult_or_seedling == "Seedling")

# Demonstrating changes 
comparison <- tibble(
  site_name = cleaning_seedlings$site_name,
  plant_number = cleaning_seedlings$plant_number,
  original_a_visible_canker = original_seedlings$s_visible_canker,
  original_a_base_canker = original_seedlings$s_base_canker_area,
  clean_a_base_canker  = cleaning_seedlings$s_base_canker_area,
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
after_health_assess <- after_health_assess %>% rows_update(cleaning, by=c("timestamp", "plant_number", "site_name"))

