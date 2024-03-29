## ----include = FALSE----------------------------------------------------------

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)



## ----setup--------------------------------------------------------------------

library(joyn)
library(data.table)

x <- data.table(id = c(1, 4, 2, 3, NA),
                t  = c(1L, 2L, 1L, 2L, NA),
                country = c(16, 12, 3, NA, 15))
  
y <- data.table(id  = c(1, 2, 5, 6, 3),
                gdp = c(11L, 15L, 20L, 13L, 10L),
                country = 16:20)


## ----ex1----------------------------------------------------------------------

# The variables with the same name, `id` and `country`, are used as key
# variables.

joyn(x = x, 
     y = y)


## ----ex2----------------------------------------------------------------------

# Joining by country

joyn(x = x, 
     y = y, 
     by = "country")


## -----------------------------------------------------------------------------

joyn(x = x, 
     y = y, 
     by = "id")


## ----ex3----------------------------------------------------------------------

joyn(x = x,
     y = y, 
     by = "id", 
     update_NAs = TRUE)


## ----ex4----------------------------------------------------------------------

# Notice that only the value that are 

joyn(x = x, 
     y = y, 
     by = "id", 
     update_values = TRUE)


## ----ex5----------------------------------------------------------------------

joyn(x = x, 
     y = y, 
     by = "id", 
     keep_common_vars = TRUE)


## ----ex6----------------------------------------------------------------------

# Keeping variable gdp 

joyn(x = x, 
     y = y, 
     by = "id", 
     y_vars_to_keep = "gdp")


