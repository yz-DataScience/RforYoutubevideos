#ifelse()
#in creating a dummy variable,a categorical variable
data(mtcars) #access the data
View(mtcars)
dim(mtcars) #number of obs. and number of variable
#create a dummy variable from mpg, 1 denoting high mpg; 0 denoting low mpg
summary(mtcars$mpg) #summary statistics of mpg
mtcars$mpg_dummy=ifelse(mtcars$mpg>19.2,1,0)
names(mtcars) #check the variables in the data
table(mtcars$mpg_dummy) #a frequency table
#creat a categorical variable, high/low
mtcars$mpg_cat=ifelse(mtcars$mpg>19.2,"high","low")
table(mtcars$mpg_cat)

#create a categorical variable, high/mid/low
mtcars$mpg_3cat=ifelse(mtcars$mpg>22.8,"high",
                       ifelse(mtcars$mpg<15.43,"low","mid"))
table(mtcars$mpg_3cat)


