# # for comment
# <- or = for assignment

# Five type of object in r (Data types)
# Character; Numeric (Real numbers); Integer; Complex; Logical(t/f)
# x<- vector() to initialize empty vector; A vector contains object
# of same class ; vector takes two arguments class of object, and 
# length of object

# class(obj) - to get class of the object

# list - vector with different objects

# Inf for infinity, -Inf for -ve infinity
# NaN - undefined value or a missing value

# R objects can have attributes - names, dimnames;
# dimensions, class, length, other user-defined attributes/metadata

# c() [Concatenate function] can also be used to create vectors
"x = c(1,2,3,4) - int vector
c = c(1+0i, -4+5i) - complex vector
a = c(1,2,3,4, 'Parikh') - character vector

length(v) - for length of vector
max(v), min(v) - for max , min, if there is NA in v, then ans 
will be NA.
"
# When diferent objects are mixed in a vector, coercion occurs so 
# that every element in vector is of same class. For ex-
# y = c(1.2, "a")  - becomes vector of char
# y = c(1, TRUE)  - becomes vector of number (True is 1)

# Explicit Coercion:Converting from a class to another explicitly
# a = 0.4
# > class(a)
# [1] "numeric"
# > as.integer(a)
# [1] 0
# > as.character(a)
# [1] "0.4"
# > a
# [1] 0.4
# > as.logical(a)
# [1] TRUE
# > as.complex(a)
# [1] 0.4+0i

# When coercion can't happen NA values are in result
# a = c('a','b','c','c')
# > a
# [1] "a" "b" "c" "c"
# > as.numeric(a)
# [1] NA NA NA NA
# Warning message:   NAs introduced by coercion 
# > a
# [1] "a" "b" "c" "c"


# Lists - elements of lists have double brackets surrounding them
"x = list(1,'a', TRUE)
> x
[[1]]
[1] 1

[[2]]
[1] 'a'

[[3]]
[1] TRUE
"

# Matrices
"> m = matrix(2,4)
> m
     [,1]
[1,]    2
[2,]    2
[3,]    2
[4,]    2

> m = matrix(nrow=2, ncol=4)
> m
     [,1] [,2] [,3] [,4]
[1,]   NA   NA   NA   NA
[2,]   NA   NA   NA   NA
"

"Matrices are constructed column wise starting from top left
> m = matrix(2:11, nrow=4, ncol=6)
Warning message:
In matrix(2:11, nrow = 4, ncol = 6) :
  data length [10] is not a sub-multiple or multiple of the number of rows [4]
> m
     [,1] [,2] [,3] [,4] [,5] [,6]
[1,]    2    6   10    4    8    2
[2,]    3    7   11    5    9    3
[3,]    4    8    2    6   10    4
[4,]    5    9    3    7   11    5"

"Row Matrix: > m = matrix(3, 1, 2) - (value, nrow,ncol)
> m
     [,1] [,2]
[1,]    3    3

> dim(m)
[1] 1 2
"

"cbind, rbind for matrix creation
> x = 1:4
> y = 5:8
> cbind(x,y)
     x y
[1,] 1 5
[2,] 2 6
[3,] 3 7
[4,] 4 8
> rbind(x,y)
  [,1] [,2] [,3] [,4]
x    1    2    3    4
y    5    6    7    8

If length of both not same then warning but no error,
it repeats elements of smaller one to match size of bigger one
> x=1:5
> rbind(x,y)
  [,1] [,2] [,3] [,4] [,5]
x    1    2    3    4    5
y    5    6    7    8    5
Warning message:
In rbind(x, y) :
  number of columns of result is not a multiple of vector length (arg 2)
> "

"rbind, cbind with 2d vectors:
> a = matrix(1:6,2,3)
> a
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
> b = 7:9
> b
[1] 7 8 9
> rbind(a,b)
  [,1] [,2] [,3]
     1    3    5
     2    4    6
b    7    8    9
> cbind(a,b)
           b
[1,] 1 3 5 7
[2,] 2 4 6 8
Warning message:
In cbind(a, b) :
  number of rows of result is not a multiple of vector length
(arg 2"


# Factor
"Factors are used to represent categorical data, they can be 
unordered or ordered. It is a integer vector where each integer 
has a label.
> v = factor(c('yes','no', 'yes', 'yes', 'zero'))
> v
[1] yes  no   yes  yes  zero
Levels: no yes zero
> table(v)
v
  no  yes zero 
   1    3    1 
> unclass(v)
[1] 2 1 2 2 3
attr(,'levels')
[1] 'no'   'yes'  'zero'"

"Order of levels can be set using levels argument.
> x = factor(c('a', 'b', 'a', 'b', 'b'), levels = c('b', 'a'))
> table(x)
x
b a 
3 2 
> unclass(x)
[1] 2 1 2 1 1
attr(,'levels')
[1] 'b' 'a'

The first level in factor is baseline level."


# Missing values
"NaN for undefined mathematical operations, NA for everything
else. is.na(), is.nan()
NA value have class also, integer NA, char NA etc
NaN is also NA but converse is not true.
> a = c(1,2,NA, 10, NaN)
> is.na(a)
[1] FALSE FALSE  TRUE FALSE  TRUE
> is.nan(a)
[1] FALSE FALSE FALSE FALSE  TRUE
> class(a[3])
[1] 'numeric'  - numeric NA

> x = c('a', NA, 'parikh', NaN)
> x
[1] 'a'      NA       'parikh' 'NaN'   - 
NaN can be only of numeric else it is converted to string 'NaN'
"

# Data Frames
"Represented as special type of list where every element of list
has to have same length; 
Unlike matrices, df can store different
classes of objects in each column, matrices must have every 
element be the same class;
Df also have special attribute row.names
Df are created by read.table() or read.csv() or data.frame()
It can be converted to matrix by data.matrix()

> x = data.frame(foo = 1:5, bar = c(T,T,F,T,T))
> x
  foo   bar
1   1  TRUE
2   2  TRUE
3   3 FALSE
4   4  TRUE
5   5  TRUE
> nrow(x)
[1] 5
> ncol(x)
[1] 2
> dim(x)
[1] 5 2
> class(x)
[1] 'data.frame'"


# R objects can also have names
"> x = 1:4
> names(x)
NULL
> names(x) = c('1', 'a',4,67)
> x
 1  a  4 67 
 1  2  3  4 
> names(x)
[1] '1  'a'  '4'  '67'
> names(x) = c('123')
> x
 123 <NA> <NA> <NA> 
   1    2    3    4 

Names with list
> x = list(a = 'parikh', b=19, c='male')
> x
$a
[1] 'parikh'

$b
[1] 19

$c
[1] 'male'

> m = matrix(1:4, 2,2)
> m
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> names(m)
NULL
> dimnames(m) = list(c('a','b'), c('c','d'))
> m
  c d
a 1 3
b 2 4
> dimnames(m)
[[1]]
[1] 'a' 'b'

[[2]]
[1] 'c' 'd'
"

"rm(x, y) - to remove x, y from environment."






