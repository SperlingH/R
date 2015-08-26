# Creation date: 
#   2015-08-21
# Created by:
#   HS
# Objective:
#   create example data
# Usage:
#
# Input:
#   FIXME 
# Output:
#   

library(ggplot2)
library(grid) # needed for arrow function
library(extrafont) # using different fonts

ggplot(data=mtcars, aes(x=mpg, y=wt, fill=qsec)) + #, width=1.0
  geom_bar(stat="identity", position=position_dodge()) + 
# Titel 
  ggtitle(expression(atop("MPG vs disp", atop(italic("colour coded: 1/4 mile time"), ""))))+
  theme(plot.title = element_text(size=30, vjust=-1, family="Arial"))+
# Axes
  labs(x="Miles per Gallon", y = "Weight (lb/1000)") +# axis labels
  scale_y_continuous(expand = c(0,0))+ # removes distance between bottom of plot and x-axis
  coord_cartesian(xlim=c(0,20))+ # scaling of the x-axis  
  coord_cartesian(ylim=c(1,5.5))+ # scaling of the y-axis
# special markings
  geom_segment(aes(x = 20, y = 5.7, xend = 15, yend = 4.7), arrow = arrow(length = unit(0.5, "cm")))# Adding an arrow  

########
# get last plot to modify
#last_plot()

# modify theme() in ggplot2
# theme_set(new)
#	old <- theme_set(theme_bw())
#	theme_set(old)
#theme_update(...)
#	old <- theme_update(panel.background = element_rect(colour = "pink"))
# theme_get()

#########

# using different fonts
# library(extrafont)
# font_import() # import all your fonts
# fonts() #get a list of fonts
# fonttable()
# fonttable()[40:45,] # very useful table listing the family name, font name etc