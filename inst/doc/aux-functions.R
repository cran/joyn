## ----include = FALSE----------------------------------------------------------

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----setup--------------------------------------------------------------------

library(joyn)
library(data.table)


## ----ex1----------------------------------------------------------------------

x1 <- data.table(id = c(1L, 1L, 2L, 3L, NA_integer_),
                 t  = c(1L, 2L, 1L, 2L, NA_integer_),
                 x  = 11:15,
                 c  = c("a", "b", "a", "t", "d"),
                 c1 = c("h", "j", "k", "l", "y"))

y1 <- data.table(id = c(1,2, 4),
                 y  = c(11L, 15L, 16))

# Checking if x1 is uniquely identified by "id" with return_report = TRUE

is_id(dt = x1, 
      by = "id")

# Checking duplicates in x1 with return_report = FALSE

is_id(dt = x1, 
      by = "id", 
      return_report = FALSE)



## ----possible-ids-------------------------------------------------------------

# Identify possible unique identifier excluding variable t
possible_ids(dt      = x1, 
             exclude = "t")

# Identify possible unique identifier excluding character variables
possible_ids(dt      = x1, 
             exclude = "_character")

# Identify possible unique identifiers, excluding character variables but considering variable z
possible_ids(dt      = x1, 
             exclude = "_character",
             include = "z")


## ----is-balanced--------------------------------------------------------------

# Example with return = "logic", the default

is_balanced(df = x1,
            by = c("id", "t"))

# Example with return = "table"
is_balanced(df = x1,
            by = c("id", "t"), 
            return = "table")



## ----freq-table---------------------------------------------------------------

# Tabulating frequencies of var `id`

freq_table(x     = x1, 
           byvar = "id")[]

# Removing NAs from the calculation

freq_table(x     = x1, 
           byvar = "id", 
           na.rm = TRUE)[]



