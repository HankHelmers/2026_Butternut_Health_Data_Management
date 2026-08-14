library(tidyverse)
library(lubridate) # working with time data
library(knitr)     # purl
library(DT)        # datatables for visualizing changes

# ---------------------------------
# Import data
#   Suppressing the message because it just reads out all the column names
after_health_assess <- suppressMessages(read_csv("source_data/July_7_2026_Revisions_Butternut_Health_Assessmen.csv", show_col_types = FALSE))

# ---------------------------------
# 1. Processing
august_processing_path <- "data_2025&on/1_Processing/2025_August/"
august_purl_path <- "communication/purl/2025_August/"
source(paste0(august_processing_path, "Renaming_Columns.R"))
source(paste0(august_processing_path, "Column_Removal.R"))

purl(input=paste0(august_processing_path,"Combining_Columns.Rmd"), output=paste0(august_purl_path,"Combining_Columns.R"))
source(paste0(august_purl_path,"Combining_Columns.R"))

purl(input=paste0(august_processing_path,"Identification_Variables.Rmd"), output=paste0(august_purl_path,"Identification_Variables.R"))
source(paste0(august_purl_path, "Identification_Variables.R"))

source(paste0(august_processing_path, "Removals.R"))

purl(input=paste0(august_processing_path,"Adjustments_From_Form_Structure.Rmd"), output=paste0(august_purl_path,"Adjustments_From_Form_Structure.R"))
source(paste0(august_purl_path,"Adjustments_From_Form_Structure.R"))

purl(input=paste0(august_processing_path,"Categorical_Renamings.Rmd"), output=paste0(august_purl_path, "Categorical_Renamings.R"))
source(paste0(august_purl_path, "Categorical_Renamings.R"))

purl(input=paste0(august_processing_path,"Typing_without_introduced_NAs.Rmd"), output=paste0(august_purl_path, "Typing_without_introduced_NAs.R"))
source(paste0(august_purl_path, "Typing_without_introduced_NAs.R"))


# ---------------------------------
# Re-order 
after_health_assess <- after_health_assess %>%
  select(
    # Shared across both adults and seedlings
    timestamp, email, date, site_name, plant_number, plant_initials, 
    first_photo, last_photo, camera, adult_or_seedling, gps_north, gps_west,
    slope, aspect, plant_height_ft, shape_terminal_bud, shape_leaf_scar, shape_lenticels,
    shape_hairs, upland_rip, associated_trees, competition, other_competition_response, additional_notes,
    
    # All Adults
    a_DBH_cm, a_crown_class, a_dead_or_alive, a_visible_canker, 
    a_base_canker_area, a_9_feet_canker_area, a_trunk_canker_area,
    a_circum_girdled, a_trunk_epicormics, a_base_epicormics,
    
    # Alive, adults only
    a_a_percent_live_canopy, a_a_producing_seed, a_a_seed_estimate, a_a_seed_per_bunch, 
    a_a_visible_callous, a_a_purdue_severity_canker, a_a_purdue_severity_canopy, 
    
    # All seedlings
    s_basal_diameter, s_densio_north, s_densio_east, s_densio_south, s_densio_west,
    s_signs_damage, s_previous_stem_present, s_germ_year_estimate, s_dead_or_alive,
    s_visible_canker, s_base_canker_area, s_stem_canker_area, s_circum_girdled, 
    
    # Alive, seedlings only
    s_a_visible_callous, s_a_percent_live_canopy
  )

# Remove clutter from environment
rm(list = setdiff(ls(), union("june_health_assess", "after_health_assess")))

# Write to CSV
write.csv(after_health_assess, "output_data/1_processed_August_2025_Health_Assessments.csv", row.names = FALSE)

# ---------------------------------
# Data types
# 1. Create a data frame of the column names and their precise internal type (e.g., double, integer)
data_types_table <- data.frame(
  Variable_Name = names(after_health_assess),
  Specific_Data_Type = sapply(after_health_assess, typeof),
  row.names = NULL
)

# 2. View it as a beautifully formatted table right in your console
knitr::kable(data_types_table, format = "markdown")
