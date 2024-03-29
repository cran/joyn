## ----include = FALSE----------------------------------------------------------

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

withr::local_options(joyn.verbose = TRUE)


## ----setup--------------------------------------------------------------------

# Setup 
library(joyn)
library(data.table)


## ----msg-type-----------------------------------------------------------------

# Checking available types of messages
msgs_types = joyn:::type_choices()
print(msgs_types)


## ----info-ex1-----------------------------------------------------------------

# Example dataframes

x1 = data.table(id = c(1L, 1L, 2L, 3L, NA_integer_),
                t  = c(1L, 2L, 1L, 2L, NA_integer_),
                x  = 11:15)

y1 = data.table(id = c(1,2, 4),
                y  = c(11L, 15L, 16))


x2 = data.table(id = c(1, 4, 2, 3, NA),
                t  = c(1L, 2L, 1L, 2L, NA_integer_),
                x  = c(16, 12, NA, NA, 15))


y2 = data.table(id = c(1, 2, 5, 6, 3),
                yd = c(1, 2, 5, 6, 3),
                y  = c(11L, 15L, 20L, 13L, 10L),
                x  = c(16:20))

x3 = data.table(id1 = c(1, 1, 2, 3, 3),
                id2 = c(1, 1, 2, 3, 4),
                t   = c(1L, 2L, 1L, 2L, NA_integer_),
                x   = c(16, 12, NA, NA, 15))


y3 = data.table(id3  = c(1, 2, 5, 6, 3),
                id4 = c(1, 1, 2, 3, 4),
                y   = c(11L, 15L, 20L, 13L, 10L),
                z   = c(16:20))



# ------------------- Showing which var contains joyn report -------------------

# Joining x2 and y2
joyn(x              = x2,
     y              = y2,
     by             = "id", 
     y_vars_to_keep = FALSE)

# Printing the info message
joyn_msg(msg_type = "info")

# ---------------- Info about change in reporting variable name ----------------
joyn(x              = x2,
     y              = y2,
     by             = "id", 
     reportvar      = "x",
     y_vars_to_keep = FALSE)

joyn_msg(msg_type = "info")

# ------------- Informing that reporting variable is not returned -------------
joyn(x              = x2,
     y              = y2,
     by             = "id", 
     reportvar      = FALSE,
     y_vars_to_keep = FALSE)

joyn_msg(msg_type = "info")


## ----info-ex2-----------------------------------------------------------------

joyn(x              = x2,
     y              = y2,
     by             = "id", 
     y_vars_to_keep = TRUE)

joyn_msg(msg_type = "info")


## ----timing-ex1---------------------------------------------------------------

# --------------------------- Example with full join ---------------------------

joyn(x          = x1, 
     y          = y1, 
     match_type = "m:1")

joyn_msg("timing")


# --------------------------- Example with left join ---------------------------
left_join(x            = x1, 
          y            = y1, 
          relationship = "many-to-one")

joyn_msg("timing")


## ----warn-ex1-----------------------------------------------------------------

# Warning that "id" uniquely identifies y2 

joyn(x2, y2, by = "id", match_type = "1:m", verbose = TRUE)
joyn_msg("warn")


## ----warn-ex2-----------------------------------------------------------------

# ------------ Warning that "id" uniquely identifies both x2 and y2 ------------

joyn(x2, y2, by = "id", match_type = "m:m", verbose = TRUE)
joyn_msg("warn")

# ------------------ Warning that "id" uniquely identifies x2 ------------------

joyn(x2, y2, by = "id", match_type = "m:1", verbose = TRUE)
joyn_msg("warn")


## ----warn-ex3-----------------------------------------------------------------

joyn::left_join(x            = x1, 
                y            = y1, 
                relationship = "many-to-one", 
                keep         = NULL,
                na_matches   = "never")

joyn_msg("warn")


## ----err-ex1, error = TRUE----------------------------------------------------

# ----------------- Error due to input table x with no columns -----------------

x_empty = data.table()
  
joyn(x = x_empty,
     y = y1)

joyn_msg("err")

# ----------------------- Error due to duplicate names  ------------------------

x_duplicates = data.table(id          = c(1L, 1L, 2L, 3L, NA_integer_),
                          x           = c(1L, 2L, 1L, 2L, NA_integer_),
                          x           = 11:15,
                          check.names = FALSE)
joyn(x = x_duplicates,
     y = y1)

joyn_msg("err")


## ----err-ex2, error=TRUE------------------------------------------------------

joyn(x = x1, y=y1, by="id", match_type = "1:1")
joyn_msg("err")


## ----joyn-msg-ex--------------------------------------------------------------

# Execute a join 

joyn(x = x1, 
     y = y1, 
     match_type = "m:1")

# Print all messages stored
joyn_msg(msg_type = "all")

# Print info messages only 
joyn_msg(msg_type = "info")



