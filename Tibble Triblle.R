install.packages("tidyverse")
library(tidyverse)


name = c("Nadal","Djokovic","Federer","Medvedev","Theim", 
         "Tsitsipas","Zverev","Berrettini","Bautista Agut","Monfils",
         "Barty","Pliskova","Halep","Osaka","Svitolina",   
         "Andreescu","Bencic","Kvitova","Williams","Bertens") 
rank = c(1:10,1:10) 
age  = c(33,32,38,23,26,21,22,23,31,33,          23,27,28,22,25,19,22,29,38,28)
height = c(1.85,1.88,1.85,1.98,1.85,1.93,1.98,1.96,1.83,1.93,  
           1.66,1.86,1.68,1.80,1.74,1.70,1.75,1.82,1.75,1.82) 
weight = c(85,77,85,83,79,89,90,95,75,85,      
           62,72,60,69,60,60,63,68,72,74) 
gender = c(rep("M",10),rep("F",10))
tennis = tibble(name,rank,age,height,weight)
print(tennis) 


nrow(tennis)
ncol(tennis) 
colnames(tennis) 
summary(tennis)
View(tennis)


ggplot(tennis, aes(y=height)) + geom_boxplot() 

ggplot(tennis, aes(x=gender, y=age)) + geom_boxplot() 




