## ----include = FALSE----------------------------------------------------------

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

withr::local_options(joyn.verbose = TRUE)


## ----setup--------------------------------------------------------------------

library(joyn)
library(data.table)


## -----------------------------------------------------------------------------

x1 <- data.table(id  = c(1L, 1L, 2L, 3L, NA_integer_),
                 t   = c(1L, 2L, 1L, 2L, NA_integer_),
                 x   = 11:15)

y1 <- data.table(id  = c(1,2, 4),
                 y   = c(11L, 15L, 16))



## ----example------------------------------------------------------------------

# Option 1

joyn(x          = x1, 
     y          = y1, 
     keep       = "left",
     match_type = "m:1")

# Option 2 

joyn::left_join(x            = x1, 
                y            = y1, 
                relationship = "many-to-one") 

# Option 3

dplyr::left_join(x            = x1, 
                 y            = y1, 
                 relationship = "many-to-one") 



## ----left-ex1-----------------------------------------------------------------

# Data tables to be joined 

df1 <- data.frame(id = c(1L, 1L, 2L, 3L, NA_integer_, NA_integer_),
                  t  = c(1L, 2L, 1L, 2L, NA_integer_, 4L),
                  x  = 11:16)

df2 <- data.frame(id = c(1,2, 4, NA_integer_, 8),
                  y  = c(11L, 15L, 16, 17L, 18L),
                  t  = c(13:17))



## ----left-ex2-----------------------------------------------------------------

left_join(x            = df1, 
          y            = df2,
          relationship = "many-to-one", 
          by           = "id",
          update_NAs   = TRUE)


## -----------------------------------------------------------------------------

left_join(x              = df1, 
          y              = df2,
          relationship   = "many-to-one", 
          by             = "id", 
          y_vars_to_keep = "y")


## ----right-ex1----------------------------------------------------------------

right_join(x            = df1, 
          y            = df2,
          relationship = "many-to-one", 
          by           = "id",
          reportvar    = "right.joyn")


## ----right-ex2----------------------------------------------------------------

right_join(x            = df1, 
           y            = df2,
           relationship = "many-to-one", 
           by           = "id",
           reportvar    = "right.joyn")


## -----------------------------------------------------------------------------

full_join(x = x1, 
          y = y1, 
          relationship = "many-to-one", 
          keep = TRUE)


## -----------------------------------------------------------------------------

inner_join(x            = df1, 
           y             = df2,
           relationship  = "many-to-one", 
           by            = "id")


