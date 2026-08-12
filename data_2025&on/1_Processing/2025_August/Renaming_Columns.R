# Author: Hank Helmers
# Date: 08-07-2026
# Purpose: Prepare the data columns for use in analyses and review scripts. 
#          This preparation mainly includes renaming and removal.


## Renaming columns for readability & clarity

# Remove unused columns
after_health_assess <- after_health_assess %>% select(-`Column 65`)

### August and on 2025 

## Same information as in June/July (there is a unique section below)
### basic information

# Timestamp 
after_health_assess <- after_health_assess %>% rename(timestamp = `Timestamp`)

# Email
after_health_assess <- after_health_assess %>% rename(email = `Email Address`)

# Date
after_health_assess <- after_health_assess %>% rename(date = `Date`)

# Site Name
after_health_assess <- after_health_assess %>% rename(site_name = `Site Number or Initial: JC-W-_______`)

# gps_north
after_health_assess <- after_health_assess %>% rename(gps_north = `GPS location NORTH`)

# gps_west
after_health_assess <- after_health_assess %>% rename(gps_west = `GPS Location WEST`)

# plant_initials
after_health_assess <- after_health_assess %>% rename(plant_initials = `Plant Initials (for example, SH or EL)`)

# Plant Numbers
after_health_assess <- after_health_assess %>% rename(plant_number = `Plant Number (e.g. 4th tree assessed will be 4)`)

# slope
after_health_assess <- after_health_assess %>% rename(slope = `Slope (degree)`)

# aspect
after_health_assess <- after_health_assess %>% rename(aspect = `Aspect (N, NE, E, etc)`)

# upland_rip
after_health_assess <- after_health_assess %>% rename(upland_rip = `Riparian or upland?`)

# plant_height_ft
after_health_assess <- after_health_assess %>% rename(plant_height_ft = `Plant Height (in FEET)`)

# photo info
after_health_assess <- after_health_assess %>% rename(first_photo = `Number of the 1st photo taken`)

after_health_assess <- after_health_assess %>% rename(last_photo = `Number of the last photo taken`)

after_health_assess <- after_health_assess %>% rename(camera = `Camera`)

# notes
after_health_assess <- after_health_assess %>% rename(additional_notes = `Any additional notes?`)

# shape_terminal_bud
after_health_assess <- after_health_assess %>% rename(shape_terminal_bud = `Shape of terminal bud`)

# shape_leaf_scar
after_health_assess <- after_health_assess %>% rename(shape_leaf_scar = `Shape of leaf scar`)

# shape_lenticels
after_health_assess <- after_health_assess %>% rename(shape_lenticels = `Shape / length of lenticels`)

# shape_hairs
after_health_assess <- after_health_assess %>% rename(shape_hairs = `Hairs on the end of the twigs`)

# associated_trees
after_health_assess <- after_health_assess %>% rename(associated_trees = `Associated tree species within 20 meters.`)

# competition
after_health_assess <- after_health_assess %>% rename(competition = `What competition is potentially threatening this tree?`)
after_health_assess <- after_health_assess %>% rename(other_competition_response = `If you answered "Other" above, please explain.`)


# Re-order to have photo info next to each other
after_health_assess <- after_health_assess %>%
  select(
    timestamp, site_name, plant_number, plant_initials,
    first_photo, last_photo, camera,
    everything()
  )


## ------------
## Unique renamings to this form 

after_health_assess <- after_health_assess %>% rename(hybrid_char_present = "Are any characteristics potentially indicating hybridity visible enough that you can assess them?  If you are waffling on whether or not you can assess the characteristics, you shouldn’t.")

after_health_assess <- after_health_assess %>% rename(adult_or_seedling = `Select the appropriate category for this tree:`)

# All adult questions
after_health_assess <- after_health_assess %>% rename(a_DBH_cm = `A: DBH (in CENTIMETERS)`)            
after_health_assess <- after_health_assess %>% rename(a_crown_class = `A: What is the crown class of this individual?`)
after_health_assess <- after_health_assess %>% rename(a_dead_or_alive = `A: Is this adult dead or alive?`)

# Dead adults section
after_health_assess <- after_health_assess %>% rename(a_d_trunk_epicormics = "A: Are there epicormic branches / sprouts from the trunk?...18")
after_health_assess <- after_health_assess %>% rename(a_d_base_epicormics = "A: Are there epicormic branches / sprouts from the base?...19")
after_health_assess <- after_health_assess %>% rename(a_d_visible_canker = "A: Are there visible cankers?...20")
after_health_assess <- after_health_assess %>% rename(a_d_base_canker_area = "A: How much of the surface area of the base / root flare (defined as visual uplift of roots above the soil surface, extending out from the tree, or if those are not present, the base of the tree up to 10cm above the soil surface) with canker visible (including underneath the bark)?...21")

after_health_assess <- after_health_assess %>% rename(a_d_9_feet_canker_area = "A:  If the first main live branch is above 9 feet: How much of the surface area of the bottom 9 ft of the trunk (starting above the root flare) is infected by canker, measured as a percentage?...22")

after_health_assess <- after_health_assess %>% rename(a_d_trunk_canker_area = "A: How much of the surface area of the trunk between the first live main branch and the root flare is infected by canker, measured as a percentage?...23")

after_health_assess <- after_health_assess %>% rename(a_d_circum_girdled = "A: At the part of the trunk that appears most girdled by canker, what portion of the circumference of the trunk is girdled?...24")                                                                                                                                                                                                                                           
# Alive Adults

