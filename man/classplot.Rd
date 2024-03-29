% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RefMetPlotPrint.R
\name{classplot}
\alias{classplot}
\title{TBA}
\usage{
classplot(mycat, RefMet_mapped)
}
\arguments{
\item{mycat, }{One of the following 6 metadata items:
'Species','Sample source','Disease association',
'Analysis type','MS polarity','Chromatography'}

\item{RefMet_mapped}{a data frame of RefMet-mapped data}
}
\value{
A pie chart
}
\description{
The classplot function
}
\examples{
library(RefMet)

infile <- system.file("extdata", "met_list.txt", package = "RefMet")
#Use a text file of metabolite names as input
RefMet_mapped <- refmet_map(infile)
classplot('Main class',RefMet_mapped)

}
