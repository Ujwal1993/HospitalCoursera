hosdata <- read.table("Hospital-data.csv",header = TRUE,sep=",",stringsAsFactors = FALSE)
outdata <- read.table("outcome-of-care-measures.csv",header= TRUE,sep=",",stringsAsFactors = FALSE)

result <- function(state, outcome , ran) {
  ## Read outcome data
  ##done
  ## Check that state and outcome are valid
  
  if ((state %in% outdata$State) == FALSE) {print("Invalid State")}
  else if ((outcome %in% c("heart attack","heart failure","pneumonia"))== FALSE){print("Invalid outcome")}
  else {
    
    col <- if (outcome == "heart attack"){11}
    else if (outcome == "heart failure"){17}
    else{23}
    
    outdata <- subset.data.frame(outdata , subset = outdata$State == state)
    
    outdata[,col] <- as.numeric(outdata[,col])
    
    d1 <- outdata[order(outdata[,col] , outdata[,2] , na.last = TRUE , decreasing = FALSE),]
    
    d1[ran,2]
    
  }

}