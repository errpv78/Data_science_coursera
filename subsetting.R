# Subsetting
"[ - returns an object of same class as original, can be used to 
select more than 1 element
[[ - to extract elements of a list or df, can extract only a single 
element and class of returned object not necessarily be a list or df
$ - to extract elements of list or df by name, semantics same as [[

> x = c('a', 'd', 'z', 'r', 'c')
> x[1]  - numeric index
[1] 'a'
> x[2:4]
[1] 'd' 'z' 'r'
> x [x > 'c']  - logical index
[1] 'd' 'z' 'r'
> u = x < 'm'
> u
[1]  TRUE  TRUE FALSE FALSE  TRUE
> x[u]
[1] 'a' 'd' 'c'
"

# Subsetting lists
"> v = list(p = 7:8, a = c('a', 'b'), foo=78)
> v
$p
[1] 7 8

$a
[1] 'a' 'b'

$foo
[1] 78

> v[1]
$p
[1] 7 8

> v[[2]]
[1] 'a' 'b'
> v$foo
[1] 78
> v['p']
$p
[1] 7 8

> v[['v']]
NULL
> v[['a']]
[1] 'a' 'b'

> v[3]
$foo
[1] 78

> v[c(1,3)]
$p
[1] 7 8

$foo
[1] 78

# [[]] can be usd with variables equal to names of obj but $ can't
> name = 'foo'
> v[[name]]
[1] 78
> v$name
NULL

# [[]] can be used to get single element at any position
> v[[c(1,2)]]
[1] 8
> v[[2]]
[1] 'a' 'b'
> v[[c(2, 1)]]
[1] 'a'
> v[[c(1, 1)]]
[1] 7

"

# Subsetting matrices
"> v = matrix(1:6, 3,2)
> v
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
> v[1,2]
[1] 4
> v[2,3]
Error in v[2, 3] : subscript out of bounds
> v[3,2]
[1] 6
> v[1,]
[1] 1 4
> v[,2]
[1] 4 5 6

# By default when 1 single element of matrix is retrieved it is
returned as a vector og length 1*1 than a matrix of 1*1, this
behaviour can be switched by detting drop = False
> v = matrix(1:8, 4,2)
> v[1, 2]
[1] 5
> v[1, 2, drop=F]
     [,1]
[1,]    5

> v = matrix(1:8, 4,2)
> v[1, 2]
[1] 5
> v[1, 2, drop=F]
     [,1]
[1,]    5
> v = matrix(1:6, 3,2)
> v[,2]
[1] 4 5 6
> v[,2, drop=F]
     [,1]
[1,]    4
[2,]    5
[3,]    6
"

# Partial matching
"Partial matching of names is allowed with [[ and $
> x = list(parikh = 2:8)
> x[['p']]
NULL
> x[['p'', exact = F]]
[1] 2 3 4 5 6 7 8
> x$p
[1] 2 3 4 5 6 7 8
"

# Removing NA Values
"> x = c(1,2,NA, 4, NaN, 6)
> miss = is.na(x)
> x[!miss]
[1] 1 2 4 6

# When there are multiple things and we want to take subset with
no missing values
> p = c(1,2,NA, 4,5)
> v = c(6,NA,NA, 9,10)
> good = complete.cases(p, v)
> good
[1]  TRUE FALSE FALSE  TRUE  TRUE
> p[good]
[1] 1 4 5
> v[good]
[1]  6  9 10
"


# Vectorized Operations
"> p = 1:5; v = 6:10
> p+v
[1]  7  9 11 13 15
> p-v
[1] -5 -5 -5 -5 -5
> p/v
[1] 0.1666667 0.2857143 0.3750000 0.4444444 0.5000000
> p*v
[1]  6 14 24 36 50
> p>v
[1] FALSE FALSE FALSE FALSE FALSE
> p>3
[1] FALSE FALSE FALSE  TRUE  TRUE"

"Matrix operations
> p = matrix(23:26,2,2); v = matrix(1:4, 2, 2);
# Element wise
> p * v
     [,1] [,2]
[1,]   23   75
[2,]   48  104
> p/v
     [,1]     [,2]
[1,]   23 8.333333
[2,]   12 6.500000

# True matrix multiplication
> p %*% v
     [,1] [,2]
[1,]   73  169
[2,]   76  176
"



