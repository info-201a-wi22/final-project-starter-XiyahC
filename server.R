#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("ggplot2")
library("tidyverse")

# Define server logic required to draw a histogram
my_server <- function(input, output, session){
  # Wrangle Data for chart_2 Input
  
  uspollution <- read.csv("data/uspollution_pollution_us_2010_2016.csv", stringsAsFactors = FALSE)
  uspollution <-  mutate(uspollution, year = c(str_sub(uspollution$Date.Local, 1, 4)))
  uspollution <- mutate(
    uspollution,
    state_county = paste(County, State, sep = ",")
  )
  
  counties_ave <- uspollution %>%
    group_by(year, State, County, SO2.Units) %>%
    summarise(ave_so2_aqi = mean(SO2.AQI, na.rm = TRUE))
  
  Ohio_situation <- counties_ave %>%
    filter(State == "Ohio")
  
  output$second_chart_ggplot <- renderPlot({
    req(input$select_county)
    if (identical(input$select_county, "")) return(NULL)
    ggplot(data = filter(Ohio_situation, County %in% input$select_county)) +
      geom_point(aes(x = year, y = ave_so2_aqi, color = County %in% input$select_county)) +
      guides(color = guide_legend(title = "County"))+
      scale_color_discrete(labels = input$select_county)+
      labs(
        x = "Year",
        y = "Average SO2 AQI",
        title = "Average SO2 AQI in Ohio(2010-2016)")
    
    
    
})
    
}
