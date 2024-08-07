withr::local_options(joyn.verbose = FALSE)
library(data.table) |>
  suppressWarnings()
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


y3 <- data.table(id = c("c","b", "c", "a"),
                 y  = c(11L, 15L, 18L, 20L))

x3 <- data.table(id=c("c","b", "d"),
                 v=8:10,
                 foo=c(4,2, 7))

x4 = data.table(id1 = c(1, 1, 2, 3, 3),
                id2 = c(1, 1, 2, 3, 4),
                t   = c(1L, 2L, 1L, 2L, NA_integer_),
                x   = c(16, 12, NA, NA, 15))


y4 = data.table(id  = c(1, 2, 5, 6, 3),
                id2 = c(1, 1, 2, 3, 4),
                y   = c(11L, 15L, 20L, 13L, 10L),
                x   = c(16:20))

# usethis::use_data(x1, x2, x3, y1, y2, y3, x4, y4,
#                   overwrite = TRUE,
#                   internal = TRUE)

test_that("correct inputs", {
  dd <- "not a data.table/data.frame"

  freq_table(dd) |>
    expect_error()
})

test_that("correct frequencies", {

  b <- base::table(y4$id2) |>
    as.numeric()

  j <- freq_table(y4, "id2")
  j |>
    fsubset(id2 != "total") |>
    fselect(n) |>
    reg_elem() |>
    expect_equal(b)

})

test_that("correct totals", {

  tr <- nrow(y4)

  j <- freq_table(y4, "id2")
  j <- freq_table(y4, "id2")
  j |>
    fsubset(id2 == "total") |>
    fselect(n) |>
    reg_elem() |>
    expect_equal(tr)

})


