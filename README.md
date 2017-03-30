# Object-Boundary-Tracing-using-NMCD-non-parametric-Multiple-Change-Point-Method
-Introduction                                                                                                                       
Tradition image boundary tracing methods are sensitive to the choice of initial contour. While if we apply statistical models by taking advantage of the distribution of the pixel data, we can detect boundaries of object without using the initial contour. Non-parametric Multiple Change-Point Detection (NMCD) is novel and efficient way of finding multiple change points from a list of number without any parametric assumptions. I apply this algorithm to detect the boundary of an object inside a given image. The results look nice, especially for images with high noises, where traditional tracing methods do not work very well. I tried objects with 1 or 2 change point in each direction. Also I tried to reduce the number of change points by first segment an image to several small parts, and the detect 1 or 2 change-points in the sub-images.

-Methodology
1. NMCD method. 
   Assume that Z1, . . . ,Zn are independent and identically distributed from F0, and let Fn_hat denote the empirical C.D.F. of the
   sample, then n*Fn_hat(u) ∼ Binomial(n,F0(u)). If we regard the sample as binary data with the probability of success b Fn(u), this        leads to the nonparametric maximum log-likelihood:                                                                                         
   
                            n * {Fn_hat(u) * log(Fn_hat(u)) + (1−Fn_hat(u)) * log(1−Fn_hat(u))}　                           
                                                                                                                                 
    We can write the joint log-likelihood for a candidate set of change-points (τ′1 < ··· < τ′L) as (refer to page 　  4 of the NMCD paper 　　in the reference folder):                                                                                                              
                        
         Lu(τ′1 , . . . , τ′L) = sum_from_k=0_to_L(τ′k+1 − τ′k) * {F_hat_from_τ′k_to_τ′k+1(u) * log(F_hat_from_τ′k_to_τ′k+1(u)) +         
 　                                 (1 - F_hat_from_τ′k_to_τ′k+1(u)) * log(1 - F_hat_from_τ′k_to_τ′k+1(u))                
                                    
   where F_hat_from_τ′k_to_τ′k+1(u) is the empirical C.D.F. of the subsample {Xτ′k,...,Xτ′k+1 - 1} with Xτ′0 = 1 and Xτ′L+1 = n + 1
   To estimate the change-points 1 < τ′1 < ··· <τ′L ≤ n, we can maximize the log-likelihood above in an integrated form:      
                                    
             Rn(τ′1, . . . , τ′L) = integral_from_NegativeInfinity_to_PositiveInfinity Lu(τ′1, . . . , τ′L) *　dw(u)　　
                                                                              
   where w(·) is some positive weight function so that Rn(·) is finite, and theintegral is used to combine all the information across u.                                                                                   
             
-Folder Description                                                                                      
 -The folder images lists all the 7 images I tried (before and after object boundary detection) 
 -The folder Image Pixel Data lists all the pixel data for the 7 images read from Matlab                
 -The folder References lists three papers -- the NMCD method, Intro to Contour Tracing Problem and Boundary Estimation Theories
