# Object-Boundary-Tracing-using-NMCD-non-parametric-Multiple-Change-Point-Method
-Introduction                                                                                                                             
　　
 Tradition image boundary tracing methods are sensitive to the choice of initial contour. While if we apply statistical models by taking advantage of the distribution of the pixel data, we can detect boundaries of object without using the initial contour. Non-parametric Multiple Change-Point Detection (NMCD) is novel and efficient way of finding multiple change points from a list of number without any parametric assumptions. I apply this algorithm to detect the boundary of an object inside a given image. The results look nice, especially for images with high noises, where traditional tracing methods do not work very well. I tried objects with 1 or 2 change point in each direction. Also I tried to reduce the number of change points by first segment an image to several small parts, and the detect 1 or 2 change-points in the sub-images.


   
-The folder images lists all the 7 images I tried (before and after object boundary detection)                                         
-The folder Image Pixel Data lists all the pixel data for the 7 images read from Matlab                                                
-The folder References lists three papers -- the NMCD method, Intro to Contour Tracing Problem and Boundary Estimation Theories
