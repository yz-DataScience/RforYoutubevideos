#create a subset data 
data("mtcars") # access to the data
names(mtcars)
?mtcars
View(mtcars)
#subset()
summary(mtcars$mpg)
#create a subset dataset based on mpg>20
mtcars_mpg20=subset(mtcars,mpg>20)
summary(mtcars_mpg20$mpg)
#create a dataset based on mpg>20 using dplyr::filter
install.packages("dplyr")
library(dplyr)
#pipe %>% 
mtcars %>% filter(mpg>20)->mtcars_20mpg
summary(mtcars_20mpg$mpg)
