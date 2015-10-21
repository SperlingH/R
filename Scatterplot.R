# Creation date: 
#   2015-08-22
# Created by:
#   HS
# Objective:
#   create a scatter plot with trend and 2*2 conditions
# Usage:
#
# Input:
#   -None- 
# Output:
#   scatter plot

## ggplot2
## scatterplot  of CO2 data, Type and Condition
	

library(ggplot2)
ggplot(CO2, aes(conc, uptake, color = Treatment, shape = Type)) + 
  geom_point() + #   geom_point(size = 10) +
  scale_shape_manual(values=c(1,2)) +  # Use a hollow circle and triangle
  stat_smooth(method="loess" , level=0)+ # method = lm, glm, gam, loess, rlm
#   geom_text(data = CO2,aes(x = conc, y = uptake, label = Plant), size = 3, col = "black") + # use text instead of points

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
#        legend.background = element_rect(fill="gray90", size=.5, linetype="dotted"), # background of plot, default without
        legend.position="bottom" # position of legend, "top", "bottom", "rigth", "left"
  )
