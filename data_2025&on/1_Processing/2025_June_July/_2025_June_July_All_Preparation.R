library(tidyverse) # Clarity in code writing
library(readr)
library(styler)
library(dplyr)     # Data selecting and filtering
library(lubridate) # For working with dates and times

# ---------------------------------
# Import data
june_health_assess <- read_csv("source_data/2025_June_July_Butternut_Health_Assessment_Form_Responses.csv")

# ---------------------------------
# 1a. Processing
june_processing_path <- "data_2025&on/1_Processing/2025_June_July/"
source(paste0(june_processing_path, "Preparing_Columns.R"))
source(paste0(june_processing_path, "Typing.R"))
source(paste0(june_processing_path, "Parse_NAs.R"))
source(paste0(june_processing_path, "Removals.R"))

purl(input=paste0(june_processing_path,"Identification_Variables.Rmd"), output="communication/purl/Identification_Variables.R")
source("communication/purl/Identification_Variables.R")

purl(input=paste0(june_processing_path,"Unique_Type_Conversions.Rmd"), output="communication/purl/Unique_Type_Conversions.R")
source("communication/purl/Unique_Type_Conversions.R")

purl(input=paste0(june_processing_path,"Categorical_Renamings.Rmd"), output="communication/purl/Categorical_Renamings.R")
source("communication/purl/Categorical_Renamings.R")

# 1b. Photos


# Write to CSV
write.csv(june_health_assess, "output_data/1_processed_June_July_2025_Health_Assessments.csv", row.names = FALSE)

