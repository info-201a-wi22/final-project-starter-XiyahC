# Data Visualization ----
#----------------------------------------------------------------------------#
# In this file, its goal is to create data visualization ... 
#----------------------------------------------------------------------------#
#----------------------------------------------------------------------------#
#
# The second-chart.R file will need to complete the following tasks:
#  -Load the data.
#  -draw the chart about `counties` data frame to find the county of hightest AQI.
#
#----------------------------------------------------------------------------#
setwd("~/final-project/final-project-starter-XiyahC/data")

# # Install and load necessary packages
install.packages("ggplot2")
library(ggplot2)

# Using the `ggplot()` function from the `ggplot2` package, work in `counties`data frame,
# Store the result in a variable.
situation<-counties%>%
  filter(State=="Ohio")
Ohio_situation<-data.frame(situation)
second_chart<-ggplot(Ohio_situation,aes(x = year, y = ave_so2_aqi, color = County)) +
  geom_point()+
  guides(color = guide_legend(title = "County"))+
  scale_color_discrete(labels = c("Cuyahoga", "Hamilton", "Medina"))+
  labs(
    x = "Year",
    y = "Average SO2 AQI",
    title = "Average SO2 AQI in Ohio(2010-2016)")
plot(second_chart)

##Purpose and Reason
#In the second chart, I used a scatter plot. By analyzing the first chart, we can 
#easily find the state with the most SO2 pollution. Therefore, the purpose of this
#chart is to find out which county in Ohio have the most air pollution. It explains 
#the numerical size of the average SO2 AQI for several counties in Ohio.