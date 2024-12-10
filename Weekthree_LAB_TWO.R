
install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(nycflights13)

df1=data.frame(ID= c(1,2,3),
               Name=c("Ram","Hari", "Geeta"))


df2=data.frame(ID= c(2,3,4),
               GPA=c(3.2,2.8,4.0))


#inner join concepts
#merge is used for base R

inner_join= merge(df1, df2,by="ID")
inner_join

#left join concepts

left_join= merge(df1, df2, by="ID",all.x = TRUE)
left_join

#right join concepts

right_join= merge(df1, df2, by="ID",all.y = TRUE)
right_join

#full join
full_join= merge(df1, df2, by="ID",all = TRUE)
full_join


# now after implementing dplyr and  tidyverse
inner= inner_join(df1, df2, by="ID")
inner

left =left_join(df1, df2, by="ID")
left

semi= semi_join(df1, df2, by="ID")
semi

anti= anti_join(df1, df2, by="ID")
anti

#
names(flights)
names(airlines)
names(airports)
names(planes)
View(flights)
View(airports)

#which airlines ahs the highest number of delayed departures?
delayed_flights = flights %>%
  
  # whole sequence on dplyr
  flights %>%  
  filter(dep_delay>0) %>%  
  group_by(carrier) %>%  
  summarise(num_delay=n()) %>%   
  left_join(airlines,by="carrier") %>%  
  filter(num_delay==max(num_delay)) %>%
  select(name)   

# which airport do flights arrive most early?
flights %>%  
  group_by(dest) %>%  
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>%   
  filter(mean_delay==min(mean_delay, na.rm=TRUE)) %>%  
  left_join(airports,by=c("dest"="faa")) %>% 
  select(name) 

#task one 



data = flights %>% 
  filter(origin == "JFK", dest == "SEA") %>%
  summarise(
    mean_arr_time = mean(air_time, na.rm = TRUE), # Average arrival time
    min_arr_time = min(air_time, na.rm = TRUE),  # Minimum arrival time
    max_arr_time = max(air_time, na.rm = TRUE)   # Maximum arrival time
  )

print(data)


# task two





speedy = flights %>%
  filter(!is.na(air_time), !is.na(distance)) %>% 
  mutate(avg_speed = distance / (air_time / 60)) %>% 
  group_by(dest) %>%                             
  summarise(avg_speed = mean(avg_speed, na.rm = TRUE)) %>% 
  arrange(desc(avg_speed))                     

print(speedy)


highestspeedcity=speedy %>% 
  slice(1)
print(highestspeedcity)


  

