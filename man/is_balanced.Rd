% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{is_balanced}
\alias{is_balanced}
\title{Is data frame balanced by group?}
\usage{
is_balanced(df, by, return = c("logic", "table"))
}
\arguments{
\item{df}{data frame}

\item{by}{character: variables used to check if \code{df} is balanced}

\item{return}{character: either "logic" or "table". If "logic", returns \code{TRUE}
or \code{FALSE} depending on whether data frame is balanced. If "table" returns the unbalanced
observations - i.e. the combinations of elements in specified variables not found in input \code{df}}
}
\value{
logical, if return == "logic", else returns data frame of unbalanced observations
}
\description{
Check if the data frame is balanced by group of columns, i.e., if it contains every combination of the elements in the specified variables
}
\examples{
x1 = data.frame(id = c(1L, 1L, 2L, 3L, NA_integer_),
                t  = c(1L, 2L, 1L, 2L, NA_integer_),
                x  = 11:15)
is_balanced(df = x1,
            by = c("id", "t"),
            return = "table") # returns combination of elements in "id" and "t" not present in df
is_balanced(df = x1,
            by = c("id", "t"),
            return = "logic") # FALSE
}
