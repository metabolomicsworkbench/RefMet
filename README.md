R-based tools for standardization of metabolite names (RefMet)
================

## Overview
TBA

## Installation

To install the current version:

``` r
devtools::install_github("eoindfahy/RefMet")
```

Load RefMet in R:

``` r
library(RefMet)
```

## Usage
``` r
#Use a text file of metabolite names as input
infile <- system.file("extdata", "met_list.txt", package = "RefMet")
RefMet_mapped <- refmet_map(infile)
head(RefMet_mapped)

#Use a data frame column as input
DF <- read.table(thefile, header = TRUE,  quote = "", sep="\t");
RefMet_mapped <- refmet_map_df(DF[,1])
head(RefMet_mapped)

#Fetch metadata for a RefMet name
metadata<- refmet_metadata("Tyrosine")
head(metadata)
```

## Contact

Eoin Fahy (efahy@ucsd.edu)

------------------------------------------------------------------------


