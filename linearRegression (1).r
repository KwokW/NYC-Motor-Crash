# Linear Regression R Script


# First, clear all previous stuff out of the workspace...
rm(list = ls());


# Import the dataset file
mydata <- read.csv("Motor_Vehicle_Collisions_Crashes.csv",header=TRUE)

sink("RegressionOutput.txt", append=FALSE, split=TRUE)


#  We fit the model with the dataset "mydata"
mfit <- lm(NUMBER_OF_PERSONS_KILLED ~ factor(Crash_Time) + factor(Crashes_by_month) + factor(BOROUGH) + factor(Ten_Most_Common_Factor) + Two_Factors
           + Three_Factors + Four_Factors + Five_Factors + factor(Ten_Most_Vehicle_Type) + Two_cars + Three_Cars + Four_Cars + Five_Cars, data = mydata)


# Again, invoke the summary function
summary(mfit)



# Regression diagnostic 1
# To make sure the model does not have multi-collinearity issue, we check the correlation between each two explanatory variables
# Caculate correlation matrix
correlation <- cor(mydata)
round(correlation, 2)

# Regression diagnostic 2
# To make sure the model does not have the issue of heteroscedasticity in the error term, we do the Breusch Pagan Test.
if (!require("lmtest")) { install.packages("lmtest")
  require("lmtest") }
bptest(mfit)


# Regression diagnostic 3
# The data is not time-series, so concern about autocorrelation is minimal


# Regression diagnostic 4
# Model specification errors?
# The model does not exclude any "core" variables.
# The model does not include superfluous variables.
# The functional form of the model is suitably chosen.
# There are no errors of measurement in the regressand and regressors.
# Outliers in the data, if any, are taken into account.
summary(mydata)
# The probability distribution of the error term is well specified.
if (!require("nortest")) { install.packages("nortest")
  require("nortest") }
res=residuals(mfit)
ad.test(res)$p.value

# Turn off output
sink();



