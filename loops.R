# looping on command line
"lapply - loop over list and evaluate a function on each element
sapply - same as lapply but try to simplify result
apply - apply a function over margins of an array
tapply - apply a function over subsets of a vector
mapply - multivariate version of lapply

split - used with lapply to split object to subpieces
"

# lapply
"takes three arguments x - a list, func, ... function arguments;
In output lapply always gives a list"
"> x = list(a = 1:5, b = rnorm(10))
> lapply(x, mean)
$a
[1] 3

$b
[1] -0.0474927
"
"> x = 1:5
> lapply(x,runif)
[[1]]
[1] 0.491243

[[2]]
[1] 0.6825102 0.7797794

[[3]]
[1] 0.21726210 0.43797329 0.02516693

[[4]]
[1] 0.05130401 0.91390945 0.72593534 0.96371400

[[5]]
[1] 0.4897214 0.2059451 0.7567749 0.9038312 0.7671089"
"> x = 1:5
> lapply(x,runif, min = 1, max = 10)"
# rnorm - function that stimulates random variates having specified
# normal distribution
# runif - Generates random compositions with a uniform distribution 
# on the (rcomp) simplex. 
"Lapply and friends make heavy use of anonymous functions
> x = list(a = matrix(1:4,2,2), b=matrix(1:6,3,2))
> x
$a
     [,1] [,2]
[1,]    1    3
[2,]    2    4

$b
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

> lapply(x, function(elt) elt[,1])
$a
[1] 1 2

$b
[1] 1 2 3
"

# sapply
# will try to simplify result of lapply if possible ie
# 1. if result is list where every element is length 1, then vector
# is returned.
# 2. if result is list where every element is vector of same
# length(>1), matrix is returned
# 3. if it can't figure out a list is returned
"> x = list(1:4, rnorm(10), rnorm(100,5))
> lapply(x,mean)
[[1]]
[1] 2.5

[[2]]
[1] -0.5751319

[[3]]
[1] 4.945883

> sapply(x,mean)
[1]  2.5000000 -0.5751319  4.9458835"


# apply - to evaluate funtion over margins of an array
# most often used to apply func to rows or cols of matrix
# not really faster than loops but it works in 1 line
"> str(apply)
function (X, MARGIN, FUN, ...)  
x - array, margin - int vector indicating which margins to be
retained
> x = matrix(rnorm(200), 20, 10)
> apply(x, 2, mean)
 [1] -0.414920248  0.109430608  0.094579583 -0.301725578  0.011051627
 [6]  0.049983894  0.009805834 -0.014415611  0.332050324  0.077867721
> apply(x, 1, mean)
 [1] -0.045218510 -0.008373721  0.239815299  0.035409999  0.516273164
 [6] -0.473369873  0.048567357  0.306221125  0.312368712 -0.494191701
[11] -0.158390716  0.049287101 -0.512113043 -0.130537370 -0.510362329
[16]  0.093414164 -0.086656303  0.231785830 -0.063429673  0.556916797
"
# col/row sums and means - shortcut functions
"rowSums similar to apply(x, 1, sum)
rowMeans similar to apply(x, 1, mean)
colSums similar to spply(x, 2, sum)
colMeans = apply(x, 2, mean)
parameters of shortcuts: x, ..., na.rm, dim - which dimension are
regarded as rows or columns to sum over

"
# quantiles of row of matrix
"> x = matrix(rnorm(200), 20, 10)
> apply(x, 1, quantile, probs = c(0.25, 0.75))
          [,1]       [,2]       [,3]       [,4]       [,5]       [,6]
25% -0.9686038 -0.5613768 -0.8384428 -1.2898949 -0.9890842 -0.5809978
75%  0.2023715  1.0789307  0.1325692 -0.0767982  1.3422919  0.5865756
          [,7]        [,8]        [,9]      [,10]      [,11]
25% -0.8237116 -0.62387762 -0.68944995 -0.5281022 -0.8184700
75%  0.3815251  0.08641744  0.09694716  0.2109390  0.5549174
         [,12]      [,13]       [,14]      [,15]      [,16]
25% -0.3546380 -0.2197593 -0.55889314 -1.0146341 -0.2654860
75%  0.3347432  1.0386384 -0.05015169  0.5391982  0.8761715
         [,17]      [,18]        [,19]      [,20]
25% -0.6949905 -0.4205925 -0.009323959 -0.5887117
75%  0.9399615  0.0426014  0.399888547  0.7000215"

# average matrix in an array
"array(data, dim)
x = array(1:40, c(2,2,10))
> rowMeans(x, dims = 2)
     [,1] [,2]
[1,]   19   21
[2,]   20   22
> dim(x)
[1]  2  2 10
> rowMeans(x, dims = 1)
[1] 20 21
"

# mapply - multivariate apply of sorts which applies function in 
# parallel over set of arguments
" mapply aplies function over elements of multiple lists passed
> str(mapply)
function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
fun - function to apply
... contains arguments to apply over
MoreArgs list of arguments to fun
Simplify - indicates whether resultshould be simplified

