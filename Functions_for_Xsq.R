# Creation date: 2015-09-30
# Created by: HS
# Objective: Get relative risc and odds ratio from a 2x2 matrix; various functions that can be used in a 2x2 matrix
# Usage: 
# Input: 2x2 matrix
# Output: values of relative risc, odds ratio etc.
# Misc: should work fine

# example 2x2 matrix
# a = matrix(c(1012,2051,
#              8621,17520),
#            ncol = 2,
#            dimnames=list(c("Past_use_HRT","No_HRT"),c("Deceased", "alive")) )
# a

# in an epidemiological study, prospective study
# subjects are followed forward in time after exposure (or not) to a risk factor.
# the probability of an event among people exposed to some potential risk factor is compared to people who are not exposed.
# relative risc:
relat.risc <- function(a) {
  r.r <- (a[1,1]/(a[1,1]+a[1,2]))/(a[2,1]/(a[2,1]+a[2,2]))
  r.r                         
}
# relat.risc(a)

# odds ratio
# ratio of odds of exposure in studies to odds of exposure in controls
# can be used in prospective studies
# has to be used in case-control studies! (retropectively after the fact)
odds.ratio <- function(a){
  OR <- (a[1,1]*a[2,2])/(a[1,2]*a[2,1]) 
  OR
}
# odds.ratio(a)

#Chi square test with test whether there are at least n=5 expected frequency per cell 
Xsq <- function(a){
  xsq <- chisq.test(a)
  print(paste("Xsq:", round(xsq$statistic, digits = 4)))
  print(paste("P-value:", round(xsq$p.value, digits = 4)))
  print(paste("Are all expected frequencies at least 5:", all(xsq$expected >= 5) ))
}
# Xsq(a)

# absolute risc increase
# difference of the probability of an event with and without the treatment
# absolute.risc.reduction <- absolute.risc.increase 
absolute.risc.increase <- function(a){
  a.r.i <- abs((a[1,1]/(a[1,1]+a[1,2]))-(a[2,1]/(a[2,1]+a[2,2])))
  a.r.i
}
# absolute.risc.increase(a) 

# numbers needed to treat
# number that would have to be treated to have one additional event
number.needed.to.treat <- function(a){
  n.n.t.t <- 1/absolute.risc.increase(a)
  n.n.t.t
}
#  number.needed.to.treat(a) 
