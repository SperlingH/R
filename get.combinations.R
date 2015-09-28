# Creation date: 2015-09-28
# Created by: HS
# Objective: Get all combinations of a m*m matrix without diagonals and reverse
# Usage: get.combinations(n) # n is an integer with the rows and columns of a n*n matrix
# Input: n - integer
# Output: 
# Misc: Needs further work to return the integers for further use in other functions

## pairwise output of possible combination of "n" elements 
get.combinations <- function(n) {
for (i in 1:(n-1)){
  for (j in (i+1):n){
    print(paste(i,j)) # test of function - other functions can be implemented with the use of [i] and [j]
  }
  #return ()
}
}
  
get.combinations(5)