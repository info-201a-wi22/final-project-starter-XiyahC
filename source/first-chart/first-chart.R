# Data Visualization ----
#----------------------------------------------------------------------------#
# In this file, its goal is to create data visualization ... 
#----------------------------------------------------------------------------#
#----------------------------------------------------------------------------#
#
# The first-chart.R file will need to complete the following tasks:
#  -Load the data.
#  -draw the chart about `states` data frame to compare SO2 and NO2 AQI.
#
#----------------------------------------------------------------------------#
setwd("~/final-project/final-project-starter-XiyahC/data")

# # Install and load necessary packages
install.packages("ggplot2")
library("ggplot2")
library("plotly")
# Using the `plot_ly()` function from the `plotly` package, pass in `states`data frame,
# Store the result in a variable.

first_chart<- plot_ly(
  data = states, 
  x = ~State, 
  y = ~ave_so2_aqi, 
  color = ~year, 
  type="bar"
)%>% 
layout(
  title = "Average SO2 AQI in Different Selected States in US(2010-2016)",
  xaxis = list(title = "States"),
  yaxis = list(title = "Average AQI",ticksuffix="parts per billion")
)
ggplotly(first_chart)
##Purpose and Reason

#In the first chart, I am using one bar chart. It tries to tell people the magnitude
#of the average AQI for SO2 air pollutants across all states in the US (2010-2016),
#and it reveals which states are the most polluted and the largest or smallest AQI values.

