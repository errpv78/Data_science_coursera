add_2num = function(x,y)
{
  x+y
}

# specifying default value of parameter
greater_than_x = function(l,x = 12)
{
  y = l>x
  l[y]
}

mean_of_col = function(df, remove=TRUE)
{
  x = ncol(df)
  means = numeric(x)
  for(i in 1:ncol(df)){
    means[i] = mean(df[,i], na.rm = remove)
  }
  means
}

# functions can be nested
# Functions are treated as objects and thus Functions can be passed
# as function parameters
"Formal arguments are arguments included in function definition.
The formals function returns list of all formal arguments of a 
function.
> formals(mean_of_col)
$df

$remove
[1] TRUE
"
" R function arguments can be matched positionally or by name
(in a changed order also)"

# Function argument matching
"Functions arguments can also be partially matched, which is useful
for interactive work. The order of operations when given an argument
is 1) Check for exact match for a named argument.
2) Check for partial match
3) Check for positional match"


# Lazy Evaluation
"Arguments to functions are evaluated lazily, ie only as needed"
lazy = function(a, b){
  a^2
}
"> lazy(2) - so as be is not needed, do not passing b also works
[1] 4
"

lazy1 = function(a,b){
  print(a)
  print(b)
}
"> lazy1(2)
[1] 2
Error in print(b) : argument 'b' is missing, with no default
> lazy(b=2)
Error in lazy(b = 2) : argument 'a' is missing, with no default"

# ... Argument
"It indicate variable number of arguments that are usually 
passed on to other functions
... is used when extending another function and you don't want
to copy entire argument list of original function.
... is also necessary when no of arguments passed to function
can't be known in advance

> args(paste)
function (..., sep = " ", collapse = NULL, recycle0 = FALSE) 
NULL
> args(cat)
function (..., file = "", sep = " ", fill = FALSE, labels = NULL, 
    append = FALSE) 
NULL
> formals(paste)
$...


$sep
[1] " "

$collapse
NULL

$recycle0
[1] FALSE

# args to get the function definition
# Any arguments that appear after ... on argument list must be
named explicitly and in full and can't be partially matched.
"






















