adddirection29<-function(img,istart,jstart,d=0){
    row<-nrow(img)
    col<-ncol(img)
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\screening.R")
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\calculate1.R")
    source("D:\\R-3.0.1\\~My work place~\\snake\\Programs\\Tools\\calculate2.R")
    maxadd29<-0
    { 
     imaxadd29<-0
     jmaxadd29<-0
     imax291i<-0
     jmax291i<-0
     imax292i<-0
     jmax292i<-0
     max1<-0
     max2<-0
     s29<-0
     i<-0
     while((istart-3*i>=1)&&(jstart+i<=col)){  
         s29[i+1]<-img[istart-3*i,jstart+i]
         i<-i+1
     }
     n<-length(s29)
     screening(n,s29)
     O<-0
     O<-screening(n,s29)$O
     nO<-screening(n,s29)$nO
     zeta<-((log(n))^2)/2 
     {                                                                                    
      calculate1(s29,n,O,nO,istart,jstart)                                                   
      NMCD<-calculate1(s29,n,O,nO,istart,jstart)$NMCD
      NMCD1<-matrix(0,nrow=nO)
      for(a in 1:nO){                                                                         
          if(NMCD[a]!=0)
              NMCD1[a]<-1/NMCD[a]
          else
              NMCD1[a]<-NMCD[a]
      }
      cp1<-which(NMCD1==min(NMCD1))
      imax291i<-istart-3*O[cp1]-3
      jmax291i<-jstart+O[cp1]-1
      max1<-NMCD[cp1]
     }
     if(d!=1)
     {
      calculate2(s29,n,O,nO,istart,jstart)                                                    
      NMCD2<-calculate2(s29,n,O,nO,istart,jstart)$NMCD2
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
      imax292i<-istart-3*O[cp1]+3
      jmax292i<-jstart+O[cp1]-1
      imax292i[2]<-istart-3*O[cp2]+3
      jmax292i[2]<-jstart+O[cp2]-1
      max2<-NMCD2[cp1,cp2]
     }
     if(d==1)
     {
      imaxadd29<-imax291i
      jmaxadd29<-jmax291i
      maxadd29<-max1
      points(jmaxadd29,row-imaxadd29,pch="。",col="red")
     }
     else if(d==2)
     {
      imaxadd29<-imax292i[1]
      jmaxadd29<-jmax292i[1]
      imaxadd29[2]<-imax292i[2]
      jmaxadd29[2]<-jmax292i[2]
      maxadd29<-max2
      points(jmaxadd29[1],row-imaxadd29[1],pch="。",col="red")
      points(jmaxadd29[2],row-imaxadd29[2],pch="。",col="purple")
     }
     else   
     {
      min<-min((-max1+zeta),(-max2+2*zeta))
      if(min==(-max1+zeta))
      { 
       imaxadd29<-imax291i
       jmaxadd29<-jmax291i
       maxadd29<-max1
       points(jmaxadd29,row-imaxadd29,pch="。",col="red")
      } 
      else if(min==(-max2+2*zeta))
      {
       imaxadd29<-imax292i[1]
       jmaxadd29<-jmax292i[1]
       imaxadd29[2]<-imax292i[2]
       jmaxadd29[2]<-jmax292i[2]
       maxadd29<-max2
       points(jmaxadd29[1],row-imaxadd29[1],pch="。",col="red")
       points(jmaxadd29[2],row-imaxadd29[2],pch="。",col="purple")
      }
     } 
    }
}