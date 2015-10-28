# Creation date: 
#   2015-08-19
# Created by:
#   HS
# Objective:
#   Get histogram with the discrete datapoints shown
# Usage:
#
# Input:
#   
# Output:
#   


## Plot descreet values
ggplot(mtcars, aes(x=mpg)) + 
	geom_dotplot(binwidth = 1) # plotting discreet values