# Author: Hank Helmers
# Date: 08-28-2025, 09-13-2025
# Purpose: Prepare the data columns for use in analyses and review scripts. 
#          This preparation mainly includes renaming and removal.


# Remove columns created for the August and onward version
june_health_assess <- june_health_assess %>% select(1:60)

## Renaming columns for readability & clarity

### June-July 2025 
### basic information

# Timestamp 
june_health_assess <- june_health_assess %>% rename(timestamp = `Timestamp`)

# Email
june_health_assess <- june_health_assess %>% rename(email = `Email Address`)

# Date
june_health_assess <- june_health_assess %>% rename(date = `Date`)

# Site Name
june_health_assess <- june_health_assess %>% rename(site_name = `Site Number or Initial: JC-W-_______`)

# gps_north
june_health_assess <- june_health_assess %>% rename(gps_north = `GPS location NORTH`)

# gps_west
june_health_assess <- june_health_assess %>% rename(gps_west = `GPS Location WEST`)

# plant_initials
june_health_assess <- june_health_assess %>% rename(plant_initials = `Plant Initials (for example, SH or EL)`)

# Plant Numbers
june_health_assess <- june_health_assess %>% rename(plant_number = `Plant Number (e.g. 4th tree assessed will be 4)`)

# slope
june_health_assess <- june_health_assess %>% rename(slope = `Slope (degree)`)

# aspect
june_health_assess <- june_health_assess %>% rename(aspect = `Aspect (N, NE, E, etc)`)

# upland_rip
june_health_assess <- june_health_assess %>% rename(upland_rip = `Riparian or upland?`)

# plant_height_ft
june_health_assess <- june_health_assess %>% rename(plant_height_ft = `Plant Height (in FEET)`)

# DBH
june_health_assess <- june_health_assess %>% rename(dbh_cm = `DBH (in CENTIMETERS)`)

# has_canker
june_health_assess <- june_health_assess %>% rename(visible_canker = `Visible cankers?`)

# has_callous
june_health_assess <- june_health_assess %>% rename_with(~ "has_callous", contains("large cankers"))

# seedling_y_n
june_health_assess <- june_health_assess %>% rename(adult_or_seedling = `Is this individual a seedling?`)

# photo info
june_health_assess <- june_health_assess %>% rename(first_photo = `Number of the 1st photo taken`)

june_health_assess <- june_health_assess %>% rename(last_photo = `Number of the last photo taken`)

june_health_assess <- june_health_assess %>% rename(camera = `Camera`)

# notes
june_health_assess <- june_health_assess %>% rename(additional_notes = `Any additional notes?`)


# Re-order to have photo info next to each other
june_health_assess <- june_health_assess %>%
  select(
    timestamp, date, site_name, plant_number, plant_initials, 
    first_photo, last_photo, camera,
    everything()
  )


### Seeds
# Producing seeds
june_health_assess <- june_health_assess %>% rename(producing_seed = `Producing seed?`)

# seed_estimate
june_health_assess <- june_health_assess %>% rename(seed_estimate = `Roughly how many seeds are on the tree?`)

# seeds_per_bunch
june_health_assess <- june_health_assess %>% rename(seeds_per_bunch = `How many seed are in each bunch (average estimate)?`)


### % observations
# % live canopy
june_health_assess <- june_health_assess %>% rename(percent_live_canopy = `Percent live canopy (estimate, being sure to only include live branches in assessment)

Note: This is a measure of crown density. In order to estimate this, first envision the amount of canopy there would be if the tree were fully healthy. Butternuts do not typically have a tightly formed canopy even when healthy so be sure to evaluate based on branch presence and location. Then estimate what percent of the envisioned canopy is actually present. This will be your estimate of percent live canopy.`)


# base_epicormics
june_health_assess <- june_health_assess %>% rename(base_epicormics = `Number of epicormic branches / sprouts from the base`)

# trunk_epicormics
june_health_assess <- june_health_assess %>% rename(trunk_epicormics = `Number of epicormic branches / sprouts from the trunk`)

# girdled_canker_circum_2025
june_health_assess <- june_health_assess %>% rename(circum_girdled_canker = `At the part of the trunk that appears most girdled by canker, what portion of the circumference of the trunk is girdled?...31`)

# trunk_canker_area
june_health_assess <- june_health_assess %>% rename(trunk_canker_area = `How much area of the trunk below first main branch is infected by canker, measured as a percentage of total trunk with cankers visible (including cankering visible underneath uplifted bark)?`)

