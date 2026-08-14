library(knitr)
library(tidyverse)

cleaning_path <- "data_2025&on/4_Cleaning/"
cleaning_purl_path <- "communication/purl/Cleaning/"

# Cleaning by specific variable
source(paste0(cleaning_path, "Slope.R"))

purl(paste0())
source(paste0(cleaning_path, "Slope.R"))

purl(input=paste0(cleaning_path,"Typing_with_introduced_NAs.Rmd"), output=paste0(cleaning_purl_path,"Typing_with_introduced_NAs.R"))
source(paste0(cleaning_purl_path,"Typing_with_introduced_NAs.R"))
