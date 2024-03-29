## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------

library(joyn)
library(data.table)

 x1 = data.table(id = c(1L, 1L, 2L, 3L, NA_integer_),
                 t  = c(1L, 2L, 1L, 2L, NA_integer_),
                 x  = 11:15)
 y1 = data.table(id = c(1,2, 4),
                 y  = c(11L, 15L, 16))
 
 x2 = data.table(id1 = c(1, 1, 2, 3, 3),
                 id2 = c(1, 1, 2, 3, 4),
                 t   = c(1L, 2L, 1L, 2L, NA_integer_),
                 x   = c(16, 12, NA, NA, 15))
 
 y2 = data.table(id  = c(1, 2, 5, 6, 3),
                 id2 = c(1, 1, 2, 3, 4),
                 y   = c(11L, 15L, 20L, 13L, 10L),
                 x   = c(16:20))
 

## ----ex1----------------------------------------------------------------------

# Example not specifying the key
merge(x = x1, 
      y = y1)

# Example specifying the key
merge(x = x1, 
      y = y1,
      by = "id")


## ----ex2----------------------------------------------------------------------

df1 <- data.frame(id = c(1L, 1L, 2L, 3L, NA_integer_, NA_integer_),
                  t  = c(1L, 2L, 1L, 2L, NA_integer_, 4L),
                  x  = 11:16)

df2 <- data.frame(id = c(1,2, 4, NA_integer_, 8),
                  y  = c(11L, 15L, 16, 17L, 18L),
                  t  = c(13:17))

merge(x    = df1,
      y    = df2,
      by.x = "x",
      by.y = "y")


## ----ex3----------------------------------------------------------------------

# Example with many to many merge
joyn::merge(x          = x2,
            y          = y2,
            by.x       = "id1",
            by.y       = "id2",
            match_type = "m:m")

# Example with many to many merge
joyn::merge(x          = x1,
            y          = y1,
            by         = "id",
            match_type = "m:1")



