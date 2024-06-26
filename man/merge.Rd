% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/merge-data.table.R
\name{merge}
\alias{merge}
\title{Merge two data frames}
\usage{
merge(
  x,
  y,
  by = NULL,
  by.x = NULL,
  by.y = NULL,
  all = FALSE,
  all.x = all,
  all.y = all,
  sort = TRUE,
  suffixes = c(".x", ".y"),
  no.dups = TRUE,
  allow.cartesian = getOption("datatable.allow.cartesian"),
  match_type = c("m:m", "m:1", "1:m", "1:1"),
  keep_common_vars = TRUE,
  ...
)
}
\arguments{
\item{x, y}{\code{data table}s. \code{y} is coerced to a \code{data.table} if
it isn't one already.}

\item{by}{A vector of shared column names in \code{x} and \code{y} to merge on.
This defaults to the shared key columns between the two tables.
If \code{y} has no key columns, this defaults to the key of \code{x}.}

\item{by.x, by.y}{Vectors of column names in \code{x} and \code{y} to merge on.}

\item{all}{logical; \code{all = TRUE} is shorthand to save setting both
\code{all.x = TRUE} and \code{all.y = TRUE}.}

\item{all.x}{logical; if \code{TRUE}, rows from \code{x} which have no matching row
in \code{y} are included. These rows will have 'NA's in the columns that are usually
filled with values from \code{y}. The default is \code{FALSE} so that only rows with
data from both \code{x} and \code{y} are included in the output.}

\item{all.y}{logical; analogous to \code{all.x} above.}

\item{sort}{logical. If \code{TRUE} (default), the rows of the merged
\code{data.table} are sorted by setting the key to the \code{by / by.x} columns. If
\code{FALSE}, unlike base R's \code{merge} for which row order is unspecified, the
row order in \code{x} is retained (including retaining the position of missings when
\code{all.x=TRUE}), followed by \code{y} rows that don't match \code{x} (when \code{all.y=TRUE})
retaining the order those appear in \code{y}.}

\item{suffixes}{A \code{character(2)} specifying the suffixes to be used for
making non-\code{by} column names unique. The suffix behaviour works in a similar
fashion as the \code{\link{merge.data.frame}} method does.}

\item{no.dups}{logical indicating that \code{suffixes} are also appended to
non-\code{by.y} column names in \code{y} when they have the same column name
as any \code{by.x}.}

\item{allow.cartesian}{See \code{allow.cartesian} in \code{\link[data.table]{[.data.table}}.}

\item{match_type}{character: one of \emph{"m:m"}, \emph{"m:1"}, \emph{"1:m"}, \emph{"1:1"}.
Default is \emph{"1:1"} since this the most restrictive. However, following
Stata's recommendation, it is better to be explicit and use any of the
other three match types (See details in \emph{match types sections}).}

\item{keep_common_vars}{logical: If TRUE, it will keep the original variable
from y when both tables have common variable names. Thus, the prefix "y."
will be added to the original name to distinguish from the resulting
variable in the joined table.}

\item{...}{
  Arguments passed on to \code{\link[=joyn]{joyn}}
  \describe{
    \item{\code{y_vars_to_keep}}{character: Vector of variable names in \code{y} that will be
kept after the merge. If TRUE (the default), it keeps all the brings all
the variables in y into x. If FALSE or NULL, it does not bring any variable
into x, but a report will be generated.}
    \item{\code{reportvar}}{character: Name of reporting variable. Default is ".joyn".
This is the same as variable "_merge" in Stata after performing a merge. If
FALSE or NULL, the reporting variable will be excluded from the final
table, though a summary of the join will be display after concluding.}
    \item{\code{update_NAs}}{logical: If TRUE, it will update NA values of all variables
in x with actual values of variables in y that have the same name as the
ones in x. If FALSE, NA values won't be updated, even if \code{update_values} is
\code{TRUE}}
    \item{\code{update_values}}{logical: If TRUE, it will update all values of variables
in x with the actual of variables in y with the same name as the ones in x.
\strong{NAs from y won't be used to update actual values in x}. Yet, by default,
NAs in x will be updated with values in y. To avoid this, make sure to set
\code{update_NAs = FALSE}}
    \item{\code{verbose}}{logical: if FALSE, it won't display any message (programmer's
option). Default is TRUE.}
  }}
}
\value{
data.table merging x and y
}
\description{
This is a joyn wrapper that works in a similar fashion to \link[base:merge]{base::merge} and
\link[data.table:merge]{data.table::merge}, which is why \link{merge} masks the other two.
}
\examples{
x1 = data.frame(id = c(1L, 1L, 2L, 3L, NA_integer_),
                t  = c(1L, 2L, 1L, 2L, NA_integer_),
                x  = 11:15)
y1 = data.frame(id = c(1,2, 4),
                y  = c(11L, 15L, 16))
joyn::merge(x1, y1, by = "id")
# example of using by.x and by.y
x2 = data.frame(id1 = c(1, 1, 2, 3, 3),
                id2 = c(1, 1, 2, 3, 4),
                t   = c(1L, 2L, 1L, 2L, NA_integer_),
                x   = c(16, 12, NA, NA, 15))
y2 = data.frame(id  = c(1, 2, 5, 6, 3),
                id2 = c(1, 1, 2, 3, 4),
                y   = c(11L, 15L, 20L, 13L, 10L),
                x   = c(16:20))
jn <- joyn::merge(x2,
            y2,
            match_type = "m:m",
            all.x = TRUE,
            by.x = "id1",
            by.y = "id2")
# example with all = TRUE
jn <- joyn::merge(x2,
            y2,
            match_type = "m:m",
            by.x = "id1",
            by.y = "id2",
            all = TRUE)
}
