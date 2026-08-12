## ----echo=FALSE, message=FALSE, warning=FALSE------------
library(tidyverse)
library(readr)
library(DT)
library(dplyr)
library(styler)
library(lubridate) # For working with dates and times

original <- june_health_assess

# # Imports all June/July 2025 data
# june_health_assess <- read_csv("../data/Raw_Datasets/2025_June_July_Butternut_Health_Assessment_Form_Responses.csv")
# 
# source("../data_cleaning/2025_June_July_1_Preparing_Columns.R", local=TRUE)
# source("../data_cleaning/2025_June_July_2_Type_Conversions.R", local=TRUE)
# source("../data_cleaning/2025_June_July_3_Removing_Test_Entries.R", local=TRUE)
# source("../data_cleaning/2025_June_July_4_Processing_Dead_Adults.R", local=TRUE)
# 
# exists("june_health_assess")


## --------------------------------------------------------
# Site name is WCP for all trees up until July 1st
last_wcp_time <- ymd_hms("2025-07-01 10:57:46")

june_health_assess <- june_health_assess %>%
  mutate(site_name = ifelse(timestamp < last_wcp_time, "WCP", site_name))

# Correct capitalization inconsistencies with CPVT and Sugar River
june_health_assess <- june_health_assess %>%
  mutate(site_name = case_when(
    site_name == "Cpvt" ~ "CPVT",
    site_name == "Sugar river" ~ "SR",
    site_name == "Sugar River" ~ "SR",
    TRUE ~ site_name # Otherwise, keep name the same
  ))



## --------------------------------------------------------
# Remove 'SH' or 'SH ' from the beginning of plant numbers 
june_health_assess$plant_number <- sub("^SH\\s*", "", june_health_assess$plant_number)

cleaning <- june_health_assess
cleaning$plant_number <- parse_number(cleaning$plant_number)

# Demonstrating changes
comparison <- tibble(
  original_plant_number = june_health_assess$plant_number,
  clean_plant_number = cleaning$plant_number
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

# Applying changes
june_health_assess <- june_health_assess %>% mutate(plant_number = as.integer(parse_number(plant_number)))


## --------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(adult_or_seedling = case_when(
  adult_or_seedling == "Yes" ~ "Seedling",
  adult_or_seedling == "No" ~ "Adult"
))


## --------------------------------------------------------
june_6th = ymd_hms("2025-06-6 23:59:59") # "this is black walnut!"

june_health_assess <- june_health_assess %>%
  mutate(adult_or_seedling = if_else(
    timestamp < june_6th,
    # If TRUE (before June 6th), update labels by densiometer:
    case_when(
      is.na(densio_north) ~ "Adult",
      TRUE ~ "Seedling" 
    ),
    # If FALSE (June 6th or later), keep whatever was already there
    adult_or_seedling
  ))



## --------------------------------------------------------
june_health_assess <- june_health_assess %>% mutate(plant_initials = case_when(
  site_name == "WCP" ~ "SH",
  site_name == "SR" ~ "SR",
  site_name == "ILM" ~ "BU",
  site_name == "CPVT" ~ "BU",
  TRUE ~ plant_initials
))


