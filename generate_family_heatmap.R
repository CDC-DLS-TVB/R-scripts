setwd("c:/R/Rstudio/scripts")
kotable <- read.csv("K00370.tsv",sep = '\t',row.names=1,header=TRUE)
Colnames_list <- colnames(kotable)
library(gplots)
mycol <- colorRampPalette(c("white","blue"))(100)
mycol <- mycol[2:100]
mycol <- c(mycol,"#0000DD")
hm <- heatmap.2(as.matrix(kotable), scale='none',Rowv=NA,Colv=NA,col=mycol, dendrogram="none",margins=c(5,5), cexRow=1.2,cexCol=0.9,key=FALSE,trace="none")