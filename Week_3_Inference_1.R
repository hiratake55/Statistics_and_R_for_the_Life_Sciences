#======================================================================
# Week 3 Inference I
#======================================================================
babies = read.table("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt", header=TRUE)
bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

# QUESTION 1.1
# What is the t-value (t-statistic)?
bwt.nonsmoke30<-bwt.nonsmoke[1:30]
bwt.smoke30<-bwt.smoke[1:30]
t.test(bwt.nonsmoke30, bwt.smoke30)$statistic

# QUESTION 1.2
# Because of the symmetry of the standard normal distribution, there is a simpler way to calculate the probability that a t-value under the null could have a larger absolute value than tval. Choose the simplified calculation from the following:
# pval = 1- pnorm(abs(tval)) + pnorm(-abs(tval))
# 
# => 2*pnorm(-abs(tval))

# QUESTION 1.3
# Which of the following sentences about a Type I error is NOT true?
# => The probability of making a Type I error is equal to the probability that the null hypothesis is true
