adddirection20<-function(img,istart,jstart,d=0){
    row<-nrow(img)
    col<-ncol(img)
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\screening.R")
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\calculate1.R")
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\calculate2.R")
    maxadd20<-0
    { 
     imaxadd20<-0
     jmaxadd20<-0
     imax201i<-0
     jmax201i<-0
     imax202i<-0
     jmax202i<-0
     max1<-0
     max2<-0
     s20<-0
     i<-0
     while((istart+3*i<=row)&&(jstart+i<=col)){  
         s20[i+1]<-img[istart+3*i,jstart+i]
         i<-i+1
     }
     n<-length(s20)
     screening(n,s20)
     O<-0
     O<-screening(n,s20)$O
     nO<-screening(n,s20)$nO
     zeta<-((log(n))^2)/2 
     {                                                                                    
      calculate1(s20,n,O,nO,istart,jstart)                                                   
      NMCD<-calculate1(s20,n,O,nO,istart,jstart)$NMCD
      NMCD1<-matrix(0,nrow=nO)
      for(a in 1:nO){                                                                         
          if(NMCD[a]!=0)
              NMCD1[a]<-1/NMCD[a]
          else
              NMCD1[a]<-NMCD[a]
      }
      cp1<-which(NMCD1==min(NMCD1))
      imax201i<-istart+3*O[cp1]-3
      jmax201i<-jstart+O[cp1]-1
      max1<-NMCD[cp1]
     }
     if(d!=1)
     {
      calculate2(s20,n,O,nO,istart,jstart)                                                    
      NMCD2<-calculate2(s20,n,O,nO,istart,jstart)$NMCD2
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
      imax202i<-istart+3*O[cp1]-3
      jmax202i<-jstart+O[cp1]-1
      imax202i[2]<-istart+3*O[cp2]-3
      jmax202i[2]<-jstart+O[cp2]-1
      max2<-NMCD2[cp1,cp2]
     }
     if(d==1)
     {
      imaxadd20<-imax201i
      jmaxadd20<-jmax201i
      maxadd20<-max1
      points(jmaxadd20,row-imaxadd20,pch="。",col="red")
     }
     else if(d==2)
     {
      imaxadd20<-imax202i[1]
      jmaxadd20<-jmax202i[1]
      imaxadd20[2]<-imax202i[2]
      jmaxadd20[2]<-jmax202i[2]
      maxadd20<-max2
      points(jmaxadd20[1],row-imaxadd20[1],pch="。",col="red")
      points(jmaxadd20[2],row-imaxadd20[2],pch="。",col="purple")
     }
     else   
     {
      min<-min((-max1+zeta),(-max2+2*zeta))
      if(min==(-max1+zeta))
      { 
       imaxadd20<-imax201i
       jmaxadd20<-jmax201i
       maxadd20<-max1
       points(jmaxadd20,row-imaxadd20,pch="。",col="red")
      } 
      else if(min==(-max2+2*zeta))
      {
       imaxadd20<-imax202i[1]
       jmaxadd20<-jmax202i[1]
       imaxadd20[2]<-imax202i[2]
       jmaxadd20[2]<-jmax202i[2]
       maxadd20<-max2
       points(jmaxadd20[1],row-imaxadd20[1],pch="。",col="red")
       points(jmaxadd20[2],row-imaxadd20[2],pch="。",col="purple")
      }
     } 
    }
}