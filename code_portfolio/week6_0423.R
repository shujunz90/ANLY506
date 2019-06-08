#
library(nycflights13)
library(tidyverse)
# This data frame contains all 336,776 flights that departed from New York City in 2013
flights
View(flights)
# Pick observations by their values (filter()).
# Reorder the rows (arrange()).
# Pick variables by their names (select()).
# Create new variables with functions of existing variables (mutate()).
# Collapse many values down to a single summary (summarise()).
feb1 <- filter(flights, month == 2, day == 1)
filter(flights, month == 10 | month == 9)
filter(flights, arr_delay <= 100, dep_delay <= 100)
##
arrange(flights, desc(dep_delay))
##
select(flights, year, month, day)
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
##
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)
##
by_day <- group_by(flights, year, month, day)
##
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))