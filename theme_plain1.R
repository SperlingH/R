# Creation date: 
#   2015-08-19
# Created by:
#   HS
# Objective:
#   Get a plain theme() for ggplot2
# Usage:
#   source("path/to/theme_plain1.R") #OR
#
#   library(devtools) # needed for https source from github
#   source_url('https://raw.githubusercontent.com/SperlingH/R/master/theme_plain1.R')
#
#   + theme_plain1() # within a ggplot evocation
# Input:
#   FIXME - variables to be changed within the function
# Output:
#   modified theme() for ggplot2

require(grid)

theme_plain1 <- function () 
{theme(
  ## axis
  line = element_line(
  	colour = "black", 
  	size = 0.5, 
  	linetype = 1, 
  	lineend = "butt"),
  
  ## background
  rect = element_rect(
  	fill = "white", 
  	colour = "black", 
  	size = 0.5, 
  	linetype = 1),
  
  ## axis title
  text = element_text(
    family = "", 
    face = "plain", 
    colour = "black", 
    size = 12, 
    hjust = 0.5, 
    vjust = 0.5, 
    angle = 0, 
    lineheight = 0.9),  # distance of main title to the plot

  ## legend
  legend.title=element_blank(), ## remove legend title
  legend.position="top",
  legend.text = element_text(
  	size =14, 
  	colour="black", 
  	face = "bold"),
  
  ## axis
  axis.line = element_line(size=.6), ## thickness of axis
  axis.text = element_text(size = rel(0.8), colour = "black"), 
  strip.text = element_text(size = rel(0.8)), 
  axis.line = element_blank(),
  # axis.line = element_line(size=.4) 
  axis.ticks = element_line(colour = "black"), 
  axis.ticks.length = unit(0.15, "cm"), ## length of the ticks
  axis.ticks.margin = unit(0.1, "cm"), ## distance between the axis to axis intercept
# x axis title
  axis.text.x = element_text(
  	angle=0, 
  	size=12, # size of text x axis
  	vjust=0.5,
  	colour="black"), 
  axis.title.x = element_text(
  	face="bold", 
  	colour="black", 
  	size=15,
  	vjust=0.1), # Adjusting axis label distance to plot
# y axis title
  axis.text.y = element_text(
  	angle=0, 
  	size=12, # size of text y axis
  	vjust=0.5,
  	colour="black"), 
  axis.title.y = element_text(
  	face="bold", 
  	colour="black", 
  	size=15,
  	angle=90,
  	vjust=0.1), # Adjusting axis label distance to plot

  
  ## panel
  panel.background =  element_blank(), #element_rect(fill = "grey90", colour = NA), 
  panel.border = element_blank(), 
  panel.grid.major =  element_blank(), # element_line(colour = "grey"), ##grid lines
  panel.grid.minor =element_blank(), # element_line(colour = "grey95", size = 0.25),
  panel.margin = unit(0.25, "lines"), # margin around facet panels, require(grid), change the distance between elements in a grid single plots
  panel.margin.x = NULL, 
  panel.margin.y = NULL, 
  
  ## background
  strip.background = element_rect(fill = "grey80", colour = NA), 
  strip.text.x = element_text(), # facet labels along horizontal direction
  strip.text.y = element_text(angle = -90), # facet labels along vertical direction
  plot.background = element_rect(colour = "white"), # background, behind plot;
  # plot.background = element_blank(),
# plot titel
  plot.title =  element_text(
  	size = rel(1.8), 
  	colour = "black", 
  	vjust = 1, # change distance of title to the plot
  	face = "bold"),  
# plot margins
  plot.margin = unit(c(1, 1, 0.5, 0.5), "lines"), complete = TRUE) 
}
