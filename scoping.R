# Binding values to symbol
"When R tries to bind a value to a symbol, it searches through a 
series of envs to find apt value. The order is:
1) Seacrh global env for symbol name matching the one requested
2) Search namespaces of each of package on search list

# Searchlist can be found using search function
> search()
 [1] '.GlobalEnv'        'tools:rstudio'     'package:stats'    
 [4] 'package:graphics'  'package:grDevices' 'package:utils'    
 [7] 'package:datasets'  'package:methods'   'Autoloads'        
[10] 'package:base' 

R has separate namespaces for funcitons and non-functions so it's 
possible to have an object named c and a function named c.
"

# Inside a function's environment
make_pow = function(n)
{
  pow = function(x)
  {
    x^n
  }
  pow
}
"> square = make_pow(2)
> cube = make_pow(3)
> square(5)
[1] 25
> cube(4)
[1] 64
"
"> environment(square)
<environment: 0x558ef3c12770>
> ls(environment(square))
[1] 'n'   'pow'
> ls(environment(cube))
[1] 'n'   'pow'
> get('n', environment(square))
[1] 2
> get('pow', environment(square))
function(x)
  {
    x^n
  }
<environment: 0x558ef3c12770>"















