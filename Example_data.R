# Creation date: 
#   2015-08-21
# Created by:
#   HS
# Objective:
#   create example data
# Usage:
#	example_data(N)
#		# N = Number of data points
# Input:
#   Number of data points to be created
# Output:
#   data frame with variable x with N data points
# ToDo:
#	more dimensions
#	naming of variables


example_data <- function (number) 
{
set.seed(1234)
d.f <- data.frame(x = rnorm(number))

return(d.f)
}