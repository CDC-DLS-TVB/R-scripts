library(phyloseq)
library(ape)
setwd('c:/R/Rstudio/scripts')
biom=import_biom( 'otu_table_97_ref_picked_otus_nochloronomito_align.biom' )
otu.table=otu_table( biom )
tax.table=tax_table( biom )
tree=read.tree('rep_set_nochloronomito.tre')
otu.names=row.names(otu.table)

setwd('c:/R/Rstudio/scripts')
K00370=read.table('K00370_for_taxonomy.tsv', header=FALSE, sep='\t')
samples=unique(K00370[,2])
find.otu=function( otu, otu.list ) {
   j=which( otu.list==otu )
   return(j)
   }
for (i in 1:length(samples) ) {
   use=(K00370[,2]==samples[i] )
   this.data=K00370[use,]
   otus=this.data[,3]
   indices=sapply( otus, find.otu, otu.list=otu.names)
   this.tax.table=tax.table[indices,]
   tot.taxa=sum( this.data[,7] )
   families=unique( this.tax.table[,5] )
   for (j in 1:length(families) ) {
      fam.index= this.tax.table[,5]==as.character(families[j]) 
      fam.tot=sum( this.data[fam.index,7] )/tot.taxa
      if (i*j==1) {
         write.table( file='K00370.res', t(c(as.character(samples[i]), families[j], fam.tot )) ,  quote=FALSE, col.names=FALSE, row.names=FALSE) }
      else {
         write.table( file='K00370.res', t(c(as.character(samples[i]), families[j], fam.tot )) , append=TRUE, quote=FALSE, col.names=FALSE, row.names=FALSE)
         }
      }
   }   
      