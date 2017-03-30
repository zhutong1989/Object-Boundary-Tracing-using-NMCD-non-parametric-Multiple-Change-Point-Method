calculate1<-function(s,n,O,nO,istart,jstart){
     sorder<-sort(s)
     sfactor<-factor(sorder)
     sfactor.level<-levels(sfactor)
     sn<-as.numeric(sfactor.level)
     n1<-length(sn)
     Rk<-matrix(0,nrow=1,ncol=n1-1)   
     Rm<-matrix(0,nrow=1,ncol=n1-1) 
     NMCD<-matrix(0,nrow=nO)
     for(i in 1:nO){
             S1<-O[i]-1
             S2<-n-O[i]+1
             for(l in 2:(n1-1)){
                    {
                     initial1<-0 
                     for(k in 1:(O[i]-1)){
                         if(s[k]<=sn[l])
                             initial1<-initial1+1
                     }
                     Fkl<-(initial1-1/2)/S1
                     if(Fkl>0)
                         Rk[l]<-(Fkl*log(Fkl)+(1-Fkl)*log(1-Fkl))/(l*(n-l))
                     else
                         Rk[l]<-0             
                    }               
                    {
                     initial2<-0
                     for(m in O[i]:n){                                                                                                        
                         if(s[m]<=sn[l])
                             initial2<-initial2+1
                     }
                     Fml<-(initial2-1/2)/S2
                     if(Fml>0)
                         Rm[l]<-(Fml*log(Fml)+(1-Fml)*log(1-Fml))/(l*(n-l))
                     else
                         Rm[l]<-0              
                    }              
             }
             R1<-sum(Rk)
             R2<-sum(Rm)
             NMCD[i]<-n*(S1*R1+S2*R2)
     }
     list(NMCD=NMCD)
}