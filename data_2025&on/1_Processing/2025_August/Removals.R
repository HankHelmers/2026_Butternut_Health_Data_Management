# Removing test entries
#   Entries used when making the form need to be removed.

# Removal of test entries
test_entry_1 = ymd_hms("2025-08-15 12:33:57") # site_name = "TEST"
test_entry_2 = ymd_hms("2025-08-15 12:44:58") # site_name = "TEST"

# Test entries for Catherine's training
#   Any trees on August 21st
#   See Daily Log notes for verification: https://docs.google.com/document/d/1YTwkGDS85XlJPeSThDw17VzfYfhEg43UTGmF2hHKVcw/edit?tab=t.0#heading=h.93773v2ct9wp
test_entry_3 = ymd_hms("2025-08-21 10:30:55")
test_entry_4 = ymd_hms("2025-08-21 11:28:22")
test_entry_5 = ymd_hms("2025-08-21 12:08:23")
test_entry_6 = ymd_hms("2025-08-21 12:59:46")

remove_entries = c(test_entry_1, test_entry_2, test_entry_3, test_entry_4, test_entry_5, test_entry_6)

after_health_assess <- after_health_assess %>% filter(!timestamp %in% remove_entries)

