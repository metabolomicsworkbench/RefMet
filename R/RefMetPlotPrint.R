# metplot ----
#' TBA
#'
#' The metplot function.
#'
#' @param mycat A metadata category name
#'
#' @param metadata The metadata table for a metabolite of interest
#'
#' @return A plot
#'
#' @export
#'
#' @examples
#' library(RefMet)
#' 
#' metadata<- refmet_metadata("Tyrosine")
#' head(metadata)
#' metplot('Species', metadata)
#'
metplot <- function(mycat,metadata){
vec<- c("Species"=10,"Sample source"=11,"Disease association"=12, "Analysis type"=13 ,"MS polarity"=14,"Chromatography"=15)
myval <- vec[mycat]
metabolite <- metadata[1,3]
x<-as.data.frame(table(metadata[myval]))
mytitle=paste0(mycat," distribution for ",metabolite)
x<- x[!(is.na(x[1]) | x[1]==""), ]
x <- x[order(-x[,2]),]
showrows=10
if(nrow(x)<10){showrows=nrow(x)}
plot<-ggplot(x[1:showrows,],aes(x = reorder(Var1, -Freq), y = Freq,fill=Var1)) + 
geom_bar(stat = "identity") + 
ggtitle(mytitle) +
xlab(mycat) + ylab("# of NMDR Analyses") +
geom_text(aes(label = Freq), vjust = -0.2, colour = "black") +
theme(plot.title = element_text(hjust = 0.5),legend.position = "none")
plot
}

# metprint ----
#' TBA
#'
#' The metprint function.
#'
#' @param mycat A metadata category name
#'
#' @param metadata The metadata table for a metabolite of interest
#'
#' @return A file of results
#'
#' @export
#'
#' @examples
#' library(RefMet)
#' 
#' metadata<- refmet_metadata("Tyrosine")
#' head(metadata)
#' metprint('Species',metadata)
#'
metprint <- function(mycat,metadata){
fname=paste0(mycat,".txt")
vec<- c('Species'=10,"Sample source"=11,"Disease association"=12, "Analysis type"=13 ,"MS polarity"=14,"Chromatography"=15)
myval <- vec[mycat]
x<-as.data.frame(table(metadata[myval]))
x<- x[!(is.na(x[1]) | x[1]==""), ]
colnames(x)[1]<-mycat
x <- x[order(-x[,2]),]
write.table(x,file=fname,row.names=FALSE,sep="\t", col.names=TRUE,quote=FALSE)
}

# classplot ----
#'TBA
#'
#' The classplot function
#'
#' @param mycat, One of the following 6 metadata items:
#' 'Species','Sample source','Disease association',
#' 'Analysis type','MS polarity','Chromatography'
#'
#' @param RefMet_mapped a data frame of RefMet-mapped data
#'
#' @return A pie chart
#'
#' @export
#'
#' @examples
#' library(RefMet)
#' 
#' infile <- system.file("extdata", "met_list.txt", package = "RefMet")
#' #Use a text file of metabolite names as input
#' RefMet_mapped <- refmet_map(infile)
#' classplot('Main class',RefMet_mapped)
#'
classplot <- function(mycat,RefMet_mapped){
vec<- c("Super class"=5,"Main class"=6,"Sub class"=7)
myval <- vec[mycat]
dx<-as.data.frame(table(RefMet_mapped[,myval]))
dx<- dx[!(is.na(dx[1]) | dx[1]=="" | dx[1]=="-"), ]
dx <- dx[order(-dx[,2]),]
dx$Var1 <-as.character(dx$Var1)
if(nrow(dx)>10){
dx10 <-dx[1:10,]
other<-sum(dx[11:nrow(dx),]$Freq)
dx10[11,1]<-'Other'
dx10[11,2]<-other
dx <-dx10
}

colors = matrix(c(2, 3, 4, 5, 6, 7, 8, "rosybrown4", 
"orange", "pink", "khaki3", "thistle", "turquoise3", "palegreen1", 
"moccasin", "olivedrab3", "azure4", "gold3", "deeppink","gray","red","orange"),  ncol = 1)

pie(dx$Freq , 
labels = dx$Var1, 
border="white",
col=colors ,main=paste0("Refmet ",mycat))

}

# Import area ----

#' @import curl
#' @import stringi
#' @import ggplot2
#' @export
NULL
