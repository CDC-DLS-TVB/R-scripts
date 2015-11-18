threshold.matrix = function( x, cut ) {
   n1=dim(x)[1]
   n2=dim(x)[2]
   transpose=0
   if (n2>n1) {
      transpose=1
      x=t(x)
   }   
   cutoff=function(s,val) { ifelse(s>val,s,0) }
   if (cut<1) {
      cs=colSums(x)
      x=scale(x,center=FALSE,scale=cs) 
      }
   x=apply(x,c(1,2), cutoff, val=cut)
   if (cut<1) {
      cs.inv=1/cs
      x= round(scale(x,center=FALSE, scale=cs.inv ) )
      attr(x,"scaled:scale")<-NULL
    }
    if (transpose==1) {x=t(x)}
    return(x)
    }    
    