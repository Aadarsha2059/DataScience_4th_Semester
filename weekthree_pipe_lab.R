library(gapminder)
library(tidyverse)
library(dplyr)
data(package="gapminder")

names(gapminder)

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point(aes(colour=continent)) +
  scale_x_log10()

#Task one
A = filter(gapminder, continent=="Europe", year==2007) 
B = select(A,-continent,-year) 
ggplot(B,aes(x=gdpPercap,y=lifeExp, size=pop)) +   
  geom_point(alpha=2)


#Task two
ggplot(select(filter(gapminder, continent=="Europe", year==2007), 
              -continent,-year),aes(x=gdpPercap,y=lifeExp, size=pop)) + 
  geom_point(alpha=0.5)


#Pipes
gapminder %>% 
  filter(continent=="Europe",year==2007) %>% 
  select(-continent,-year) %>%  
  ggplot(aes(x=gdpPercap,y=lifeExp, size=pop)) +    
  geom_point(alpha=0.5) 
  

# filter
gapminder %>% 
  filter(year==1952) %>%
  summarise(num_countries=n_distinct(country),
            mean_pop=mean(pop)) 

#group by
gapminder %>% 
  group_by(year) %>% 
  summarise(num_countries=n_distinct(country), mean_pop=mean(pop)) 




#line chart 
gapminder %>% group_by(year) %>% summarise(num_countries=n_distinct(country), mean_pop=mean(pop)) %>% ggplot(aes(x=year,y=mean_pop)) + geom_line() 


#starwars
starwars %>% 
  filter(species=="Droid")

starwars %>% 
  filter(desc(mass))

#mean mass of each
starwars %>% 
  group_by((species)) %>% 
  summarise(num_species=n_distinct(species), mean_mass=mean(mass)) 




