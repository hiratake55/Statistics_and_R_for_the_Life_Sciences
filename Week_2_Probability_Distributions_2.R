#======================================================================
# Week 2: Probability Distributions II
#======================================================================
library(devtools)
install_github("jennybc/gapminder")
library(gapminder)

data(gapminder)
head(gapminder)

# QUESTION 1.1  
# What is the proportion of countries in 1952 that have a life expectancy less than or equal to 40?
g1952 <- gapminder[gapminder$year==1952,]
mean(g1952$lifeExp<=40)

# QUESTION 1.2
# What is the proportion of countries in 1952 that have a life expectancy between 40 and 60 years?
mean(g1952$lifeExp<=60) - mean(g1952$lifeExp<=40)

# QUESTION 2.1
# What is the standard deviation of the log10 of population size of the countries in 1952?
sd(log10(g1952$pop))

# QUESTION 2.2
# What is the z-score of the country with the largest population size?
x <- log10(g1952$pop)
z <- (x-mean(x))/sd(x)
qqnorm(z)
abline(0,1)
max(z)

# QUESTION 2.3
# Finally, using the Normal approximation, estimate the number of countries that should have a log10 1952 population between 6 and 7 (i.e., between 1 million and 10 million people)?
F = function(q) pnorm(q, mean=mean(x), sd=sd(x))
n = length(x)
(F(7)-F(6))*n

# QUESTION 2.4
# What is the quantile of the standard normal distribution which matches to the smallest number in x (the first element of sort(x))?
ps = ((1:n) - 0.5)/n
qnorm(ps[1])

