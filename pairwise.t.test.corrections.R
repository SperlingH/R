# Creation date: 2015-09-28
# Created by: 
#    HS
# Objective: 
#    Function for Bonferroni, Holm, and Holm-Sidak corrections if you have a data.frame with given t.value and DF (degree of freedom)
# Usage: 
#    Pairwise.t.test.corrections(input.data.frame)
# Input: 
#    Data.frame with t.value and DF
#   results$t.value
#   results$DF
# Output: 
#   Data.frame with corrected p.values and boolean indicator wether conditions are met
# Misc: 
#    Needs further testing with different input data.frames

pairwise.t.test.corrections <- function(results) {
  results <- results[rowSums(is.na(results)) == 0,] # remove all rows with NAs
  # 1. order the t-values, highest first; position = "j"
  results.ordered <- results[with(results, order(-t.value)), ]
  results.ordered$j <- c(1:nrow(results.ordered)) # get position number
  results.ordered$p.value <- pt(-abs(results.ordered$t.value), results.ordered$DF) # get p-values from t-values and degree of freedom

  # Bonferroni correction: alpha_T/k
  results.ordered$p.bonferroni <- 0.05/nrow(results.ordered)
  results.ordered$P.crit.bonf  <- results.ordered$p.value < results.ordered$p.bonferroni

  # Holm correction
  results.ordered$p.holm <-(0.05/(nrow(results.ordered)-results.ordered$j+1)) # alpha.t = 0.05 is the likelihood of a Type I or alpha Error 
  results.ordered$p.holm <- results.ordered$p.value < results.ordered$p.holm

  # holm-sidak
  results.ordered$p.holm.sidak <-(1-(1- 0.05)^(1/(nrow(results.ordered)-results.ordered$j+1))) # alpha.t = 0.05 is the likelihood of a Type I or alpha Error 
  results.ordered$P.crit.holm.sidak  <- results.ordered$p.value < results.ordered$p.holm.sidak
  return(results.ordered)
}

# Example data
x <- data.frame(group=c("Control", "Low","Medium","High"), mean=c(68,65,54,45), sd=c(6,8,11,16), n=c(40,40,40,40) )
n <- nrow(x)
# print(paste("row vs. row # t-value df"))
# create empty data.frame
s.2 <- (1/nrow(x))*(sum(x$sd^2))  #s^2_wit computed from all SD
results <- data.frame( comparison = "" , t.value = NA , DF = NA) # for Holm-sidak-correction
for (i in 1:(n-1)){
  for (j in (i+1):n){
    t <- (x$mean[i] - x$mean[j])/(sqrt((s.2/x$n[i])+(s.2/x$n[j]))) 
    v <- sum(x$n-1) # m*(n-1) # m tests with n values
    #print(paste(x$group[i]," vs.", x$group[j], " --> ",t,v))
    # for Holm-sidak-correction:
    new.row <- data.frame( comparison = paste(x$group[i]," vs.", x$group[j]), t.value = abs(t), DF = v)
    results <- rbind(results, new.row) 
  }
}
results

pairwise.t.test.corrections(results)
