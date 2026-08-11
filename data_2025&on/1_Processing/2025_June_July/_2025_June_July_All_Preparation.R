library(tidyverse) # Clarity in code writing
library(readr)
library(styler)
library(dplyr)     # Data selecting and filtering
library(lubridate) # For working with dates and times

# ---------------------------------
# Import data
june_health_assess <- read_csv("source_data/2025_June_July_Butternut_Health_Assessment_Form_Responses.csv")

june_processing_path <- "data_2025&on/1_Processing/2025_June_July/"
source(paste0(june_processing_path, "Preparing_Columns.R"))
source(paste0(june_processing_path, "Typing.R"))
source(paste0(june_processing_path, "Removals.R"))
