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
head(RefMet_mapped[,1:4])

                    Input.name           Standardized.name       Formula Exact.mass
1              2'-Deoxyuridine                Deoxyuridine     C9H12N2O5   228.0746
2      4-hydroxyphenylpyruvate 4-Hydroxyphenylpyruvic acid        C9H8O4   180.0423
3              acetylcarnitine                     CAR 2:0      C9H17NO4   203.1158
4 Acylcarnitine (C10:0) [M+H]+                    CAR 10:0     C17H33NO4    315.241
5       Adenosine triphosphate                         ATP C10H16N5O13P3   506.9958
6                          Asn                  Asparagine      C4H8N2O3   132.0535

#Use a data frame column containing metabolite names as input
DF <- read.table(infile, header = TRUE,  quote = "", sep="\t");
RefMet_mapped <- refmet_map_df(DF[,1])
head(RefMet_mapped)

#Fetch metadata for a RefMet name
metadata<- refmet_metadata("Tyrosine")
head(metadata[,1:8])

  analysis    study refmet_name kegg_id                   inchi_key pubchem_cid   super_class               main_class
1 AN002455 ST001479    Tyrosine  C00082 OUYCCCASQSFEME-QMMMGPOBSA-N        6057 Organic acids Amino acids and peptides
2 AN004625 ST002832    Tyrosine  C00082 OUYCCCASQSFEME-QMMMGPOBSA-N        6057 Organic acids Amino acids and peptides
3 AN004375 ST002484    Tyrosine  C00082 OUYCCCASQSFEME-QMMMGPOBSA-N        6057 Organic acids Amino acids and peptides
4 AN001592 ST000972    Tyrosine  C00082 OUYCCCASQSFEME-QMMMGPOBSA-N        6057 Organic acids Amino acids and peptides
5 AN003632 ST002223    Tyrosine  C00082 OUYCCCASQSFEME-QMMMGPOBSA-N        6057 Organic acids Amino acids and peptides
6 AN004626 ST002832    Tyrosine  C00082 OUYCCCASQSFEME-QMMMGPOBSA-N        6057 Organic acids Amino acids and peptides

head(metadata[,9:15])

    sub_class               species          sample        disease analysis_type    polarity chromatography_type
1 Amino acids                 Mouse           Brain Leigh syndrome          LCMS    POSITIVE      Reversed phase
2 Amino acids Bacteroides uniformis Bacterial cells                         LCMS    POSITIVE               HILIC
3 Amino acids                 Human           Blood         Autism          GCMS    POSITIVE                  GC
4 Amino acids                Baboon           Blood                         GCMS    POSITIVE                  GC
5 Amino acids                 Mouse          Kidney         Cancer          LCMS UNSPECIFIED               HILIC
6 Amino acids      Blautia producta Bacterial cells                         LCMS    NEGATIVE               HILIC

#Plot a bargraph of species distribution of Tyrosine in NMDR studies
metplot('Species', metadata)
```

## Contact

Eoin Fahy (efahy@ucsd.edu)

------------------------------------------------------------------------


