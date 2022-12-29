# NYC-Motor-Crash

I want to discuss which factors will lead to higher risk of death from motor vehicle crash and why.
The dataset we are going to use is Motor Vehicle Collisions - Crashes from NYC open data. This dataset is provided by NYPD and anyone can have access to this dataset 
via the NYC open data website. This dataset include every crash starting for 7/2012 to present. This dataset is very informative as it includes over 1M entries. 
Each representing an accident in which an injury or death occured and up to date, since it is updated weekly.It includes informations about the crash location, 
causes(direct and indirect), and other relevant data. Lastly, the dataset is stored in Excel.

I will use linear regression and logistic regression to answer this question because we are trying to find the correlation between the variables. So we can find out which
variable is statistically significant to cause death in a motor vehicle crash. 

we believe that the question we’re asking here is interesting because identifying the direct causes for motor vehicle crash can help us raise awareness by addressing 
the issue, we find it very important to minimize the gap between the current safety measurements and the causes of these incedents. So that we can reduce the chances of 
having an accident due to one of them by finding alternative measures or by using our data analysis to help people make more informative choices that would hopefully keep
them safe in the future.

# Variables
For the crash time, I categorical them into 5 variables which are other, midnight, school end time, traffic hours, and lunch hours. I also cut the vehicle type and contributing factor to the most common 10 to run the regression model.
