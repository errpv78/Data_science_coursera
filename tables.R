# Reading data
"read.table, read.csv
readLines, to read from txt
source, for reading in R code files(inverse of dump)
dget - to read in r code files (inverse of dput)
load - for reading in saved workspaces
unserialize - for reading single R objects in binary form
"

# Write data
"write.table
writeLines - takes a character vector and writes each element one 
line at a time to text file
dump
dput
save
serialize"

# read.table
"file, header, sep, colClasses, nrows, comment.char(a char string 
indicating comment char), skip (no of lines to skip from begining),
stringsAsFactors (shoul character variables be coded as factors?)
"

# read.csv identical to read .table except that default separator
# is comma.

"specifying the colClasses helps to read table much fast;
iniital = read.table('temp.txt', nrows=100)
classes = sapply(initial, class)
table_all = read.table('temp.txt', colClasses = classes)
"

# Textual Formats
"dumping and dputing are useful because resulting textual format 
is editable and in case of corruption, potentially recoverable;
dump, dput preserve metadata so another user doesn't have to
specify it all over again;
however they are not very space efficient

# dput - another way to pass data is by deparsing R object with
dput and reading it back using dget
> y = data.frame(a = c(1,'2','parikh'), b = c(3,4,5.6))
> y
       a   b
1      1 3.0
2      2 4.0
3 parikh 5.6
> dput(y)
structure(list(a = c('1', '2', 'parikh'), b = c(3, 4, 5.6)), class = 'data.frame', row.names = c(NA, 
-3L))
> dput(y, file = 'temp_y.R')
> new.y = dget('temp_y.R')
> new.y
       a   b
1      1 3.0
2      2 4.0
3 parikh 5.6

# dump is similar but multiple objects can be parsed using dump
function and read back in using source
> x = 'foo'
> y = data.frame(a = 1, b = 'v')
> x
[1] 'foo'
> y
  a b
1 1 v
> dump(c('x', 'y'), file = 'temp_dump.R')
> rm(x, y)
> rm(x, y)
Warning messages:
1: In rm(x, y) : object 'x' not found
2: In rm(x, y) : object 'y' not found

> source('temp_dump.R')
> y
  a b
1 1 v
> x
[1] 'foo'
"

# Interfaces to outside world
"Data are read in using connection interfaces;
file, gzfile, bzfile, url
> str(file)
function (description = "", open = '', blocking = TRUE, encoding = getOption('encoding'), 
    raw = FALSE, method = getOption('url.method', 'default'))  

open is file opening code - r,w,a,rb,wb,ab

# Connection example - 
> con = url('http://example.com/')
> x = readLines(con)
> head(x)
[1] '<!doctype html>'                  
[2] '<html>'                           
[3] '<head>'                           
[4] '    <title>Example Domain</title>'
[5] ''                                 
[6] '    <meta charset=\'utf-8\' />'   

"













