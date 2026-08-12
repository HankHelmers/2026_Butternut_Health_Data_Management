# Removing test entries
# Entries used when making the form need to be removed.

# Removal of test entries
test_entry_1 = ymd_hms("2025-06-06 15:06:31") # "EL & HH Testing"
test_entry_2 = ymd_hms("2025-06-06 15:08:27") # "EL & HH Testing again"
test_entry_3 = ymd_hms("2025-06-26 9:45:29")   # data was not consistent with formatting and looked randomly input
test_entry_4 = ymd_hms("2025-07-02 09:41:40") # "Fake site - practice entry"
test_entry_5 = ymd_hms("2025-08-06 15:31:37")  # "test entry"
test_entry_6 = ymd_hms("2025-08-06 15:38:19")  # "test entry" 

# Removing black walnuts
black_walnut = ymd_hms("2025-06-19 10:46:22") # "this is black walnut!"

# Note that black walnuts are not removed here because we need to keep those 
# data points around for thorough photo data tracking. 
#
# Black walnut data points are removed for the health assessment data, however.
remove_entries = c(black_walnut, test_entry_1, test_entry_2, test_entry_3, test_entry_4, test_entry_5, test_entry_6)

june_health_assess <- june_health_assess %>% filter(!timestamp %in% remove_entries)
