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

#plotting poisson
x <- c(0:10)

ggplot(transform(data.frame(x=x), y=dpois(x, 1)), aes(x, y)) + 
	geom_bar(stat="identity", color="black", fill="black") + 
	theme(
		axis.ticks = element_blank(), # remove axis ticks
		axis.text = element_blank()) + # remove axis text
	labs(y="counts", x="values")

  scale_fill_manual(values=c("grey","grey22", "black"))+## Farbe der Säulen

# FIXME
# Barplots with errorbars
# use the "CO2" dataset!!
#  geom_errorbar(aes(ymin=sub.O.df.n$Mean-sub.O.df.n$SD, ymax=sub.O.df.n$Mean+sub.O.df.n$SD),width=.2, position=position_dodge(.9))+

###########
# Levels in barplots

# Automatic levels
ggplot(mtcars, aes(factor(cyl))) + 
	geom_bar() 

# ascending order
mtcars$cyl2 <- factor(mtcars$cyl, levels = names(table(mtcars$cyl))[order(table(mtcars$cyl))])
ggplot(mtcars, aes(cyl2)) + 
	geom_bar()

# descending order
mtcars$cyl3 <- with(mtcars, reorder(cyl, cyl, function(x) -length(x)))
ggplot(mtcars, aes(cyl3)) + 
	geom_bar()

# manual order:
levels(mtcars$cyl) # check levels
mtcars$cyl <- factor(mtcars$cyl, levels = c("8","6","4")) #redefine levels
levels(mtcars$cyl) # check levels
ggplot(mtcars, aes(cyl)) + 
	geom_bar()