ex - in list we have to again and again write the func, in mapply
we can apply function in a single time
> list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
[[1]]
[1] 1 1 1 1
[[2]]
[1] 2 2 2
[[3]]
[1] 3 3
[[4]]
[1] 4
> mapply(rep, 1:4,4:1)
[[1]]
[1] 1 1 1 1
[[2]]
[1] 2 2 2
[[3]]
[1] 3 3
[[4]]
[1] 4
"

"> noise = function(n, mean, sd){
+ rnorm(n,mean,sd)
+ }

> noise(5,1,2)
[1] 0.6355566 1.3298849 2.6023788 0.9256519 1.0427784

# the fuction doesn't do desired work when vector arguments are
# passed
> noise(1:5,1:5,2)
[1] -0.6342916  2.4394861  5.1293520  3.3834075  5.0998148

# with mapply we can get n no with n mean and sd 2 for n=1:5
> mapply(noise, 1:5,1:5,2)
[[1]]
[1] 5.272384

[[2]]
[1] 1.567197 4.399492

[[3]]
[1]  2.42529229  2.39234776 -0.01392784

[[4]]
[1]  4.1874080 -0.5636198  4.4497124  5.3979668

[[5]]
[1] 7.177853 9.737847 3.469902 6.151026 1.122541
"

# tapply
# to apply function over subsets of a vector
"> str(tapply)
function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE) 
x - vector, ind - factor or list of factors, fun - function,
... , simplify

gl() - generate factors by specifying pattern of their levels
parameters - 
n :an integer giving the number of levels.
k : an integer giving the number of replications.
length: an integer giving the length of the result.
labels: an optional vector of labels for the resulting factor 
levels.
ordered: logical indicating whether the result should be ordered
or not.
-> Value: The result has levels from 1 to n with each value 
replicated in groups of length k out to a total length of length.

> x = c(rnorm(10), runif(10), rnorm(10,1))
> f = gl(3,10)
> f
 [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
Levels: 1 2 3
> tapply(x,f,mean)
         1          2          3 
-0.1453912  0.4932928  0.9735746 
> tapply(x,f,mean,simplify = F)
$`1`
[1] -0.1453912

$`2`
[1] 0.4932928

$`3`
[1] 0.9735746

> tapply(x,f,range)
$`1`
[1] -2.494296  2.463665

$`2`
[1] 0.1453929 0.8122757

$`3`
[1] -0.6364617  2.7428239

> x
 [1] -2.49429582 -1.08944394 -0.40181143  1.22880296  0.73739853
 [6] -0.63781689 -0.05339353 -1.06600999 -0.14100772  2.46366537
[11]  0.19603160  0.14539287  0.26200697  0.75544925  0.81227569
[16]  0.34868892  0.31904051  0.76273069  0.68941329  0.64189829
[21]  1.25195559  0.19248715  2.74282393  0.71443158  0.83174177
[26]  1.30422635  0.83558566 -0.63646173  0.74008291  1.75887248
"

# split
# takes vector or other objects and splits it into groups
# determined by factor or list of factors
"> str(split)
function (x, f, drop = FALSE, ...)  
x - vector/list/df, f - factor or lost of factors,
drop - indicates whether empty factors levels should be dropped

> x = c(rnorm(10), runif(10), rnorm(10,1))
> f = gl(3,10)
> split(x, f)
$`1`
 [1]  0.018610605  0.999875549  0.009121171  0.548953861  0.473534132
 [6]  0.910984159 -1.550636561  1.192876096  0.379084963  1.197738000

$`2`
 [1] 0.435560522 0.122919156 0.695988628 0.282678805 0.005512447
 [6] 0.890687822 0.225466254 0.930306786 0.782927623 0.080604658

$`3`
 [1]  0.3774885  1.4089717 -1.0809715  0.8499644 -0.3239587  0.3421542
 [7] -0.2210580 -0.9153733  2.7798259 -0.8593761

# common practice split followed by lapply
> lapply(split(x,f), mean)
$`1`
[1] 0.4180142

$`2`
[1] 0.4452653

$`3`
[1] 0.2357667
"
# splitting on more than 1 level
"> x = rnorm(10)
> f1 = gl(2,5)
> f2 = gl(5,2)
> f1
 [1] 1 1 1 1 1 2 2 2 2 2
Levels: 1 2
> f2
 [1] 1 1 2 2 3 3 4 4 5 5
Levels: 1 2 3 4 5
> interaction(f1,f2)
 [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

> str(split(x,list(f1,f2)))
List of 10
 $ 1.1: num [1:2] -1.26 0.379
 $ 2.1: num(0) 
 $ 1.2: num [1:2] 0.161 0.896
 $ 2.2: num(0) 
 $ 1.3: num -0.362
 $ 2.3: num -1.11
 $ 1.4: num(0) 
 $ 2.4: num [1:2] 0.876 0.764
 $ 1.5: num(0) 
 $ 2.5: num [1:2] -0.497 0.318
 
# empty levels can be dropped 
> str(split(x,list(f1,f2), drop=T))
List of 6
 $ 1.1: num [1:2] -1.26 0.379
 $ 1.2: num [1:2] 0.161 0.896
 $ 1.3: num -0.362
 $ 2.3: num -1.11
 $ 2.4: num [1:2] 0.876 0.764
 $ 2.5: num [1:2] -0.497 0.318 
"

















