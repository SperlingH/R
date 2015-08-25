# Creation date: 
#   2015-08-19
# Created by:
#   HS
# Objective:
#   Get a plain theme() for ggplot2
# Usage:
#
# Input:
#   FIXME - variables to be changed within the function
# Output:
#   theme() for ggplot2


## Plot descreet values
ggplot(mtcars, aes(x=mpg)) + 
	geom_dotplot(binwidth = 1) # plotting discreet values