# Creation date: 
#   2015-08-21
# Created by:
#   HS
# Objective:
#   Get a template for barplots with ggplot2
# Usage:
#
# Input:
#   FIXME - variables to be changed within the function
# Output:
#   Barplot


require(ggplot2)

#output as .eps
postscript(
	file="example.eps", 
	onefile=FALSE, 
	horizontal=FALSE)

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() 

dev.off()

