# Comp bio 2024-02-1
# Script for evaluating atomic vectors

x <- 5 # preferred
y = 4 # legal but not used except in function defaults
y = y + 1.1
print(y)

y <- y + 1.1
print(y)

# Variable names
z <- 3 # begin with lower case. letter
plantHeight <- 10 # option "camelCaseFormatting"
plant.height <- 4.2 # acoid periods
plant_height <- 3.3 # optimal "snake_case_formatting"
. <- 5.5 # reserve this for a generic temporary variable (more later)
print(.) # this works but its not showing up in my environment. Kind of weird

# the combine function
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z)
is.numeric(z)


z <- c("This is only 'one' character string",'a second')
print(z)
typeof(z)
is.character(z)

z <- runif(5)
# optional attribute not initially assigned
print(z)
names(z)
names(z) <- c("chow","pug","beagle","greyhound","akita")
