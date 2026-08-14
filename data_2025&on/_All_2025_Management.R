
# 1. Processing
june_processing_path <- "data_2025&on/1_Processing/2025_June_July/"
source(paste0(june_processing_path, "_2025_June_July_All_Processing.R"))

august_processing_path <- "data_2025&on/1_Processing/2025_August/"
source(paste0(august_processing_path, "_2025_August_All_Processing.R"))

# 2. Merging

# 3. Checking & 4. Cleaning (Implemented together)
### Needs revamping after merger
cleaning_path <- "data_2025&on/3_Checking_4_Cleaning/"
source(paste0(cleaning_path, "_All_Cleaning.R"))


# --------------------------------
# View Final Data types
# 1. Create a data frame of the column names and their precise internal type (e.g., double, integer)
data_types_table <- data.frame(
  Variable_Name = names(after_health_assess),
  Specific_Data_Type = sapply(after_health_assess, typeof),
  row.names = NULL
)

# 2. View it as a beautifully formatted table right in your console
knitr::kable(data_types_table, format = "markdown")
