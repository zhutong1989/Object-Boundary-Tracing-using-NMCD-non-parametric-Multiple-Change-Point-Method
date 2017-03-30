screening<-function(n,s){                                                                                             #screening start
      nI<-((log(n)^(3/2))/2)%/%1   
      CM1<-0
      CM2<-0      
      gama<-0
      for(i in 1:n)
          gama[i]<-0
      O<-0
      O1<-matrix(0,nrow=1,ncol=n)
      for(u in nI:(n-nI)){
          CM1[1:nI]<-s[(u-nI+1):u]
          CM2[1:nI]<-s[(u+1):(u+nI)]
          CM1order<-sort(CM1) 
          CM2order<-sort(CM2)    
          CM1factor<-factor(CM1order)
          CM1factor.level<-levels(CM1factor)
          CM1f<-as.numeric(CM1factor.level)
          CM2factor<-factor(CM2order)
          CM2factor.level<-levels(CM2factor)
          CM2f<-as.numeric(CM2factor.level)
          u1<-length(CM1f)
          u2<-length(CM2f)
          F11<-0
          F21<-0
          F12<-0
          F22<-0
          for(v in 1:u1){              
              begin<-0
              for(w in 1:nI){
                  if(CM1[w]<=CM1f[v])
                      begin<-begin+1
              }
              F11[v]<-begin/nI
          }   
          for(v in 1:u2){              
              begin<-0 
              for(w in 1:nI){
                  if(CM2[w]<=CM2f[v])
                      begin<-begin+1
              }
              F22[v]<-begin/nI
          }  
          for(v in 1:u1){              
              begin<-0
              for(w in 1:nI){
                  if(CM2[w]<=CM1f[v])
                      begin<-begin+1
              }
              F12[v]<-begin/nI
          }    
          for(v in 1:u2){
              begin<-0
              for(w in 1:nI){
                  if(CM1[w]<=CM2f[v])
                  begin<-begin+1
              }
              F21[v]<-begin/nI
          } 
          T1<-0   
          T2<-0
          for(i in 1:u1)
              T1<-T1+(F11[i]-F12[i])^2
          for(j in 1:u2)
              T2<-T2+(F21[j]-F22[j])^2
          gama[u]<-T1+T2
      }
      for(i in nI:(n-nI)){
          test<-0
          for(j in (i-nI+1):(i+nI)){
              if(gama[i]>=gama[j])
                  test<-test+1
          }
          if(test==2*nI)
              O1[i]<-i  
      } 
      i<-1
      a<-1
      while(i<=n) {
          if(O1[i]>0){
              O[a]<-O1[i]
              i<-i+1
              a<-a+1
          }
          else
              i<-i+1
      }
      nO<-length(O)         
      list(O=O,nO=nO)  
} 