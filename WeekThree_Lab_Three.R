library(tidyverse) 
library(rvest)  #extracts data from web pages, navigates web contents (parsing html/xml documents)
library(stringr) #string manupulation  or transformations , pattern matching, string splitting
library(tidyr) # data cleaning
library(lubridate)  # used for data and time , converts string into data and time objects , peforms arithmetic operations on dates, handles time zones, extract components like day year &time
library(readr)

url = "http://espn.go.com/nfl/superbowl/history/winners" 
page = read_html(url) 
page


sb_table = html_nodes(page, 'table') 
sb = html_table(sb_table)[[1]] 
sb 



sb = sb[c(-1,-2),]  # last comma indicates the removal of rows
names(sb) = c("number", "date", "site", "result") 
sb = as_tibble(sb)
sb 


mutate(sb,number=1:nrow(sb)) 


mutate(sb,date=mdy(date)) 

#splitting the columns

separate(sb,site,c("stadium","city",NA),sep='[()]') 

separate(sb,result,c("winner","loser"),sep=', ') 


 
pattern = ' \\d+$' # denotes space, digits from 0 to 9, $ means combinations 

separate(sb,result,c("winner","loser"),sep=', ') %>%
  mutate(winnerscore=as.numeric(str_extract(winner,pattern)))%>%
 mutate(winner=gsub(pattern,"",winner)) # gsub removes the  future error that may arrive in future in empty space


#pipelining
pattern = ' \\d+$' 
sb %>% 
  mutate(number=1:nrow(sb)) %>% 
  mutate(date=mdy(date)) %>% 
  separate(site,c("stadium","city",NA),sep='[()]') %>%
  separate(result,c("winner","loser"),sep=', ') %>%
  mutate(winnerscore=as.numeric(str_extract(winner,pattern))) %>% 
  mutate(winner=gsub(pattern,"",winner)) 

 #losers score and winner losers difference pattern

# Pipe 
pattern = ' \\d+$' 
sb %>% 
  mutate(number=1:nrow(sb)) %>% 
  mutate(date=mdy(date)) %>% 
  separate(site,c("stadium","city",NA),sep='[()]') %>% 
  separate(result,c("winner","loser"),sep=', ') %>% 
  mutate(winnerscore=as.numeric(str_extract(winner,pattern))) %>% 
  mutate(winner=gsub(pattern,"",winner)) %>% 
  mutate(loserscore=as.numeric(str_extract(loser,pattern))) %>% 
  mutate(loser=gsub(pattern,"",loser)) %>% 
  ggplot(aes(x=date , y= (winnerscore - loserscore)))+
  geom_point()


url = "https://en.wikipedia.org/wiki/AFI%27s_100_Years...100_Movies" 
pagemovie = read_html(url) 
pagemovie

sb_table = html_nodes(pagemovie, 'table') 
sb = html_table(sb_table)[[1]] 
sb 
