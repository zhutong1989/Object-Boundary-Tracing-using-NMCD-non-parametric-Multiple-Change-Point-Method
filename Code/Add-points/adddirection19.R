adddirection19<-function(img,istart,jstart,d=0){
    row<-nrow(img)
    col<-ncol(img)
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\screening.R")
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\calculate1.R")
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\calculate2.R")
    maxadd19<-0
    { 
     imaxadd19<-0
     jmaxadd19<-0
     imax191i<-0
     jmax191i<-0
     imax192i<-0
     jmax192i<-0
     max1<-0
     max2<-0
     s19<-0
     i<-0
     while((istart+3*i<=row)&&(jstart+2*i<=col)){  
             s19[i+1]<-img[istart+3*i,jstart+2*i]
             i<-i+1
     }
     n<-length(s19)
     screening(n,s19)
     O<-0
     O<-screening(n,s19)$O
     nO<-screening(n,s19)$nO
     zeta<-((log(n))^2)/2 
     {                                                                                    
      calculate1(s19,n,O,nO,istart,jstart)                                                   
      NMCD<-calculate1(s19,n,O,nO,istart,jstart)$NMCD
      NMCD1<-matrix(0,nrow=nO)
      for(a in 1:nO){                                                                         
          if(NMCD[a]!=0)
              NMCD1[a]<-1/NMCD[a]
          else
              NMCD1[a]<-NMCD[a]
      }
      cp1<-which(NMCD1==min(NMCD1))
      imax191i<-istart+3*O[cp1]-3
      jmax191i<-jstart+2*O[cp1]-2
      max1<-NMCD[cp1]
     }
     if(d!=1)
     {
      calculate2(s19,n,O,nO,istart,jstart)                                                    
      NMCD2<-calculate2(s19,n,O,nO,istart,jstart)$NMCD2
      NMCD21<-matrix(0,nrow=nO,ncol=nO,byrow=T)
      for(a in 1:nO)
          for(b in 1:nO){
              if(NMCD2[a,b]!=0)
                  NMCD21[a,b]<-1/NMCD2[a,b]
              else
                  NMCD21[a,b]<-NMCD2[a,b]
      }
      summax<-which(NMCD21==min(NMCD21))
      cp1<-summax%%(nO)
      cp2<-summax%/%(nO)+1
      imax192i<-istart+3*O[cp1]-3
      jmax192i<-jstart+2*O[cp1]-2
      imax192i[2]<-istart+3*O[cp2]-3
      jmax192i[2]<-jstart+2*O[cp2]-2
      max2<-NMCD2[cp1,cp2]
     }
     if(d==1)
     {
      imaxadd19<-imax191i
      jmaxadd19<-jmax191i
      maxadd19<-max1
      points(jmaxadd19,row-imaxadd19,pch="。",col="red")
     }
     else if(d==2)
     {
      imaxadd19<-imax192i[1]
      jmaxadd19<-jmax192i[1]
      imaxadd19[2]<-imax192i[2]
      jmaxadd19[2]<-jmax192i[2]
      maxadd19<-max2
      points(jmaxadd19[1],row-imaxadd19[1],pch="。",col="red")
      points(jmaxadd19[2],row-imaxadd19[2],pch="。",col="purple")
     }
     else   
     {
      min<-min((-max1+zeta),(-max2+2*zeta))
      if(min==(-max1+zeta))
      { 
       imaxadd19<-imax191i
       jmaxadd19<-jmax191i
       maxadd19<-max1
       points(jmaxadd19,row-imaxadd19,pch="。",col="red")
      }
      else if(min==(-max2+2*zeta))
      {
       imaxadd19<-imax192i[1]
       jmaxadd19<-jmax192i[1]
       imaxadd19[2]<-imax192i[2]
       jmaxadd19[2]<-jmax192i[2]
       maxadd19<-max2
       points(jmaxadd19[1],row-imaxadd19[1],pch="。",col="red")
       points(jmaxadd19[2],row-imaxadd19[2],pch="。",col="purple")
      }
     } 
    }
}