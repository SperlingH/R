# Creation date: 
#   2015-12-04
# Created by: 
#   HS
# Objective: 
#   plotting polynomal regression
# Usage: 
#   
# Input: 
# 
# Output:
#   

x <- c(-40, -40, -40, -30, -30, -30, -30, -30, -20, -20, -20, -10, -10, -10,  10,  10,  10,  20,  20,  20)
y <- c(2.81, 1.82, 1.80, 2.25, 2.19, 2.02, 1.57, 1.40, 1.94, 1.40, 1.18, 1.63, 1.26, 0.93, 2.22, 1.97, 1.74, 4.49, 4.33, 3.10)
input.df <- data.frame(x=x, y=y)


# Polynomal regression

# getting arguments for polynomal function [y = b0  + b1*x + b2*x^2] with lm():
# input: input.df
# output: arguments
polynomal.fit <- function(input.df){
polyn.fit <- lm(formula = input.df[,2] ~ input.df[,1] + I(input.df[,1]^2), data = input.df)
arguments <- list(b0 =polyn.fit$coefficients[[1]], 
                  b1 =polyn.fit$coefficients[[2]], 
                  b2 =polyn.fit$coefficients[[3]])
return(arguments)
}

# polynomial fit for stat_function()
fit.func <- function(x, b0, b1, b2)(b0  + b1*x + b2*x^2)

arguments <- polynomal.fit(input.df)

# plotting
ggplot(input.df, aes(x = input.df[,1], y = input.df[,2])) +
  geom_point(data =  input.df, aes(x = input.df[,1], y = input.df[,2])) +
  stat_function(fun = fit.func, args = arguments) # plot function with corresponding parameters

