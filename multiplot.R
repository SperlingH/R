  # Creation date: 
  #   2015-08-21
  # Created by:
  #   HS
  # Objective:
  #   create grid of plot with different factors
  # Usage:
  #   FIXME - create a function for easier use
  # Input: 
  #   data.frame with 
  #     x = conc
  #     y = uptake
  #     vertical condition = Treatment; different colours
  #     horizontal condition = Type
  # Output:
  #   plot; x vs. y of N * M categories
  
  
  ## Create facet_grid with individual geom_hline
  # use dataset "CO2"
  # plotting conc against uptake
  # differentiate between Type (column) and Treatment (row)
  
  library(ggplot2)
  
  h.line <- data.frame(Type = c("Quebec", "Mississippi"), Y.intercept = c(35, 15)) # defines horizontal line in the plots of the different types
  
  ggplot(CO2, aes(x = conc, y = uptake, colour=factor(Treatment))) + 
  	geom_point() + 
  	facet_grid(Treatment~Type) + # (vertical ~ horizontal) e.g. only Treatment vertical: facet_grid(Treatment ~ .)
  	stat_smooth(method="loess") + 
  	geom_hline(data = h.line, aes(yintercept = Y.intercept))+ # plots horizontal line in the plot
  
  # Titel 
  ggtitle(expression(atop("Carbon Dioxide Uptake in Grass Plants", atop(italic("cold tolerance in Echinochloa spec."), ""))))+
    theme(plot.title = element_text(size=30, vjust=-1, family="Arial"))+
  
  # Axes
    labs(x="CO2 concentration (mL/ L)", y = "µmol/ m² sec") +# axis labels
  #  scale_y_continuous(expand = c(0,0))+ # removes distance between bottom of plot and x-axis
  #  coord_cartesian(xlim=c(0,20))+ # scaling of the x-axis  
  #  coord_cartesian(ylim=c(1,5.5)) # scaling of the y-axis 
  
  # Legend
  #  theme(legend.position="none")#removes legend
  #  theme(legend.title=element_blank()) # removes title of legend
     scale_colour_discrete (name="Experimental\nCondition", # titel of legend
                            breaks=c("chilled", "nonchilled"), # alters order
                            labels=c("C", "NC"))+ # alters label names
      theme(legend.title = element_text(colour="black", size=12, face="bold"), # legend titel
      legend.text = element_text(colour="black", size = 12, face = "bold"), # legend text
      legend.background = element_rect(fill="gray90", size=.5, linetype="dotted"), # background of plot, default without
      legend.position="bottom" # position of legend, "top", "bottom", "rigth", "left"
      )

# smaller example:  
#  mtcars$gear <- as.factor(mtcars$gear)
#  qplot(mpg, disp, data = mtcars, facets = cyl ~ gear)