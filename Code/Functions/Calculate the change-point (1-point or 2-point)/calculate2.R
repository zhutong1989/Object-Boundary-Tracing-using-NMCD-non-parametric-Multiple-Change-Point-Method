calculate2<-function(s,n,O,nO,istart,jstart){
    sorder<-sort(s)
    sfactor<-factor(sorder)
    sfactor.level<-levels(sfactor)
    sn<-as.numeric(sfactor.level)
    n1<-length(sn)
    Rk<-matrix(0,nrow=1,ncol=n1-1)   
    Rm<-matrix(0,nrow=1,ncol=n1-1)
    Rt<-matrix(0,nrow=1,ncol=n1-1) 
    NMCD2<-matrix(0,nrow=nO,ncol=nO,byrow=T)
    for(i in 1:(nO-1)){
        for(j in (i+1):nO){
            S1<-O[i]-1
            S2<-O[j]-O[i]
            S3<-n-O[j]+1
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
                    for(m in O[i]:(O[j]-1)){                                                                                                        
                        if(s[m]<=sn[l])
                            initial2<-initial2+1
                    }
                    Fml<-(initial2-1/2)/S2
                    if(Fml>0)
                        Rm[l]<-(Fml*log(Fml)+(1-Fml)*log(1-Fml))/(l*(n-l))
                    else
                        Rm[l]<-0              
                   }              
                   {
                    initial3<-0
                    for(t in O[j]:n){
                        if(s[t]<=sn[l])
                            initial3<-initial3+1
                    } 
                    Ftl<-(initial3-1/2)/S3
                    if(Ftl>0)
                        Rt[l]<-(Ftl*log(Ftl)+(1-Ftl)*log(1-Ftl))/(l*(n-l))
                    else
                        Rt[l]<-0 
                   }
            }
            R1<-sum(Rk)
            R2<-sum(Rm)
            R3<-sum(Rt) 
            NMCD2[i,j]<-n*(S1*R1+S2*R2+S3*R3)
         }
    }
    list(NMCD2=NMCD2)
}
