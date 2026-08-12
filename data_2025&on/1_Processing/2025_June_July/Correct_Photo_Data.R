library(tidyverse)

# Important manually corrected photo data
june_july_photos <- read.csv("source_data/2025_Photo_Information.csv")

# --------------------------
# Join all values by site and plant number getting both versions 
# of photo variables before and after cleaning.

# Don't want to join in these values
june_july_photos <- june_july_photos %>% select(-timestamp, -date)

# Apply join
june_health_assess <- left_join(june_health_assess, june_july_photos, by=c("site_name", "plant_number"))

# Re-order to demonstrate the join
june_health_assess <- june_health_assess %>% select(site_name, plant_number, camera.x, camera.y, first_photo.x, first_photo.y, last_photo.x, last_photo.y, everything())

# Replace all original values with new and remove remnant columns
june_health_assess <- june_health_assess %>% mutate(
  camera = coalesce(camera.y, camera.x), # y first ensures replacing with new values
  first_photo = first_photo.y, #, as.integer(first_photo.x)),
  last_photo = last_photo.y, # as.integer(last_photo.x)),
) %>% select(-camera.x, -camera.y, -first_photo.x, -first_photo.y, -last_photo.x, -last_photo.y)

rm(june_july_photos)
