library(tidyverse)
library(palmerpenguins)


# Torn / lost penguins 
missing <- 'missing'

set.seed(100)

lost_penguins <- sample_n(palmerpenguins::penguins %>% 
                            filter(species == "Gentoo", 
                                   body_mass_g > 4900), 
                          3) %>%
  mutate(species = missing, 
         island = missing)

write_csv(lost_penguins, "content/data/torn_penguins.csv")

# Good penguins
untorn <- penguins

untorn <- untorn %>% 
  filter(species != "Gentoo" |
           !body_mass_g %in% lost_penguins$body_mass_g |
           !flipper_length_mm %in% lost_penguins$flipper_length_mm |
           !bill_length_mm %in% lost_penguins$bill_length_mm)

write_csv(untorn, "content/data/untorn_penguins.csv")
