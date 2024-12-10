install.packages("nycflights13")
library(tidyverse)
library(dplyr)
library(nycflights13)

data(package="nycflights13")
View(flights)
dim(flights)
names(flights)
select(flights,year,month,day)
select(flights, year:day)
select(flights,ends_with("delay"))
select(flights,contains("arr"))
select(flights, matches(".*_.*_.*"))  
dim(distinct(flights))

sat = pull(flights,sched_arr_time) 
typeof(sat) 
summary(sat)


mutate(flights, gain=arr_delay-dep_delay, speed=distance/(air_time/60)) 
dim(flights)


transmute(flights, gain=arr_delay-dep_delay, gain_per_hour=gain /(air_time/60)) 
transmute(flights, distance_residual=distance-mean(distance)) 


#Task Question

filter(flights,dep_time<=2400,600>=dep_time) 
#filter(flights,dep_time=2400 | 600>=dep_time) | = OR
filter(flights,arr_delay>=120)
filter(flights,dest=="IAH" | dest=="HOU")
View(airlines)
filter(flights,carrier=="UA" , carrier=="AA" | carrier == "DL")
filter(flights,arr_delay>120, dep_delay<=0)
filter(flights,dep_delay>=60,dep_delay-arr_delay >= 30)



