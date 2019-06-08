# Print all the objects in my workspace
ls()
# clean environment
rm(list = ls())
# import library
library(readr)
# Print my current working directory
getwd()
# Change working directory 
setwd(dir = "D:\\ANLY_506\\submit\\")
# load data
myData <- read_csv("D:\\ANLY_506\\submit\\income.csv")
nObs <- nrow(myData)
nVars <- ncol(myData)

as_tibble(iris)
tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)
df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

x <- 1:5
y <- 6:10
z <- 11:15
#Combine vectors as columns in a matrix
cbind(x, y, z)
# Combine vectors as rows in a matrix
rbind(x, y, z)
cbind(c(1, 2, 3, 4, 5), c("a", "b", "c", "d", "e"))
head(ChickWeight)
View(ChickWeight)
summary(ChickWeight)
str(ChickWeight)
# names of dataframe
names(ChickWeight)
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "age" = c(24, 25, 42, 56, 22))
# add a new column
survey$sex <- c("m", "m", "f", "f", "m")
survey
names(survey)[1]
# access the dataframe
survey[1, ]