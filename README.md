README file for code in 'cachematrix.R'

Date : August24, 2014
Author : Rodrigo Martins

1. DESCRIPTION OF VARIABLES

inv = Object that contains the inverted matrix calculated in 'cacheSolve' function.
set_mtx = Command for function 'makeCacheMatrix'. Used to set a new matrix.
get_mtx = Command for function 'makeCacheMatrix'. Used to retrieve the matrix which was input to calculation.
set_inv_mtx = Command for function 'makeCacheMatrix'. Used to receive the inverted matrix which was calculated in 'cacheSolve' function. In despite of being possible to access this command, it is not recommended. If you do it, it will corrupt the functioning of the code, so it will be needed to start all over again.
get_inv_mtx = Command for function 'makeCacheMatrix'. Used to retrieve the calculated inverted matrix. In case the inverted matrix had not been previously calculated, it will return 'NULL'.
data = Object used in 'cacheSolve' function to receive the matrix input in 'makeCacheMatrix' in 'get_mtx'. 

2. EXAMPLES 

> set.seed(1)
> m1<-matrix(rnorm(9),3,3)      #Create an example matrix called 'm1'.
> m1
           [,1]       [,2]      [,3]
[1,] -0.6264538  1.5952808 0.4874291
[2,]  0.1836433  0.3295078 0.7383247
[3,] -0.8356286 -0.8204684 0.5757814

> r<-makeCacheMatrix(m1)        #Input 'm1' to 'makeCacheMatrix' function.
> r$get_mtx()     #Shows the input matrix m1.
           [,1]       [,2]      [,3]
[1,] -0.6264538  1.5952808 0.4874291
[2,]  0.1836433  0.3295078 0.7383247
[3,] -0.8356286 -0.8204684 0.5757814

> r$get_inv_mtx()   #Shows current inverted matrix value, which is NULL.
NULL

> cacheSolve(r)     #Calculate the inverted matrix of m1.
            [,1]        [,2]       [,3]
[1,] -0.49857523  0.83062559 -0.6385536
[2,]  0.45347735 -0.02885765 -0.3462918
[3,] -0.08095133  1.16217624  0.3097513

> r$get_inv_mtx()   #As the inverted matrix has already been calculated, now the command returns it.
            [,1]        [,2]       [,3]
[1,] -0.49857523  0.83062559 -0.6385536
[2,]  0.45347735 -0.02885765 -0.3462918
[3,] -0.08095133  1.16217624  0.3097513

> cacheSolve(r)     #As the inverted matrix value is already cached, it is not calculated again.
Getting cached inverted matrix
            [,1]        [,2]       [,3]
[1,] -0.49857523  0.83062559 -0.6385536
[2,]  0.45347735 -0.02885765 -0.3462918
[3,] -0.08095133  1.16217624  0.3097513

> set.seed(1)
> m2<-matrix(rnorm(16),4,4)     #Create a second matrix called 'm2'.
> m2
           [,1]       [,2]       [,3]        [,4]
[1,] -0.6264538  0.3295078  0.5757814 -0.62124058
[2,]  0.1836433 -0.8204684 -0.3053884 -2.21469989
[3,] -0.8356286  0.4874291  1.5117812  1.12493092
[4,]  1.5952808  0.7383247  0.3898432 -0.04493361

> r$set_mtx(m2)     #Replace 'm1' by 'm2' in 'makeCacheMatrix' using 'set_mtx' command.

> r$get_mtx()       #Shows that matrix m2 is current.
           [,1]       [,2]       [,3]        [,4]
[1,] -0.6264538  0.3295078  0.5757814 -0.62124058
[2,]  0.1836433 -0.8204684 -0.3053884 -2.21469989
[3,] -0.8356286  0.4874291  1.5117812  1.12493092
[4,]  1.5952808  0.7383247  0.3898432 -0.04493361

> r$get_inv_mtx()   #As the matrix was changed, the inverted matrix value is no longer available.
NULL

> cacheSolve(r)     #cacheSolve calculates again the inverted matrix for the new data.
           [,1]       [,2]       [,3]        [,4]
[1,] -0.6213910  0.2532768  0.1732266  0.44441565
[2,]  1.5301385 -0.8532288 -0.8240908  0.26742439
[3,] -0.4197372  0.5574457  0.8748252  0.22924604
[4,] -0.5605101 -0.1913025  0.1990296 -0.09383139

> cacheSolve(r)     #Again, if we attempt to calculate it a second time, 'cacheSolve' retrives from cache instead.
Getting cached inverted matrix
           [,1]       [,2]       [,3]        [,4]
[1,] -0.6213910  0.2532768  0.1732266  0.44441565
[2,]  1.5301385 -0.8532288 -0.8240908  0.26742439
[3,] -0.4197372  0.5574457  0.8748252  0.22924604
[4,] -0.5605101 -0.1913025  0.1990296 -0.09383139

> r$get_inv_mtx()   #Now, the inverted matrix value is again available.
           [,1]       [,2]       [,3]        [,4]
[1,] -0.6213910  0.2532768  0.1732266  0.44441565
[2,]  1.5301385 -0.8532288 -0.8240908  0.26742439
[3,] -0.4197372  0.5574457  0.8748252  0.22924604
[4,] -0.5605101 -0.1913025  0.1990296 -0.09383139
