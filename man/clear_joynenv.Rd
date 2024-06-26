% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/info_display.R
\name{clear_joynenv}
\alias{clear_joynenv}
\title{Clearing joyn environment}
\usage{
clear_joynenv()
}
\description{
Clearing joyn environment
}
\examples{
\dontrun{
# Storing a message
joyn:::store_msg("info", "simple message")

# Clearing the environment
joyn:::clear_joynenv()

# Checking it does not exist in the environment
print(joyn:::joyn_msgs_exist())
}
}
\seealso{
Messages functions
\code{\link{joyn_msg}()},
\code{\link{joyn_msgs_exist}()},
\code{\link{joyn_report}()},
\code{\link{msg_type_dt}()},
\code{\link{store_msg}()},
\code{\link{style}()},
\code{\link{type_choices}()}
}
\concept{messages}
\keyword{internal}
