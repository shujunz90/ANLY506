library(tidyverse)
# draw bars
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
# count how many observations
diamonds %>% count(cut)
#draw histogram
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)
# use filter to pick observations
smaller <- diamonds %>% 
  filter(carat < 3)
# draw using lines compared with histogram
ggplot(data = smaller, mapping = aes(x = carat, colour = cut)) +
  geom_freqpoly(binwidth = 0.1)
# choose binwidth for histogram
ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)
ggplot(data = faithful, mapping = aes(x = eruptions)) + 
  geom_histogram(binwidth = 0.25)
# making a new variable with is.na().
nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
# show the new variable
ggplot(mapping = aes(sched_dep_time)) + 
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)
# 
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))

diamonds %>% 
  count(color, cut)

# use a model to remove the very strong relationship between price and carat so we can explore the subtleties that remain
library(modelr)
mod <- lm(log(price) ~ log(carat), data = diamonds)

diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))

ggplot(data = diamonds2) + 
  geom_point(mapping = aes(x = carat, y = resid))