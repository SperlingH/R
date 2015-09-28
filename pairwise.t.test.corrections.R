# Creation date: 2015-09-28
# Created by: HS
# Objective: Function for Bonferroni, Holm, and Holm-Sidak corrections if you have a data.frame with given t.value and DF (degree of freedom)
# Usage: Pairwise.t.test.corrections(input.data.frame)
# Input: Data.frame with t.value and DF
# Output: Data.frame with corrected p.values and boolean indicator wether conditions are met
# Misc: Needs further testing with different input data.frames


pairwise.t.test.corrections <- (results) {

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
