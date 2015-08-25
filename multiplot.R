# Creation date: 
#   2015-08-21
# Created by:
#   HS
# Objective:
#   create grid of plot with individual graphical features
# Usage:
#   FIXME - None so far
# Input:
#   FIXME - None so far
# Output:
#   plot; x vs. y of N * M categories


## Create facet_grid with individual geom_hline
# use dataset "CO2"
# plotting conc against uptake
# differntiate between Type (column) and Treatment (row)

library(ggplot2)

h.line <- data.frame(Type = c("Quebec", "Mississippi"), Y.intercept = c(35, 15)) # defines horizontal line in the plots of the different types

ggplot(CO2, aes(x = conc, y = uptake, colour=factor(Treatment))) + 
	geom_point() + 
	facet_grid(Treatment~Type) +
	stat_smooth() + 
	geom_hline(data = h.line, aes(yintercept = Y.intercept)) # plots horizontal line in the plot
   

