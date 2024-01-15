# refmet_map ----
#' TBA
#'
#' The refmet_map function.
#'
#' @param thefile A file name
#'
#' @return A data frame
#'
#' @export
#'
#' @examples
#' library(RefMet)
#' infile <- system.file("extdata", "met_list.txt", package = "RefMet")
#' #Use a text file of metabolite names as input
#' RefMet_mapped <- refmet_map(infile)
#' head(RefMet_mapped)
#'
refmet_map <- function(thefile){
DF <- read.table(thefile, header = TRUE, na.strings = "-", stringsAsFactors = FALSE, quote = "", comment.char = "", sep="\t");
mets=stri_join_list(list(DF[,1]), sep="\n")
h <- new_handle()
handle_setform(h,  metabolite_name = mets)
#run the RefMet request on the Metabolomics Workbench server
req <- curl_fetch_memory("https://www.metabolomicsworkbench.org/databases/refmet/name_to_refmet_new_min.php", handle = h)
refmet <- read.table(text = rawToChar(req$content), header = TRUE, na.strings = "-", stringsAsFactors = FALSE, quote = "", comment.char = "", sep="\t");
refmet[is.na(refmet)] <- '-'
refmet[refmet==''] <- '-'
refmet
}

# refmet_map_df ----
#' Grab mass-spectrometry data from file(s)
#'
#' The refmet_map_df function.
#'
#' @param DX (a data frame column with metabolite names
#'
#' @return A data frame  (rt),
#'
#' @export
#'
#' @examples
#' library(RefMet)
#' 
#' DF <- read.table(thefile, header = TRUE,  quote = "", sep="\t");
#' #Use a data frame column as input
#' RefMet_mapped <- refmet_map_df(DF[,1])
#' head(RefMet_mapped)
#'
refmet_map_df <- function(DX){
mets=stri_join_list(list(DX), sep="\n")
h <- new_handle()
handle_setform(h,  metabolite_name = mets)
#run the RefMet request on the Metabolomics Workbench server
req <- curl_fetch_memory("https://www.metabolomicsworkbench.org/databases/refmet/name_to_refmet_new_min.php", handle = h)
refmet <- read.table(text = rawToChar(req$content), header = TRUE, na.strings = "-", stringsAsFactors = FALSE, quote = "", comment.char = "", sep="\t");
refmet[is.na(refmet)] <- '-'
refmet[refmet==''] <- '-'
refmet
}

# refmet_metadata ----
#' TBA
#'
#' The refmet_map function.
#'
#' @param metabolite A metabolite name
#'
#' @return A data frame
#'
#' @export
#'
#' @examples
#' library(RefMet)
#' 
#' metadata<- refmet_metadata("Tyrosine")
#' head(metadata)
#'
refmet_metadata <- function(metabolite){
metabolite_enc <- URLencode(metabolite)
myurl <-paste0("http://dev.metabolomicsworkbench.org:45076/data/metstatR.php?REFMET_NAME=",metabolite_enc)
h <- new_handle()
handle_setopt(
    handle = h,
    httpauth = 1,
    userpwd = "DRCC:mw@UC13"
)
req <- curl_fetch_memory(myurl, handle = h)
metadata <- read.table(text = rawToChar(req$content), header = TRUE, na.strings = "-", stringsAsFactors = FALSE, quote = "", comment.char = "", sep="\t");
metadata
}

# Import area ----

#' @import curl
#' @import stringi
#' @import ggplot2
#' @export
NULL
