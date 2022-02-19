# Data Visualization ----
#----------------------------------------------------------------------------#
# In this file, its goal is to create data visualization ... 
#----------------------------------------------------------------------------#
#----------------------------------------------------------------------------#
#
# The third-chart.R file will need to complete the following tasks:
#  -Load the data.
#  -draw the chart about `counties` data frame to find the county of smallest AQI.
#
#----------------------------------------------------------------------------#
#setwd("C:/Users/mobtn/Documents/_code/final-project-starter-XiyahC/data")

# # Install and load necessary packages
#install.packages("ggplot2")
library(ggplot2)
#install.packages("treemapify")
library(treemapify)
# Using the `ggplot()` function from the `ggplot2` package, work in `counties`data frame,
# Store the result in a variable.
A<-counties%>%
  filter(State=="Wyoming")
smallest_situation<-data.frame(A)

third_chart<-ggplot(smallest_situation, aes(area = ave_so2_aqi, fill = year, label = County)) +
  geom_treemap() +
  geom_treemap_text(colour = "black",
                    place = "centre",
                    size = 10)+ 
scale_fill_brewer(palette = "Blues")+
  labs(title = "Average SO2 AQI in Wyoming(2010-2016)")
#plot(third_chart)

##Purpose and Reason

#In the third chart, I used treemaps. By analyzing the first chart, we can easily 
#find the state with the least SO2 pollution. For the measurement of the data, we 
#must consider that not all counties are suitable for measurement. And not all counties
#will measure. Therefore, we took the relevant data for Wyoming (state) and wanted to 
#find out which of its counties had the least air pollution. This chart explains and 
#compares the average SO2 AQI values for several counties in Wyoming.