after_health_assess <- after_health_assess %>% rename(a_a_producing_seed = "A: Producing seed?")
after_health_assess <- after_health_assess %>% rename(a_a_percent_live_canopy = "A: Percent live canopy (estimate, being sure to only include live branches in assessment)\r\n\r\nNote: This is a measure of crown density. In order to estimate this, first envision the amount of canopy there would be if the tree were fully healthy. Butternuts do not typically have a tightly formed canopy even when healthy so be sure to evaluate based on branch presence and location. Then estimate what percent of the envisioned canopy is actually present. This will be your estimate of percent live canopy.")
after_health_assess <- after_health_assess %>% rename(a_a_base_epicormics = "A: Are there epicormic branches / sprouts from the base?...27")
after_health_assess <- after_health_assess %>% rename(a_a_trunk_epicormics = "A: Are there epicormic branches / sprouts from the trunk?...28")    
after_health_assess <- after_health_assess %>% rename(a_a_visible_canker = "A: Are there visible cankers?...29")                                                                            
after_health_assess <- after_health_assess %>% rename(a_a_visible_callous = "A: If large cankers are present, do you see evidence of callousing, whether currently being calloused over or having previously been calloused over? \r\n\r\nIf there are no large cankers present, enter \"NA.\" If there are large cankers present but it is not clear whether to not they are healing over, enter \"Maybe.\"")
after_health_assess <- after_health_assess %>% rename(a_a_base_canker_area = "A: How much of the surface area of the base / root flare (defined as visual uplift of roots above the soil surface, extending out from the tree, or if those are not present, the base of the tree up to 10cm above the soil surface) with canker visible (including underneath the bark)?...31")
after_health_assess <- after_health_assess %>% rename(a_a_9_feet_canker_area = "A:  If the first main live branch is above 9 feet: How much of the surface area of the bottom 9 ft of the trunk (starting above the root flare) is infected by canker, measured as a percentage?...32")
after_health_assess <- after_health_assess %>% rename(a_a_trunk_canker_area = "A: How much of the surface area of the trunk between the first live main branch and the root flare is infected by canker, measured as a percentage?...33")
after_health_assess <- after_health_assess %>% rename(a_a_circum_girdled = "A: At the part of the trunk that appears most girdled by canker, what portion of the circumference of the trunk is girdled?...34")                                           
after_health_assess <- after_health_assess %>% rename(a_a_purdue_severity_canker = "A: Assess severity of infection. Focus on the bottom 10 feet of the tree when assessing the number and size of cankers, noting that cankers can be hard to see on old trees with thick bark. CANKERS:")
after_health_assess <- after_health_assess %>% rename(a_a_purdue_severity_canopy ="A: Assess severity of infection. CANOPY:")
after_health_assess <- after_health_assess %>% rename(a_a_seed_estimate = "A: Roughly how many seeds are on the tree?")                                                                                                                                                 
after_health_assess <- after_health_assess %>% rename(a_a_seed_per_bunch = "A: How many seed are in each bunch (average estimate)?")

# All seedlings 
after_health_assess <- after_health_assess %>% rename(s_densio_north = "S: North")
after_health_assess <- after_health_assess %>% rename(s_densio_east = "S: East")
after_health_assess <- after_health_assess %>% rename(s_densio_south = "S: South")                    
after_health_assess <- after_health_assess %>% rename(s_densio_west = "S: West")  
after_health_assess <- after_health_assess %>% rename(s_basal_diameter ="S: Basal diameter in MILLIMETERS")
after_health_assess <- after_health_assess %>% rename(s_signs_damage = "S: Does this seedling show signs of damage from any of the following?")                                                         
after_health_assess <- after_health_assess %>% rename(s_previous_stem_present = "S: How many previous or dead stems are present? (Enter 0 if none)\r\n\r\nNote that previous or dead stems may only be indicated by evidence of stems that appear to have been mowed, browsed by deer, or died back for any reason like drought, canker, insect, etc. Note, be sure to feel around the base of the seedling to check for additional previous stems.")                                    
after_health_assess <- after_health_assess %>% rename(s_germ_year_estimate = "S: Estimate: In what year did this individual germinate?\r\n\r\nThis is a loose estimate, but some guidelines: A germination from this growing season will be all green and the sprout nut shell is likely present under the soil surface. A germination from the previous growing season will have some wood equivalent to one year's growth with new green growth in addition. Number of previous stems or internodes also indicate previous years of growth. Each previous stem, unless notably wide, can be counted as 1 year. A previously stem with a half inch diameter could be 5 years or more.")

# Alive/dead seedling questions
after_health_assess <- after_health_assess %>% rename(s_dead_or_alive = "S: Is this seedlings dead or alive?")                                                                 
after_health_assess <- after_health_assess %>% rename(s_d_visible_canker = "S: Are there visible cankers?...46")                                                                                      
after_health_assess <- after_health_assess %>% rename(s_a_percent_live_canopy = "S: Percent live canopy (for seedlings, estimate using portion of present healthy leaves)")                                                                                                   
after_health_assess <- after_health_assess %>% rename(s_a_visible_canker = "S: Are there visible cankers?...48")                                                                                                                                                         
after_health_assess <- after_health_assess %>% rename(s_a_visible_callous = "S: Do any cankers show signs of callousing?")                                                                                                                                                
after_health_assess <- after_health_assess %>% rename(s_base_canker_area = "S: How much of the base of the stem (up to 2 inches above soil) is infected by canker, e.g. as a percentage of base of the stem with cankers visible?")                                      
after_health_assess <- after_health_assess %>% rename(s_stem_canker_area = "S: How much of the surface area of the stem (excluding the bottom 2 inches) of the trunk is infected by canker, measured as a percentage?")                                                  
after_health_assess <- after_health_assess %>% rename(s_circum_girdled = "S: At the part of the stem that appears most girdled by canker, what portion of the circumference of the stem is girdled?")                                                                 

# -----------------

# Print out renaming
colnames(after_health_assess)
as.data.frame(colnames(after_health_assess))