# base_canker_area
june_health_assess <- june_health_assess %>% rename(base_canker_area = `How much area of the base/ root flare is infected by canker, e.g. as a percentage of root flare (up to 10 cm above soil) with cankers visible (including underneath bark)?`)

### Densiometer
# densio_north
june_health_assess <- june_health_assess %>% rename(densio_north = North)

# densio_south
june_health_assess <- june_health_assess %>% rename(densio_south = South)

# densio_east
june_health_assess <- june_health_assess %>% rename(densio_east = East)

# densio_west 
june_health_assess <- june_health_assess %>% rename(densio_west = West)



### Categorical (purdue ratings, hybrid characters, competition, damage)
# crown class
june_health_assess <- june_health_assess %>% rename(crown_class = `What is the crown class of this individual?`)

# purdue_severity_canker
june_health_assess <- june_health_assess %>% rename(purdue_severity_canker = `Assess severity of infection. Focus on the bottom 10 feet of the tree when assessing the number and size of cankers, noting that cankers can be hard to see on old trees with thick bark. CANKERS:`)

# purdue_severity_canopy
june_health_assess <- june_health_assess %>% rename(purdue_severity_canopy = `Assess severity of infection. CANOPY:`)

# shape_terminal_bud
june_health_assess <- june_health_assess %>% rename(shape_terminal_bud = `Shape of terminal bud`)

# shape_leaf_scar
june_health_assess <- june_health_assess %>% rename(shape_leaf_scar = `Shape of leaf scar`)

# shape_lenticels
june_health_assess <- june_health_assess %>% rename(shape_lenticels = `Shape / length of lenticels`)

# shape_hairs
june_health_assess <- june_health_assess %>% rename(shape_hairs = `Hairs on the end of the twigs`)

# associated_trees
june_health_assess <- june_health_assess %>% rename(associated_trees = `Associated tree species within 20 meters.`)

# competition
june_health_assess <- june_health_assess %>% rename(competition = `What competition is potentially threatening this tree?`)
june_health_assess <- june_health_assess %>% rename(other_competition_response = `If you answered "Other" above, please explain.`)

# signs_of_damage_seedling
june_health_assess <- june_health_assess %>% rename(signs_of_damage_seedling = `Does this seedling show signs of damage from any of the following?`)

# signs_of_damage_trees
june_health_assess <- june_health_assess %>% rename(signs_of_damage_trees = `Does this tree show any signs of any of the following?`)


# Removal of unused questions 
june_health_assess <- june_health_assess %>% select(
  ## Bark phenotypes
  -`How deep are the furrows in the bark?`,
  -`What shade (from light/white to dark) is the tree bark?`,
)

# Removal of less used information
june_health_assess <- june_health_assess %>% select(
  # ## Basic information
  # -slope,
  # -aspect,
  # 
  ## Collections
  -`What did you collect?`,
  -`If VOUCHERS were collected, how many?`,
  -`If LEAVES ON SILICA FOR DNA were collected, how many?`,
  -`If CUTTINGS were collected, how many?`,
  -`If SEEDS were collected, how many?`,
  -`If other collections were made, please describe them here including the number collected.`
)

# Combine all Notes1/2/... into a single "Notes" column
june_health_assess <- june_health_assess %>% 
  mutate(
    notes = str_c(
      coalesce(additional_notes, ""),
      coalesce(Notes1, ""), # Coalesce will replace any NA's with ""
      coalesce(Notes2, ""),
      coalesce(Notes3, ""),
      coalesce(Notes4, ""),
      coalesce(Notes5, ""),
      coalesce(Notes6, ""),
      coalesce(Notes7, ""),
      sep = " "  # Optional: Adds a space between each note
    ),
    # Clean up any resulting double spaces or leading/trailing spaces
    notes = str_squish(notes) 
  )

# Remove the extra notes columns after combining
june_health_assess <- june_health_assess %>% select(
  - additional_notes,
  - Notes1, # Coalesce will replace any NA's with "" 
  - Notes2,
  - Notes3,
  - Notes4,
  - Notes5,
  - Notes6,
  - Notes7
)

# Re-order to have photo info next to each other
june_health_assess <- june_health_assess %>%
  select(
    timestamp, site_name, plant_number, plant_initials,
    first_photo, last_photo, camera,
    everything()
  )

# Print out renaming
colnames(june_health_assess)
as.data.frame(colnames(june_health_assess))


