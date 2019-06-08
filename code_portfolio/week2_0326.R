# import libraries
library(readr)
# clean up environment
rm(list=ls())
# load data
myData <- read_csv("D:\\ANLY_506\\US EPA data 2017.csv")
# show rows and cols about the data
nrow(myData)
ncol(myData)
# a summary of the data
str(myData)
# show first top rows of the data
head(myData, 10)
# show bottom rows of the data
tail(myData, 10)