library(knitr)
library(tidyverse)

cleaning_path <- "data_2025&on/3_Checking_4_Cleaning/"
cleaning_purl_path <- "communication/purl/Cleaning/"

# Errors during data entry
## Must be completed before Typing because these errors cause the typing to fail
purl(input=paste0(cleaning_path,"Data_Entry_Corrections.Rmd"), output=paste0(cleaning_purl_path,"Data_Entry_Corrections.R"))
source(paste0(cleaning_purl_path,"Data_Entry_Corrections.R"))

purl(input=paste0(cleaning_path,"Typing_with_introduced_NAs.Rmd"), output=paste0(cleaning_purl_path,"Typing_with_introduced_NAs.R"))
source(paste0(cleaning_purl_path,"Typing_with_introduced_NAs.R"))

# Implement data checks
purl(input=paste0(cleaning_path,"Implement_Data_Checks.Rmd"), output=paste0(cleaning_purl_path,"Implement_Data_Checks.R"))
source(paste0(cleaning_purl_path,"Implement_Data_Checks.R"))


