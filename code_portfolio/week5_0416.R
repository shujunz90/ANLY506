# import library. This is a library which can tidy up your messy datasets
library(tidyverse)
# add a new variable called rate to the table 
table1 %>% mutate(rate = cases / population * 10000)
# Compute cases per year
table1 %>% count(year, wt = cases)
# Visualise changes over time
library(ggplot2)
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))
# a table has gathering issues
table4a
# use gather function to tidy data
table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
# a table has spreading issues
table2
# use spread function to tidy data
table2 %>%
  spread(key = type, value = count)
# a table has separating issues
table3
# use separate function to tidy data
table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")
# or
table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)
# an opposite case of separating -> unite
table5 
table5 %>% 
  unite(new, century, year)
# create a new data
stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
stocks
stocks %>% 
  spread(year, return)
# deal with missing values
stocks %>% 
  spread(year, return) %>% 
  gather(year, return, `2015`:`2016`, na.rm = TRUE)