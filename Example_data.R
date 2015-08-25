# Creation date: 
#   2015-08-21
# Created by:
#   HS
# Objective:
#   create example data
# Usage:
#
# Input:
#   Number of data points to be created
# Output:
#   data frame with variable x
# ToDo:
#	more dimensions
#	naming of variables


example_data <- function (number) 
{
set.seed(1234)
d.f <- data.frame(x = rnorm(number))

return(d.f)
}