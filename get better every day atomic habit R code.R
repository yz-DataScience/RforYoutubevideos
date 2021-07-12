##you get better 1% each day for a year
##you get worse 1% each day for a year
##prepare data

#get better each day
m=NULL
for (i in 1:365){
m[1]=1
m[i+1]=m[i]*1.01
}

#get worse each day
n=NULL
for (i in 1:365){
  n[1]=1
  n[i+1]=n[i]*0.99
}
##get better named 1
better_data=cbind(1,m)
##get worse named 0
worse_data=cbind(0,n)

#create a data frame named as habit_data
habit_data=data.frame(0:365,rbind(better_data,worse_data))
#change the colnames
colnames(habit_data)=c("days","habit","results")
##by now, the full data is prepared and ready to go##

##visualization
##how to combine dplyr with ggplot2
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

#draw a graph on the getting better?
habit_data %>% 
  filter(habit==1) %>% 
  ggplot(.,aes(x=days,y=results))+
  geom_point()

##get better and get worse on the same picture
##change numeric values of habit to a categorical
habit_data$habit=ifelse(habit_data$habit==1,"better","worse")
ggplot(habit_data,aes(x=days,y=results,color=habit))+
  geom_point()

###more challenge
##add the ending values to the graph
install.packages("ggrepel")
library(ggrepel)
#create the ending values
habit_data %>% 
  group_by(habit) %>% 
  top_n(1,days)->data_ends
data_ends$results=round(data_ends$results,2)

#name the original graph as g
ggplot(habit_data,aes(x=days,y=results,color=habit))+
  geom_point()->g
##add the lable to graph g, change the picture theme by adding theme_classic()
g+geom_text_repel(aes(label=results),
                  data=data_ends,
                  size=3)+
  theme_classic()
  
