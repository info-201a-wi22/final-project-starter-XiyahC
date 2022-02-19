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
#setwd("C:/Users/mobtn/Documents/_code/final-project-starter-XiyahC/data")

# # Install and load necessary packages
#install.packages("ggplot2")
library("ggplot2")
library("plotly", warn.conflicts = FALSE)
# Using the `plot_ly()` function from the `plotly` package, pass in `states`data frame,
# Store the result in a variable.

states_2016 <- states %>%
  filter(year=="2016")

View(states_2016)

first_chart<- plot_ly(
  data = states_2016, 
  x = ~State, 
  y = ~ave_so2_aqi, 
  #color = ~year, 
  type="bar"
)%>% 
  layout(
    title = "Average SO2 AQI in Different Selected States in US (2016)",
    xaxis = list(title = "States"),
    yaxis = list(title = "Average AQI",ticksuffix="parts per billion")
)

#ggplotly(first_chart)
##Purpose and Reason

#In the first chart, I am using one bar chart. It tries to tell people the magnitude
#of the average AQI for SO2 air pollutants across all states in the US (2016),
#and it reveals which states are the most polluted and the largest or smallest AQI values.

# The first chart is visualizing the states with the highest pollution of so2 pollutants using a bar chart. 
# The state with the highest average so2 AQI being Ohio. The lowest being North Dakota. 
