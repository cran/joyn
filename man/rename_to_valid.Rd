% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{rename_to_valid}
\alias{rename_to_valid}
\title{Rename to syntactically valid names}
\usage{
rename_to_valid(name, verbose = getOption("joyn.verbose"))
}
\arguments{
\item{name}{character: name to be coerced to syntactically valid name}

\item{verbose}{logical: if FALSE, it won't display any message (programmer's
option). Default is TRUE.}
}
\value{
valid character name
}
\description{
Rename to syntactically valid names
}
\examples{
joyn:::rename_to_valid("x y")
}
