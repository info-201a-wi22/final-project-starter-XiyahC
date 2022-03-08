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
#install.packages("plotly")
library("plotly")
# Using the `plot_ly()` function from the `ggplot2` package, work in `counties`data frame,
# Store the result in a variable.
smallest_situation<-counties%>%
  filter(State=="Wyoming")
third_chart <- plot_ly(smallest_situation, 
                       x = ~year, 
                       y = ~ave_so2_aqi, 
                       color = ~County) 
third_chart <- third_chart %>% add_lines()
third_chart <-third_chart %>% layout(title = 'Average SO2 AQI in Wyoming(2010-2016)')
#ggplotly(third_chart)

##Purpose and Reason

#In the third chart, I used the line chart. By analyzing the first chart, we can easily 
#find the state with the least SO2 pollution. For the measurement of the data, we 
#must consider that not all counties are suitable for measurement. And not all counties
#will measure. Therefore, we took the relevant data for Wyoming (state) and wanted to 
#find out which of its counties had the least air pollution. This chart explains and 
#compares the average SO2 AQI values for several counties in Wyoming.