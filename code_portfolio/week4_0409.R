# import library
library(tidyverse)
# read real csv file
heights <- read_csv("data/heights.csv")
# readan inline csv file
read_csv("a,b,c
1,2,3
4,5,6")
# parseing a vector
str(parse_logical(c("TRUE", "FALSE", "NA")))
# parse a vector and for empty element, '.' will be filled
parse_integer(c("1", "231", ".", "456"), na = ".")
# parse numbers
parse_number("$100")
# Each hexadecimal number represents a byte of information
charToRaw("hello")
# show how to use factors to parse
fruit <- c("apple", "banana")
parse_factor(c("apple", "banana"), levels = fruit)
# parse date
parse_date("2019-04-09")
# help to figure out the type of data
guess_parser("2010-10-01")
#> [1] "date"
guess_parser("15:01")
#> [1] "time"
# read csv and deal with the problems
challenge <- read_csv(
  readr_example("challenge.csv"), 
  col_types = cols(
    x = col_integer(),
    y = col_character()
  )
  # write into a csv file
  write_csv(challenge, "challenge.csv")
)