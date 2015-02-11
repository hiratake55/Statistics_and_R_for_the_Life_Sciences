#======================================================================
# Week 2: Probability Distributions I
#======================================================================
dat = read.csv("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv")

# QUESTION 1.1
# How many of the high fat mice weigh less than the mean of the control mice (chow)?
s = split(dat[,2], dat[,1])
sum(s$hf-mean(s$chow)<0)

# QUESTION 1.2
# How many of the control mice weigh more than the mean of the high fat mice?
sum(s$chow-mean(s$hf)>0)

# QUESTION 1.3
#What is the proportion of high fat diet mice over 30?
highfat = s[["hf"]]
sum(highfat > 30)/length(highfat)
