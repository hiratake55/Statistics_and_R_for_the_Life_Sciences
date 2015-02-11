#======================================================================
# Week 1: R Programmming Skills
#======================================================================
tab = read.csv("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv")

# ACCESSING COLUMNS
# How many hours of total sleep are there for the first animal in the table?
tab$sleep_total[1]

# SUMMARY()
# What is the 3rd quartile of the total sleep of all the animals?
summary(tab$sleep_total)

# SUBSETTING/INDEXING
# What is the average total sleep, using the function mean() and vector subsetting, for the animals with total sleep greater than 18 hours?
mean(tab[ tab$sleep_total > 18, ]$sleep_total)

# WHICH()
# What is the row number of the animal which has more than 18 hours of total sleep and less than 3 hours of REM sleep?
rownames(tab[ tab$sleep_total > 18 & tab$sleep_rem <= 3, ])

# ORDER()
# What is the index of the animal (so the row number) with the least total sleep?
order(tab$sleep_total)[1]

# RANK()
# What's the rank of the animal in the first row of the table in terms of total sleep?
rank(tab$sleep_total)[1]

# TABLE()
# How many rodents (Rodentia) are in the table?
table(tab$order)

# USING FUNCTIONS ON A LIST FROM SPLIT()
# What is the mean hours of total sleep of the rodents?
s = split(tab$sleep_total, tab$order)
mean(s$Rodentia)

# LAPPLY(),SAPPLY(),TAPPLY() QUESTION
# What is the standard deviation of total hours of sleep for the Primates Order?
lapply(s, sd) # or just sd(s$Primates)
