#======================================================================
# Week 4 Exploratory Data Analysis II
#======================================================================
install.packages("UsingR")
library(UsingR)

# QUESTION 1.1
# Calculate the average of (scaled x values times scaled y values)
data(father.son)
x = father.son$fheight
y = father.son$sheight
n = nrow(father.son)
mean(scale(x) * scale(y))

# QUESTION 2.1
# What is the fastest time divided the median time?
data(nym.2002)
n = nrow(nym.2002)
time = sort(nym.2002$time)
min(time/median(time))

# QUESTION 2.2
# What is the slowest time divided the median time?
max(time/median(time))

# QUESTION 3.1
# When is it appropriate to use pie charts?
# => Never

# QUESTION 3.2
# The use of pseudo-3D plots in the literature mostly adds
# => Confusion

# QUESTION 3.3
# When is it appropirate to use a barplot
# => To compare percentages that add up to 100%




