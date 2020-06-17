rankhospital = function(state, outcome, num)
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
  
  if(num=="best")
  {
    num = 1
  }
  data = data[data['State']==state,]
  
  data = data[,c("State","Hospital.Name",col)]
  # print(data[1:10,])
  data[,col] = as.numeric(data[,col])
  data = data[complete.cases(data),]
  data = data[order(data[[col]],data[["Hospital.Name"]]),]
  if(num=="worst")
  {
    num = nrow(data)
  }
  print(num)
  print(data[num,])
  # print(data)
    # print(data[1:10,])
}





