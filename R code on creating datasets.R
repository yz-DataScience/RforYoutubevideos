#two ways to prepare a dataset in R

#1. type the variables and the data in

#define the variables
x=1:10
y=c(2,3,5,8,10,12,13,16,18,20)
#create a data frame
data=data.frame(x,y)
#check the dataset
View(data)
#check the variables in the data
names(data)
#scatterplot
plot(x,y)
#fit a simple linear regression model
model1=lm(y~x)
#add the fitted model line into the scatterplot
abline(model1)

#2. import a dataset from other sources (.csv; excel; sas; spss)

#import a dataset from csv
birds <- read.csv("~/Downloads/birds.csv")
#check variables in the dataset
names(birds)
#check the first 6 rows of data
head(birds)
#scatter plot
plot(birds$nVisitsNestling,birds$futureBehavior)
#fit SLR
model2=lm(futureBehavior~nVisitsNestling,data=birds)
abline(model2)
model3=lm(birds$futureBehavior~birds$nVisitsNestling)
model2
model3
#model2 and model 3 are the same.