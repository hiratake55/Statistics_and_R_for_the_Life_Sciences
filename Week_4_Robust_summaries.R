#======================================================================
# Week 4 Robust summaries
#======================================================================
data(ChickWeight)
chick = reshape(ChickWeight,idvar=c("Chick","Diet"),timevar="Time",direction="wide")
chick = na.omit(chick)

ChickWeight[ChickWeight$Chick==,]

# QUESTION 2.1
# How much does the average of chick weights at day 4 increase if we add an outlier measurement of 3000 grams? 
mean(c(chick$weight.4, 3000))/mean(chick$weight.4)

# QUESTION 2.2
# Now let's see what happens when we use the median instead of the mean. 
median(c(chick$weight.4, 3000))/median(chick$weight.4)

# QUESTION 2.3
# How much does the standard deviation change?
sd(c(chick$weight.4, 3000))/sd(chick$weight.4)

# QUESTION 2.4
# Calculate the Pearson correlation of the weights of chicks from day 4 and day 21.
cor(c(chick$weight.4,3000), c(chick$weight.21,3000)) / cor(chick$weight.4, chick$weight.21)

# QUESTION 2.1
# What is the p-value from this test?
x<-subset(chick$weight.4,chick$Diet==1)
y<-subset(chick$weight.4,chick$Diet==4)
t.test(c(x,200),y)$p.value

# QUESTION 2.2
# What is the difference in t-test statistic (the statistic is obtained by t.test(x,y)$statistic) between adding 10 and adding 100 to all the values in the group 'y'? 
t.test(x,y+10)$statistic-t.test(x,y+100)$statistic

