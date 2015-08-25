# Creation date: 
#   2015-08-22
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

##ggplot2
##dotplot with smoothed data overlay
	##ordering data
library(ggplot2)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  stat_smooth(method="lm" , level=0) # method = lm, glm, gam, loess, rlm
  
  
  
  ##ggplot2
##create background behind text written in the plot
library(ggplot2)
ggplot(data = CO2,aes(x = conc, y = uptake)) + 
  geom_point(size = 10) +
  geom_text(data = CO2,aes(x = conc, y = uptake, label = Plant), size = 3, col = "white") +
  geom_rect(data = CO2, aes(xmin = conc -.4, xmax = conc + .4, ymin = uptake - .4, ymax = uptake + .4),  alpha=0.1) 
