hosdata <- read.table("Hospital-data.csv",header = TRUE,sep=",",stringsAsFactors = FALSE)
outdata <- read.table("outcome-of-care-measures.csv",header= TRUE,sep=",",stringsAsFactors = FALSE)

best <- function(state, outcome) {
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
            
            v <- which.min(outdata[,col])
            
            
            ## Return hospital name in that state with lowest 30-day death
            outdata$Hospital.Name[v]
        
            
  
        }

}