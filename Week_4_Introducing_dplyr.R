#======================================================================
# Week 4 Introducing dplyr
#======================================================================
#install.packages("dplyr")
library("dplyr")

# QUESTION 1.1
# What is the median REM proportion of the order with the smallest median REM proportion?

msleep<-read.csv("https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv")

msleep %>%
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  group_by(order) %>%
  summarise(median_rem_proportion = median(rem_proportion)) %>%
  arrange(median_rem_proportion) %>% 
  head(1)
