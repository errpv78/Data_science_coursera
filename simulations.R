# str function:
"Alternative to summary func, it compactly display internal structure
of an R object.
It tells what's inside object:
> str(lm)
function (formula, data, subset, weights, na.action, method = 'qr', 
    model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
    contrasts = NULL, offset, ...)  
"

# summary func
"> x = rnorm(100,3,9)
> summary(x)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-11.5909  -0.9037   4.5029   5.2496  10.7310  27.8739 
> str(x)
 num [1:100] 0.489 10.828 -5.684 3.273 -1.058 ..."


# Generating Random Numbers
"rnorm: generate randome normal variables with given mean and
standard deviation.
dnorm: evaluate Normal probability density(with given mean/SD) at 
a point (or vector of points).
pnorm: evaluate cumulative distribution function for a normal
distribution.
rpois: generate random Poisson variates with a given rate.
"

"# SD
Standard deviation is a number used to tell how measurements 
for a group are spread out from the average (mean), or expected
value. A low standard deviation means that most of the numbers
are close to the average. A high standard deviation means that
the numbers are more spread out.

# Probability density function PDF
In probability theory, a probability density function (PDF), or
density of a continuous random variable, is a function whose 
value at any given sample (or point) in the sample space (the
set of possible values taken by the random variable) can be 
interpreted as providing a relative likelihood that the value of
the random variable would equal that sample.[2] In other words,
while the absolute likelihood for a continuous random variable 
to take on any particular value is 0 (since there are an infinite
set of possible values to begin with), the value of the PDF at two
different samples can be used to infer, in any particular draw of 
the random variable, how much more likely it is that the random 
variable would equal one sample compared to the other sample.

# Normal distribution
Normal distribution, also known as the Gaussian distribution, is
a probability distribution that is symmetric about the mean, 
showing that data near the mean are more frequent in occurrence
than data far from the mean. In graph form, normal distribution
will appear as a bell curve.

# Cumulative distribution function of normal distribution
In probability theory and statistics, the cumulative distribution
function (CDF) of a real-valued random variable X, or just 
distribution function of X, evaluated at x, is the probability 
that X will take a value less than or equal to x.

# Poisson distribution
In probability theory and statistics, the Poisson distribution
is a discrete probability distribution that expresses probability
of a given number of events occurring in a fixed interval of time
or space if these events occur with a known constant mean rate and
independently of the time since the last event.
"

# Generating random numbers
"Probability distributionfunctions have 4 functions assciated
with them: d for density; r for random number generation;
p for cumulative distribution; q for quantile function

rgamma, pgamma,qgamma,dgamma for gamma function and similar with
ppois, rpois,dpois,qpois for poisson distribution.

# By default mean is taken as 0 and sd 1
> x = rnorm(10)
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.8461  0.3483  1.1391  1.0905  1.9639  2.4374 

> x = rnorm(10,20,2)
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  17.91   18.83   20.30   20.37   20.88   25.37 
> x
 [1] 17.91181 18.71656 25.37219 18.95334 21.84046 20.22183 20.49316
 [8] 18.79435 21.01242 20.37061
"

# seed for random no generation
"setting random no seed with set.seed ensures reproducibility.
> set.seed(42)
> x = rnorm(10)
> x
 [1]  1.37095845 -0.56469817  0.36312841  0.63286260  0.40426832
 [6] -0.10612452  1.51152200 -0.09465904  2.01842371 -0.06271410
> x = rnorm(10)
> x
 [1]  1.3048697  2.2866454 -1.3888607 -0.2787888 -0.1333213
 [6]  0.6359504 -0.2842529 -2.6564554 -2.4404669  1.3201133
> set.seed(42)
> x = rnorm(10)
> x
 [1]  1.37095845 -0.56469817  0.36312841  0.63286260  0.40426832
 [6] -0.10612452  1.51152200 -0.09465904  2.01842371 -0.06271410
"

# Generating random numbers from a linear model
"> set.seed(20)
> x = rnorm(100)
> e = rnorm(100,0,2)
> y = 0.5 + 2*x + e
> summary(y)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-6.4084 -1.5402  0.6789  0.6893  2.9303  6.5052 
> plot(x,y)

# if x is binary
> x = rbinom(100,1,0..5)
Error: unexpected numeric constant in x = 'rbinom(100,1,0..5'
> x = rbinom(100,1,0.5)
> e = rnorm(100,0,2)
> y = 0.5+2*x+e
> summary(y)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-4.76515  0.07207  1.45223  1.56992  3.01683  6.99287 
> plot(x,y)
"

# Random Sampling
"sample function draws randomly from a specified set of objects
allowin to sample arbitrary distributions
> set.seed(78)
> sample(1:20,4)
[1] 16 20 11 13
> sample(1:20,4)
[1] 18  8  6 20
> set.seed(78)
> sample(1:20,4)
[1] 16 20 11 13
> sample(letters,5)
[1] 'w' 'k' 'h' 'i' 'c'
> sample(1:10) # when no of numbers is not specified, permutation
# is given
 [1]  5  8 10  3  4  2  7  1  9  6
> sample(1:10,replace=T)
 [1]  4  2  4  4  5  6 10 10  4  4
"

















