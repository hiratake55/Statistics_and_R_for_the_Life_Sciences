#======================================================================
# Week 3 Inference II
#======================================================================
babies = read.table("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt", header=TRUE)
bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

# QUESTION 1.1
# What is the average length of the confidence interval?
N=30
conf.int<-function(){
  sample.bwt.nonsmoke <- sample(bwt.nonsmoke,N)
  sample.bwt.smoke <- sample(bwt.smoke,N)
  bwt.test <- t.test(sample.bwt.nonsmoke,sample.bwt.smoke)
  return (bwt.test$conf.int[2] - bwt.test$conf.int[1])
}
mean(replicate(1000, conf.int()))

# QUESTION 1.2
# How often (what proportion of times) did the confidence intervals contain the population-level difference? 
popdiff = mean(bwt.nonsmoke) - mean(bwt.smoke)
N=30
diff.compare<-function(){
  sample.bwt.nonsmoke <- sample(bwt.nonsmoke,N)
  sample.bwt.smoke <- sample(bwt.smoke,N)
  bwt.test <- t.test(sample.bwt.nonsmoke,sample.bwt.smoke)
  return (popdiff>bwt.test$conf.int[1] & popdiff<bwt.test$conf.int[2])
}
mean(replicate(1000, diff.compare()))

# QUESTION 1.3
# the difference in means (X.ns - X.s) must have absolute value greater than _____ times sd.diff in order for the result to be significant (at alpha=0.05).


# QUESTION 1.4  
# the difference in means (X.ns - X.s) must be a greater distance than _____ times sd.diff away from 0 in order for the 95% confidence interval not to contain 0.

# QUESTION 3.1
# What is the power at alpha=0.1?
N=15
reject <- function(N,alpha){
  sample.bwt.nonsmoke <- sample(bwt.nonsmoke,N)
  sample.bwt.smoke <- sample(bwt.smoke,N)
  pval <- t.test(sample.bwt.nonsmoke,sample.bwt.smoke)$p.value
  ifelse(pval < alpha,1,0)
}
mean(replicate(1000,reject(N,0.1)))

# QUESTION 3.2
# What is the power at alpha=0.05?
mean(replicate(1000,reject(N,0.05)))

# QUESTION 3.3
# What is the power at alpha=0.01?
mean(replicate(1000,reject(N,0.01)))

# QUESTION 3.4
# What is the expected number of student responses that would be marked wrong simply by chance?


# QUESTION 2.1
# What is the X-squared statistic?
d = read.csv("https://courses.edx.org/c4x/HarvardX/PH525.1x/asset/assoctest.csv")
d.table <- table(d)
chisq.test(d.table)$statistic

# QUESTION 2.2
# What is the p-value?
fisher.test(d.table)$p.value


