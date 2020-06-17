# Profiling
"Profiling is systematic way to examine how much time is spend in
different parts of a program
Useful during code optimization

# Principles of optimization
Design first then optimize
Premature optimization is root of the evil
Measure, don't guess
"

# system.time()
"takes arbitrary R expression as input and return amount of time
taken to evaluate the expression(in secs),
user time - time charget to CPU(s) for this expression
elapsed time: time the user waits in real

Usually bothe user,elapsed time are cloase but
elapsed time may be greater if CPU spends lot of time waiting
around;
elapsed time may be samller if machine has multiple cores

R deos not itself uses multi cores but it has algebra libraries
that use multi cores for optimization.

> system.time(readLines('http://www.jhsph.edu'))
   user  system elapsed 
  0.060   0.027  14.371 

> f = function(n){
+ i = 1:n
+ 1 / outer(i-1,i,"+")
+ }
> x = f(100)
> system.time(svd(x))
   user  system elapsed 
  0.004   0.000   0.003 
"

# Rprof()
"It starts profiler in R; summaryRprof() function summarizes 
output from Rprof()
## Do not use Rprof and system.time together

Rprof() keeps track of function call stack at regularly sampled
intervals and tabulates how much time is spend in each function
Default sampling interval in 0.02 secs.

summaryRprof() tabulates R profiler output and calculates how
much time is spend in which function.
2 methods for normalizing data:
'by.total' divides time specd in each function by total runtime
'by.self' does same but first subtracts out time spent in functions
above in call stack
"











