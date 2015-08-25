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

library(ggplot2)
library(grid) # needed for arrow function
library(extrafont) # using different fonts

# using different fonts
# library(extrafont)
# font_import() # import all your fonts
# fonts() #get a list of fonts
# fonttable()
# fonttable()[40:45,] # very useful table listing the family name, font name etc

ggplot(data=mtcars, aes(x=mpg, y=wt, fill=qsec)) + #, width=1.0
  geom_bar(stat="identity", position=position_dodge()) + 
  ggtitle("MPG vs disp;\n colour coded: 1/4 mile time")+
  labs(x="Miles per Gallon", y = "Weight (lb/1000)") +# adding labels
  geom_segment(aes(x = 20, y = 5.7, xend = 15, yend = 4.7), arrow = arrow(length = unit(0.5, "cm")))+# Adding an arrow
  scale_y_continuous(expand = c(0,0))+## Entfernt Abstand zwischen Balken und X-Achse
  coord_cartesian(ylim=c(1,5.5))+ ##Skalieren der Y-Achse
  theme(plot.title = element_text(size=30, vjust=1, family="Droid Serif"))
  

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