library(tidyverse)
library(lubridate) # working with time data

# ---------------------------------
# Import data
after_health_assess <- read_csv("source_data/July_7_2026_Revisions_Butternut_Health_Assessmen.csv")

august_processing_path <- "data_2025&on/1_Processing/2025_August/"
source(paste0(august_processing_path, "Preparing_Columns.R"))
source(paste0(august_processing_path, "Typing.R"))
source(paste0(august_processing_path, "Removals.R"))
source(paste0(august_processing_path, "Variable_by_Variable_Processing.R"))
