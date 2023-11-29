library(tidyverse)
library(readxl)
library(writexl)
library(rworldmap)
library(lubridate)

number_rows <- 70

crew_df <- data.frame(id = as.character(seq(1:number_rows)),
                      submit_date = today()-sample(1:10, number_rows, replace = T),
                      country = sample(rworldmap::countryExData$Country,
                                       size = number_rows, replace = T),
                      nut_allergy = sample(c(rep(T, 10), rep(F,2)),
                                           size = number_rows, replace = T),
                      egg_allergy = sample(c(rep(T, 25), rep(F,3)),
                                           size = number_rows, replace = T),
                      days_on_the_ship = sample(10:28, size = number_rows,
                                                replace = T),
                      meals_per_day = sample(2:4, size = number_rows,
                                             replace = T),
                      favorite_goody = sample(c("cinnamon rolls", "brownies",
                                                "oatmeal cookies", "baklava",
                                                "short-bread", "chocolate croissant",
                                                "apple pie", "banana bread",
                                                "jelly donuts"),
                                              size = number_rows,
                                              replace = T)) %>%
  bind_rows(data.frame(id = "test",
                       submit_date = ymd('1900-01-01'),
                       country = "test-country",
                       nut_allergy = NA,
                       egg_allergy = NA,
                       days_on_the_ship = 1000,
                       meals_per_day = 100,
                       favorite_goody = "sugar"))


write_xlsx(crew_df, "crew_food_prefs.xlsx")
