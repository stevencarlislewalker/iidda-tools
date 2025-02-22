% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bindings.R
\docType{data}
\name{ops}
\alias{ops}
\alias{ops_local}
\alias{ops_staging}
\title{IIDDA API Operations}
\format{
An object of class \code{try-error} of length 1.

An object of class \code{try-error} of length 1.

An object of class \code{list} of length 6.
}
\usage{
ops

ops_local

ops_staging
}
\description{
Objects containing the functions associated with API functions
documented \href{https://math.mcmaster.ca/iidda/api/docs}{here}.
These objects are for advanced usage, providing more functionality
than the simpler tools for accessing \code{\link{featured_data}}.
}
\section{Functions}{
\itemize{
\item \code{ops}: List containing available operations from the IIDDA API
as \code{R} functions

\item \code{ops_local}: Operations list for a local development environment,
if it exists

\item \code{ops_staging}: Operations list for a staging environment, if it exists

}}
\examples{
## Print out the available functions.
names(ops_staging)

## Access functions with a dollar sign. For example, this command
## will give weekly incidence data in January of 1956.
options(iidda_api_msgs = FALSE, iidda_api_all_char = TRUE)
jan_56 = ops_staging$filter(
     resource_type = "Communicable Disease Incidence"
   , dataset_id = "cdi_ca_1956_wk_prov_dbs"
   , period_end_date = "1956-01-01..1956-02-01"
   , time_scale = "wk"
)
cols = c(
    "period_end_date"
  , "location"
  , "historical_disease"
  , "cases_this_period"
)
print(jan_56[, cols])

## Operations objects that are not available are error objects. As of the
## time of writing `ops` is not live, but will be.
print(class(ops))

## The `ops_local` is only live for developers who have deployed a
## local version of the API.
print(class(ops_local))

}
\keyword{datasets}
