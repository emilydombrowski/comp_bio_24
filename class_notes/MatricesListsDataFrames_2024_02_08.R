# Matrices, Lists, and Data Frames
# 2024-02-08
  # added updates 2024-02-12
# EGD

# a matric is an atomic vector that is organized into rows and columns
# take vector and put it into two dimensional figure!

my_vec <- 1:12

m <- matrix(data=my_vec,nrow=4)
# we have to specify the number of rows or columns
# if we do a different number of rows (7 for example) R will throw out an error
print(m)

m <- matrix(data=my_vec, ncol=3)
print(m)

m <- matrix(data=my_vec, ncol=3, byrow=TRUE)
# transposes matrix
print(m)

my_m_data <- c(1,2,3,
               4,5,6,
               7,8,9)
my_new_matrix <- matrix(data=my_m_data, nrow=3, byrow=TRUE)
print(my_new_matrix)

# Lists
# Lists are like atomic vectors, but each element
# can hold things of different types and different sizes

mylist <- list(1:10, matrix(1:8,nrow=4,byrow=TRUE), letters[1:3], pi)
# list containing sequece, matrix, character string, and constant in R
str(mylist) # structure of the list
# list of four items, with eome integers, characters, numeric
print(mylist)

mylist[4]
# gives us a single item which is of the type list. Can't work with it!
mylist[4] - 3
# operation doesn't work because non numeric argument ot bianary operator. 
# list items can't work like this

mylist[[4]]
# double bracket structure gives list items themselves
mylist[[4]] - 3
# this returns the result of an operation rather than an error message

mylist[[2]]
# we can treat this as if its a named object of this type

mylist[[2]][4,1]
# indexes and subsets list in the familiar way once we call elements

mylist2 <- list(Tester=FALSE,littleM=matrix(1:9,nrow=3))
mylist2$littleM[2,3]
mylist2$littleM

mylist2$littleM
mylist2$littleM[2,] # gives us second row of matrix
mylist2$littleM[2]
mylist2$littleM[5]

# The "unlist" strings everything back into
# a single atomic vector; coercion is used if there are mixed data types
unRolled <- unlist(mylist2)
print(unRolled)

library(ggplot2) # call library

# create two variables
yVar <- runif(10)
xVar <- runif(10)

# referencing linear model in R
# format: y variable ~ x variable (predictor variable)
myModel <- lm(yVar~xVar)
qplot(x=xVar,y=yVar) # need ggplot for this function

print(myModel)
print(summary(myModel))

str(summary(myModel))
summary(myModel)$coefficients # shows one of the named components of the list...pulls out only one part of the summary
summary(myModel)$coefficients["xVar","Pr(>|t|)"] # using the rowname 
# call using a character string
summary(myModel)$coefficients[2,4]

u <- unlist(summary(myModel))
print(u)
# atomic vector

mySlope <- u$coefficients2
myPval <- u$coefficients8

# a data frame is a list of equal-lengthed atomic vectors, each of which is a column

# Data Frame
varA <- 1:12
varB <- rep(c("Con","LowN","HighN"),each=4)
varC <- runif(12)
dFrame <- data.frame(varA, varB, varC, stringsAsFactors = FALSE)
print(dFrame)
str(dFrame)
head(dFrame)
# unnamed list of numbers that R refers to as 'row names'

# add another row with rbind
# make sure you add a list, with each item corresponding to a column
newData <- list(varA=13, varB="Height", varC=0.668)
print(newData)
str(newData)

dFrame <- rbind(dFrame, newData)
str(dFrame)
tail(dFrame)

newVar <- runif(13)
dFrame <- cbind(newVar, dFrame)
head(dFrame)
# column bind instead of r bind
# list components can be joined this way

# create a matrix and data frame with same structures
zMat <- matrix(data=1:30,ncol=3,byrow=TRUE)
zDframe <- as.data.frame(zMat) # coerce it

str(zMat)    # an atomic vector with 2 dimensions
str(zDframe) # note horizontal layout of variables!
# without column names, R assigns arbitrary column names

head(zDframe)
head(zMat)


# element referencing is the same in both
zMat[3,3]
zDframe[3,3]

# so is column referencing
zMat[,3] # all of the rows, but only third column
zDframe[,3]
zDframe$V3 # note use of $ and named variable column
# and row referencing
zMat[3,]
zDframe[3,] # note variable names and row number shown

zMat[2] # takes the second element of atomic vector (column fill)
zDframe[2] # takes the second atomic vector (= column) from data
zDframe["V2"] 
zDframe$V2

# Eliminating missing values
# use complete.cases with atomic vector
print(zD)

complete.cases(zD)

zD[complete.cases(zD)] # clean them out

which(!complete.cases(zD)) # find NA slots

# use with a matrix

m <- matrix(1:20,nrow=5)
m[1,1] <- NA
m[5,4] <- NA
print(m)

m[complete.cases(m),] 

# now get complete cases for only certain columns!
m[complete.cases(m[,c(1,2)]),] # drops row 1
m[complete.cases(m[,c(2,3)]),] # no drops
m[complete.cases(m[,c(3,4)]),] # drops row 4
m[complete.cases(m[,c(1,4)]),] # drops 1&4
