

merging_path <- "data_2025&on/2_Merging/"

# Column Removal
source(paste0(merging_path, "Column_Removal.R"))

# Aligning names of directly matching variables
source(paste0(merging_path, "Aligning_variable_names.R"))

# Creating all missing columns for missing variables
source(paste0(merging_path, "Create_missing_columns.R"))
# Now, June/July and August contain the same column names 
  # Their values are not yet, up to date, but are able to
  # be combined now that they said columns directly.

# Align types across all variables
source(paste0(merging_path, "Aligning_variable_types.R"))

# Rectifying differences in specific variables 
## June_Dead_Individuals 
  ### Manually set by reviewing photos and additional notes
  source(paste0(merging_path, "June_Dead_Individuals.Rmd"))




# --------------------------------
# View aligned datasets
# 1. Create a data frame of the column names and their precise internal type (e.g., double, integer)
data_types_table <- data.frame(
  June_variable_name = names(june_health_assess),
  August_variable_name = names(after_health_assess),
  June_data_type = sapply(june_health_assess, typeof),
  August_data_type = sapply(after_health_assess, typeof),
  row.names = NULL
)

# 2. View it as a beautifully formatted table right in your console
knitr::kable(data_types_table, format = "markdown")
# --------------------------------

