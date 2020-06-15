# Control Structures
"if, else; for; while; repeat - execute an infinite loop; break;
next - skip an iteration; return - exit a func;"

# if
"if(x>3){
y=10
}
else{
y=0
}

y = if(x>3){
10
} 
else{
0
}
"

# for
"for(i in 1:10){
print(i)
}

x = c('a','b','c', 'd')
for(i in seq_along(x)){
  print(x[i])
}
seq_along(x) - creates int list corresponding to vector length

for(l in x){
print(l)
}
"

# while
"count=0
while(count<10){
print(count)
count = count+1
}

while(z>1 && z<3){
print(z)
z = z+1
}
"

# Repeat
"x = 1
t = 10
repeat{
x1 = func()

if(abs(x1-x)<tol){
break
}
else if(x==tol){
  next
}
else{
  x = x1
}
}
"













