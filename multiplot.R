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



## Create facet_grid with individual geom_hline
# use Dataset "CO2"
# plotting Conc against uptake
# differntiate between Type (column) and Treatment (row)

library(ggplot2)

h.line <- data.frame(Type = c("Quebec", "Mississippi"), Y.intercept = c(35, 15)) # defines horizontal line in the plots of the different Types

ggplot(CO2, aes(x = conc, y = uptake, colour=factor(Treatment))) + 
	geom_point() + 
	facet_grid(Treatment~Type) +
	stat_smooth() + 
	geom_hline(data = h.line, aes(yintercept = Y.intercept)) # plots horizontal line in the plot
   

