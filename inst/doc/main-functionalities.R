## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

withr::local_options(joyn.verbose = FALSE)
#withr::local_options(joyn.match_type = )


## ----setup--------------------------------------------------------------------
library(joyn)

## ----dt-----------------------------------------------------------------------

library(joyn)
library(data.table)

x1 <- data.table(id = c(1L, 1L, 2L, 3L, NA_integer_),
                 t  = c(1L, 2L, 1L, 2L, NA_integer_),
                 x  = 11:15)

y1 <- data.table(id = c(1,2, 4),
                 y  = c(11L, 15L, 16))


x2 <- data.table(id = c(1, 4, 2, 3, NA),
                 t  = c(1L, 2L, 1L, 2L, NA_integer_),
                 x  = c(16, 12, NA, NA, 15))


y2 <- data.table(id = c(1, 2, 5, 6, 3),
                 yd = c(1, 2, 5, 6, 3),
                 y  = c(11L, 15L, 20L, 13L, 10L),
                 x  = c(16:20))

x3 <- data.table(id  = c("c","b", "d", "d"),
                 v   = 8:11,
                 foo = c(4,2, 7, 3))

y3 <- data.table(id = c("c","b", "c", "a"),
                 y  = c(11L, 15L, 18L, 20L))


x4 <- data.table(id1 = c(1, 1, 2, 3, 3),
                 id2 = c(1, 1, 2, 3, 4),
                 t   = c(1L, 2L, 1L, 2L, NA_integer_),
                 x   = c(16, 12, NA, NA, 15))

y4 <- data.table(id  = c(1, 2, 5, 6, 3),
                 id2 = c(1, 1, 2, 3, 4),
                 y   = c(11L, 15L, 20L, 13L, 10L),
                 x   = c(16:20))


x5 <- data.table(id      = c(1, 4, 2, 3, NA),
                 t       = c(1L, 2L, 1L, 2L, NA),
                 country = c(16, 12, 3, NA, 15))
  
y5 <- data.table(id      = c(1, 2, 2, 6, 3),
                 gdp     = c(11L, 15L, 20L, 13L, 10L),
                 country = 16:20)


## ----simple-join--------------------------------------------------------------

# Calling joyn() to join x1 and y1

joyn(x = x1,
     y = y1, 
     match_type = "m:1" ) #Note RT: remove this argument once fixing the default value


## ----echo =FALSE--------------------------------------------------------------

knitr::kable(
  tibble::tribble(
~numeric, ~character, ~meaning,
1, "x", "Obs only available in x table",
2, "y", "Obs only available in y table",
3, "x & y", "Matching obs available in both tables",
4, "NA updated", "NAs in x updated with actual values in variables with same names in y",
5, "value updated", "Actual values and NAs in x updated with actual values in variables with same names in y",
6, "not updated", "Actual values and NAs in x are NOT updated with actual values in y"
), format = "simple", align = "lcl")


## ----by-vars------------------------------------------------------------------

# Join with one variable in common

joyn(x = x1,
     y = y1, 
     by = "id", 
     match_type = "m:1")


## ----diff-by-vars-------------------------------------------------------------

joyn(x = x4, 
     y = y4, 
     by = c("id1 = id", "id2"), 
     match_type = "m:m")


## ----relationships------------------------------------------------------------

# Many to one match type
joyn(x = x1,
     y = y1,
     by = "id",
     match_type = "m:1")

# Many to many match type
joyn(x = x3,
     y = y3,
     by = "id",
     match_type = "m:m")

# One to one match type - the default
joyn(x = x2,
     y = y2,
     by = "id",
     match_type = "1:1")

# Same join as:

joyn(x = x2,
     y = y2,
     by = "id")


# One to many match type 
joyn(x = x5,
     y = y5,
     by = "id",
     match_type = "1:m")


## ----join-type, error=TRUE----------------------------------------------------

# Merging correctly but getting error because something is not right in the data
joyn(x3, y3, by = "id", match_type = "1:1")

# Merging wrongly but getting NO errors because you did not use match_type
joyn(x3, y3, by = "id")


## ----full---------------------------------------------------------------------

# Full join 

joyn(x          = x1, 
     y          = y1, 
     match_type = "m:m")


## ----left---------------------------------------------------------------------

# keep obs in x

joyn(x          = x1, 
     y          = y1, 
     keep       = "left", 
     match_type = "m:m")


## ----right--------------------------------------------------------------------

# keep obs in y

joyn(x          = x1, 
     y          = y1,
     keep       = "right", 
     match_type = "m:m")


## ----inner--------------------------------------------------------------------

# keep matching obs in both tables

joyn(x1, y1, keep = "inner", match_type = "m:m")


## ----ex-verbose---------------------------------------------------------------

joyn(x = x3, 
     y = y3, 
     by = "id", 
     match_type = "m:m",
     verbose = TRUE)


