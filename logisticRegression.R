# Logistic Regression R Script

# First, clear all previous stuff out of the workspace...
rm(list = ls());

# Input your dataset
mydata <- read.csv("Motor_Vehicle_Collisions_Crashes_log.csv",header=TRUE)

# Read the comma-delimited data file and put them into a variable called "dat." Make sure:
#     1) The first row contain the data labels
#     2) Numeric data fields only contain numbers


# Turn on output to a file (in addition to the screen). This way we've got a record of
# what we did.
#   append   = FALSE means overwrite the file if it already exists
#   split    = TRUE  means send the output to the console too!
sink("logRegressionOutput1.txt", append=FALSE, split=TRUE);


# Fit the model to the data by creating a formula and passing it to the glm function. 
# In our case we want to predict the survival of a passanger using his/her age
# so we make the model (Survived ~ age)
# In other words, we're representing the relationship between Age (x) and Survived (y).
# Becasue the dependent variable--Survived is a dummy, we choose to use logit model.
# Note: Formulas in R take the form (y ~ x). 
fit = glm(People_died ~ factor(Crashes_by_month) + factor(Crash_Time) + factor(BOROUGH) + factor(Ten_Most_Common_Factor) + Two_Factors
          + Three_Factors + Four_Factors + Five_Factors + factor(Ten_Most_Vehicle_Type) + Two_cars + Three_Cars
          + Four_Cars + Five_Cars, data = mydata, family=binomial(link = "logit"))


# Invoke the summary function on any model to see the results
# You've fit with glm and get some metrics indicating the quality of the fit
summary(fit)







# Regression diagnostic 1
# To make sure the model does not have multi-collinearity issue, we check the correlation between each two explanatory variables
# Caculate correlation matrix
correlation <- cor(mydata)
round(correlation, 2)

# Regression diagnostic 2
# To make sure the model does not have the issue of heteroscedasticity in the error term, we do the Breusch Pagan Test.
# With the logistic regression model, heteroscedasticity is automatically assumed to exist.


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
# The probability distribution of the error term is well specified. (This is not required by logistic regression models)

# Turn off output
sink();

