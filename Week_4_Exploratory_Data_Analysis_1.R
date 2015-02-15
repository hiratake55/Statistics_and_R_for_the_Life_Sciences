#======================================================================
# Week 4 Exploratory Data Analysis I
#======================================================================
load(url("http://courses.edx.org/c4x/HarvardX/PH525.1x/asset/skew.RData"))

# QUESTION 2.1
# Which column has positive skew (a long tail to the right)?
# QUESTION 2.2
# Which column has negative skew (a long tail to the left)?
par(mfrow = c(3,3))
for (i in 1:9) {
  qqnorm(dat[,i],main=i)
}
par(mfrow=c(1,1))

# QUESTION 3.1
# Which spray seems the most effective (has the lowest median)?
head(InsectSprays)
boxplot(InsectSprays$count ~ InsectSprays$spray)

