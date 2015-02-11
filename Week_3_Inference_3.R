#======================================================================
# Week 3 Inference III
#======================================================================
babies = read.table("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt", header=TRUE)
bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

# QUESTION 1.1
# How often (what proportion of simulations) is the sample variance greater than 1.5 times the population variance?
pop.var = var(bwt.nonsmoke)
vars = replicate(1000, var(sample(bwt.nonsmoke,10)))
mean(vars > pop.var*1.5)

# QUESTION 1.2
# Now use a sample size of 50. How often (what proportion) is the sample variance larger than 1.5 times the population variance?
vars = replicate(1000, var(sample(bwt.nonsmoke,50)))
mean(vars > pop.var*1.5)

# QUESTION 2.1
# What is the p-value for the two groups of 50 defined above?
set.seed(0)
N=50
smokers <- sample(babies$bwt[babies$smoke==1],N)
nonsmokers <- sample(babies$bwt[babies$smoke==0],N)
obs <- mean(smokers)-mean(nonsmokers)

avgdiff <- replicate(1000, {
  all <- sample(c(smokers,nonsmokers))
  smokersstar <- all[1:N]
  nonsmokersstar <- all[(N+1):(2*N)]
  return(mean(smokersstar) - mean(nonsmokersstar))
})
mean(abs(avgdiff) > abs(obs))


