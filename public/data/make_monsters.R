library(tidyverse)

# Create monsters
monsters <- data.frame(id = 1:5,
                       color = c("pink", "green",  "pink", "green", "green"),
                       age = c(8,2,7,3,1),
                       hat = c(T,T,F,T,F) )

# Filter ----

## Single condition/test
monsters %>% filter(color == "pink")

## Multiple conditions
monsters %>% filter(color == "pink", age > 7)


# Select ----

## Keep only 2 columns
monsters %>% select(id, age)

## Drop columns with a '-' in front
monsters %>% select(-hat)


# Arrange

## From low to high
monsters %>% arrange(age)

## Descend from high to low
monsters %>% arrange(desc(age))


# Mutate

## Create a new column
monsters %>% mutate(is_baby = age < 3)

## Update existing column
monsters %>% mutate(age = age + 2)
