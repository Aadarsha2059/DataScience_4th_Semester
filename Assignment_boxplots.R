library(tidyverse)
library(readr)
library(ggplot2)

mydata = read_csv("census.csv")
mydata 


# this diagram depicts the presence of male on the respective census report. Here, we reported the presence of 
#outliers in the univariate boxplot 
#box plot 
ggplot(mydata, aes(y = `Total Male`)) + 
  geom_boxplot()



#Univariate box plot using color combination

boxplot(mydata$`Total population`,
        main = "Univariate Boxplot of Total Population",
        ylab = "Total Population",
        col = "lightblue",
        border = "blue",
        notch = TRUE)



# this diagram reveals the population variation on the given districts. We noticed the variation on side by side 
#boxplots according to the size of population

#next box plot

ggplot(mydata, aes(x = District, y = `Total population`)) + 
  geom_boxplot()



#side by side box plot
ggplot(mydata, aes(x = District, y = `Total population`, fill = District)) +
  geom_boxplot() +
  labs(title = "Bivariate Box Plot of Total Population by District", 
       x = "District", y = "Total Population") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))










