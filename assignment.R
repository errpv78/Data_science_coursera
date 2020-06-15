pollutantmean = function(directory, polutant, id)
{
  num = length(id)
  means = vector("numeric", num)
  temp = matrix(0,0,4)
  for(i in 1:num)
  {
   # print(i)
  #  print(id[i])
    if(id[i]<10)
    {
      name = paste(directory, "/00",id[i],".csv",sep="")
    }
    else if(id[i]<100)
    {
      name = paste(directory, "/0",id[i],".csv",sep="")
    }
    else
    {
      name = paste(directory, "/",id[i],".csv",sep="")
    }
   # print(name)
    f = read.csv(name)
    temp = rbind(temp,f[!is.na(f[polutant]),])
  }
  print(temp[1:10, polutant])
  print(class(temp[, polutant]))
  meanf = mean(temp[, polutant])
  meanf
}

complete = function(directory, id)
{
  num = length(id)
  result = matrix(0,num,2)
  # print(result)
  for(i in 1:num)
  {
    # print(i)
    # print(id[i])
    if(id[i]<10)
    {
      name = paste(directory, "/00",id[i],".csv",sep="")
    }
    else if(id[i]<100)
    {
      name = paste(directory, "/0",id[i],".csv",sep="")
    }
    else
    {
      name = paste(directory, "/",id[i],".csv",sep="")
    }
    result[[i,1]] = id[i]
    f = read.csv(name)
    f = f[complete.cases(f),]
    result[[i,2]] = as.numeric(nrow(f))
  }
  result
}


corr = function(directory, threshold=0)
{
  id = 1:332
  num = 332
  result = matrix(0,0,6)
  # print(result)
  for(i in 1:num)
  {
    # print(i)
    # print(id[i])
    if(id[i]<10)
    {
      name = paste(directory, "/00",id[i],".csv",sep="")
    }
    else if(id[i]<100)
    {
      name = paste(directory, "/0",id[i],".csv",sep="")
    }
    else
    {
      name = paste(directory, "/",id[i],".csv",sep="")
    }
    f = read.csv(name)
    f = f[complete.cases(f),]
    if(nrow(f)>threshold)
    {
      result = rbind(result, summary(cor(f[,"sulfate"], f[,"nitrate"])))
    }
  }
  # result
  result  
}











