# First comment to explain what this program is doing.
# Be expansive and describe it in great detail. This may seem trivial, but will become increasingly important as you create complex programs.
# Simple script to examine the distribution of the product of two uniform variables
# Make sure it is readable. Use complete sentences, not cryptic phrases.
# 25 January 2024
# EGD

# Preliminaries
library(ggplot2)
set.seed(100)
library(TeachingDemos) # use this to set the random number seed from a character string

char2seed("green tea")
char2seed("green tea",set=FALSE)
# important for reproducibility. Ensures the same nu,bers are pulled and regenerated. 

# Global variables
nRep <- 10000

# Create or read in data
ranVar1 <- rnorm(nRep)
# print(ranVar1)
head(ranVar1)
tail(ranVar1)
ranVar2 <- rnorm(nRep)


# visualize data
qplot(x=ranVar1)

# create product vector
ranProd <- ranVar1*ranVar2
length(ranProd)

## Some notes about keyboard shortcuts for scripts
# I'm typing code that I want to comment out and then using
# control shift c to comment it out
# Some other shortcuts: 
#   - ctl return -> run code
#   - ctl shift return -> runs whole script
      # - It runs and prints output for whole script
#   - ctl shift s -> runs whole script without printing