# Creation date: 
#   2015-08-21
# Created by:
#   HS
# Objective:
#   create example data
# Usage:
#
# Input:
#   FIXME - variables to be changed within the function
# Output:
#   data frame with Var x, y


## Plot histogram
ggplot(CO2, aes(x = uptake)) +
	geom_histogram(
		binwidth= 1, 
		colour = "black", 
		fill = "grey")

## Plot histogram with function overlay
x <- rnorm(100, mean=5, sd=0.0001)
df <- data.frame(counts=x, cat=1)

ggplot(df, aes(x=counts)) +
	labs(y="counts", x="values") + 
	geom_histogram(aes(y = ..density..), color="black", fill=NA) +
	stat_function(fun = dnorm, col = "blue",arg=list(mean=5,sd=0.0001)) + 
  theme(axis.ticks = element_blank(), axis.text = element_blank())
