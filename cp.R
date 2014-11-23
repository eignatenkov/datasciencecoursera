n<-40
nosim<-1000
sim<-matrix(rexp(nosim*n,0.2),nosim)
means<-apply(sim,1,mean)
