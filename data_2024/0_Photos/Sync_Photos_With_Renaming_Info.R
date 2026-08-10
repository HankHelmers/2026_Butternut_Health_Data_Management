library(tidyverse)


# -------- Create photo info columns--------
# Create a camera column
health_assess_2024 <- health_assess_2024 %>% mutate(camera = NA)

# Need a first and last photo number
health_assess_2024 <- health_assess_2024 %>% rename(first_photo = `Photo numbers`)
health_assess_2024 <- health_assess_2024 %>% mutate(last_photo = NA)

# --------Type Conversion--------
# Treat photo numbers as numbers
health_assess_2024 <- health_assess_2024 %>% mutate(first_photo = as.integer(first_photo))
health_assess_2024 <- health_assess_2024 %>% mutate(last_photo = as.integer(last_photo))

# Treat camera as character
health_assess_2024 <- health_assess_2024 %>% mutate(camera = as.character(camera))

# --------Get photo info--------
photo_2024 <- read.csv("data_2024/0_Photos/2024_Photo_Information.csv")
photo_2024 <- photo_2024 %>% rename(date = Date)

# --------Save photo info in all data--------
health_assess_2024 <- health_assess_2024 %>% rows_update(photo_2024, by=c("site", "plant_number"))

rm(photo_2024)
