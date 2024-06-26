% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checks.R
\name{is_match_type_error}
\alias{is_match_type_error}
\title{Confirm if match type error}
\usage{
is_match_type_error(x, name, by, verbose, match_type_error)
}
\arguments{
\item{name}{name of data frame}

\item{by}{A vector of shared column names in \code{x} and \code{y} to merge on.
This defaults to the shared key columns between the two tables.
If \code{y} has no key columns, this defaults to the key of \code{x}.}

\item{match_type_error}{logical: from existing code}
}
\value{
logical
}
\description{
Confirm if match type error
}
\examples{
\dontrun{
# example with dt not uniquely identified by "id"
x1 = data.table(id = c(1L, 1L, 2L, 3L, NA_integer_),
                t  = c(1L, 2L, 1L, 2L, NA_integer_),
                x  = 11:15)
joyn:::is_match_type_error(x1, name = "x1", by = "id")
}
}
\keyword{internal}
