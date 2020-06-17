best = function(state, outcome)
{
  data <- read.csv("Assignment 3/outcome-of-care-measures.csv", colClasses = "character")
  
  if(outcome=="heart attack")
  {
    col = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  }
  else if(outcome=="heart failure")
  {
    col = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  }
  else if(outcome=="pneumonia")
  {
    col = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
  else
  {
    print("outcome is invalid")
    return ()
  }
  print(outcome)
  print(col)
  if(!any(unique(data['State'])==state))
  {
    print("Incorrect state")
    return ()
  }
  print(state)
  minm = min(as.numeric(data[data['State']==state,col]),na.rm=T)
  print(minm)
  data[,col] = as.numeric(data[,col])
  final = data[data[col]==minm & data['State']==state,c("Hospital.Name","State",col)]
  final[complete.cases(final),]
}



rankhospital = function(state,outcome)
{
  
}











