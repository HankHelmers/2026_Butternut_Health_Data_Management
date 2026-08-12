# Removing unnecessary columns
#  
#  Which columns to remove were discussed and clarified in this document:
#  https://docs.google.com/spreadsheets/d/1QVQYW0Z-lzjaGrMnJum4yf0CQDpATa4U4rISqFzryJ4/edit?gid=1202896367#gid=1202896367
# 
#  Reasonings are summarized at each step.

# Month sampled
# Remove. Derivable from the 'Date Sampled' and no analog in 2025 data. 
health_assess_2024 <- health_assess_2024 %>% select(-`Month sampled`) 

# Notes on sample
# Remove. Not relevant to 2025.
health_assess_2024 <- health_assess_2024 %>% select(-`Notes on sample collection`) 

# Collected (leaf samples)
# Remove. Not relevant to 2025.
health_assess_2024 <- health_assess_2024 %>% select(-Collected) 

# (Y/N) Canker Status Written On Sample Bag
# Remove. Already used to derive "has_canker"
health_assess_2024 <- health_assess_2024 %>% select(-`(Y/N) Canker Status Written On Sample Bag`)

# (Y/N) Transcribed from 2024 data sheets
# Remove. Implicit yes from data being there, relevant only in the google form where data was entered.
health_assess_2024 <- health_assess_2024 %>% select(-`(Y/N) Transcribed from 2024 data sheets`)
