# Creation date: 
#   2015-08-21
# Created by:
#   HS
# Objective:
#   Get a template for barplots with ggplot2
# Usage:
#
# Input:
#   
# Output:
#   Barplot

library(ggplot2)

# get example data
# getting mean and sd over subsets of data
library(plyr)
new.df <- ddply(CO2,c("Type", "Treatment", "conc"), summarise, mean.uptake = mean(uptake), sd.uptake = sd(uptake))
#reorder factors of CO2$Type 
new.df$Type <- factor(new.df$Type, levels = c("Mississippi","Quebec")) #redefine levels
# subsetting data
new.df.2 <- subset(new.df, conc == 1000)

# Barplot with errorbars
ggplot(new.df.2, aes(Type , mean.uptake, fill = Treatment))+
	geom_bar(stat="identity", position=position_dodge())+ # grouping by Type
# Errorbar
  	geom_errorbar(aes(
		ymin=new.df.2$mean.uptake-new.df.2$sd.uptake, 
		ymax=new.df.2$mean.uptake+new.df.2$sd.uptake),
		width=.2, 
		position=position_dodge(.9))+

# Titel 
ggtitle(expression(atop("Carbon Dioxide Uptake in Grass Plants", atop(italic("at  a CO2 concentration of 1000 (mL/ L)"), ""))))+
  theme(plot.title = element_text(size=30, vjust=-1, family="Arial"))+
  
# Axes
labs(x="Plant type", y = "CO2 uptake (µmol/ m² sec)") + # axis labels
#  scale_y_continuous(expand = c(0,0))+ # removes distance between bottom of plot and x-axis
#  coord_cartesian(xlim=c(0,20))+ # scaling of the x-axis  
#  coord_cartesian(ylim=c(1,5.5)) # scaling of the y-axis 

# Legend
#guides(fill=guide_legend(title=NULL))+ # remove legend
#scale_fill_discrete(name="Experimental\nCondition")# titel of legend
scale_fill_manual(values=c("blue", "red"), 
                    name="Experimental\nCondition",
                    breaks=c("chilled", "nonchilled"),
                    labels=c("Control", "Treatment 1")) + 
theme(legend.title = element_text(colour="black", size=12, face="bold"), # legend titel
      legend.text = element_text(colour="black", size = 12, face = "bold"), # legend text
      legend.background = element_rect(fill="gray90", size=.5, linetype="dotted"), # background of plot, default without
      legend.position="bottom" # position of legend, "top", "bottom", "rigth", "left"
)


