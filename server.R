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
library("plotly")
library("DT")

# Define server logic required to draw a histogram
my_server <- function(input, output, session){
  
  #----------------------------------------------------------------------------#
  # data input
  #----------------------------------------------------------------------------#
  uspollution <- read.csv("data/uspollution_pollution_us_2010_2016.csv", stringsAsFactors = FALSE)
  uspollution <-  mutate(uspollution, year = c(str_sub(uspollution$Date.Local, 1, 4)))
  uspollution <- mutate(
    uspollution,
    state_county = paste(County, State, sep = ",")
  )
  
  #----------------------------------------------------------------------------#
  # Wrangle Data for chart_1 Input
  #----------------------------------------------------------------------------#
  states_ave <- uspollution %>%
    group_by(year,State,NO2.Units,O3.Units,SO2.Units,CO.Units) %>%
    summarise(ave_no2_mean=mean(NO2.Mean,na.rm=TRUE), ave_no2_max_val=mean(NO2.1st.Max.Value,na.rm=TRUE), ave_no2_aqi=mean(NO2.AQI,na.rm=TRUE),
              ave_o3_mean=mean(O3.Mean,na.rm=TRUE), ave_o3_max_val=mean(O3.1st.Max.Value,na.rm=TRUE), ave_o3_aqi=mean(O3.AQI,na.rm=TRUE), 
              ave_so2_mean=mean(SO2.Mean,na.rm=TRUE), ave_so2_max_val=mean(SO2.1st.Max.Value,na.rm=TRUE), ave_so2_aqi=mean(SO2.AQI,na.rm=TRUE),
              ave_co_mean=mean(CO.Mean,na.rm=TRUE), ave_co_max_val=mean(CO.1st.Max.Value,na.rm=TRUE), ave_co_aqi=mean(CO.AQI,na.rm=TRUE), .groups = 'drop')
  
  states_maximum <- uspollution %>%
    group_by(year,State) %>%
    summarise(max_no2_mean=max(NO2.Mean,na.rm=TRUE), max_no2_max_val=max(NO2.1st.Max.Value,na.rm=TRUE), max_no2_aqi=max(NO2.AQI,na.rm=TRUE),
              max_o3_mean=max(O3.Mean,na.rm=TRUE), max_o3_max_val=max(O3.1st.Max.Value,na.rm=TRUE), max_o3_aqi=max(O3.AQI,na.rm=TRUE), 
              max_so2_mean=max(SO2.Mean,na.rm=TRUE), max_so2_max_val=max(SO2.1st.Max.Value,na.rm=TRUE), max_so2_aqi=max(SO2.AQI,na.rm=TRUE),
              max_co_mean=max(CO.Mean,na.rm=TRUE), max_co_max_val=max(CO.1st.Max.Value,na.rm=TRUE), max_co_aqi=max(CO.AQI,na.rm=TRUE), .groups = 'drop')
  
  states_minimum <- uspollution %>%
    group_by(year,State) %>%
    summarise(min_no2_mean=min(NO2.Mean,na.rm=TRUE), min_no2_max_val=min(NO2.1st.Max.Value,na.rm=TRUE), min_no2_aqi=min(NO2.AQI,na.rm=TRUE),
              min_o3_mean=min(O3.Mean,na.rm=TRUE), min_o3_max_val=min(O3.1st.Max.Value,na.rm=TRUE), min_o3_aqi=min(O3.AQI,na.rm=TRUE), 
              min_so2_mean=min(SO2.Mean,na.rm=TRUE), min_so2_max_val=min(SO2.1st.Max.Value,na.rm=TRUE), min_so2_aqi=min(SO2.AQI,na.rm=TRUE),
              min_co_mean=min(CO.Mean,na.rm=TRUE), min_co_max_val=min(CO.1st.Max.Value,na.rm=TRUE), min_co_aqi=min(CO.AQI,na.rm=TRUE), .groups = 'drop')
  states <- left_join(states_ave, states_maximum, by = c("year", "State"))
  states <- left_join(states, states_minimum, by = c("year", "State"))
  
  states_2016 <- states %>%
    filter(year=="2016")
  
  output$first_chart_plot <- renderPlot({
    req(input$select_state)
    if(identical(input$select_state, "")) return(NULL)
    
    # possible choices
    # "average SO2 mean", "average SO2 max", "average SO2 AQI(Air Quality Indicator)"
    # if select_state is "Alabama"
    if(identical(input$select_state, "average SO2 mean")){
      ggplot(
        data = states_2016
      ) +
        geom_col(
          aes(x=State, y=ave_so2_aqi, fill=ave_so2_mean)
        ) +
        labs(
          y = "ave_so2_aqi (parts per billion)",
          title = "Average SO2 AQI in Different Selected States in US (2016)"
          )+
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
    } else if(identical(input$select_state, "average SO2 max")){
      ggplot(
        data = states_2016
      ) +
        geom_col(
          aes(x=State, y=ave_so2_aqi, fill=ave_so2_max_val)
        ) +
        labs(
          y = "ave_so2_aqi (parts per billion)",
          title = "Average SO2 AQI in Different Selected States in US (2016)"
        ) +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
    } else{
      ggplot(
        data = states_2016
      ) +
        geom_col(
          aes(x=State, y=ave_so2_aqi, fill=ave_so2_aqi)
        ) +
        labs(
          y = "ave_so2_aqi (parts per billion)",
          title = "Average SO2 AQI in Different Selected States in US (2016)"
        ) +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
    } 
  })
  
  #----------------------------------------------------------------------------#
  # Wrangle Data for chart_2 Input
  #----------------------------------------------------------------------------#
  counties_ave <- uspollution %>%
    group_by(year, State, County, SO2.Units) %>%
    summarise(ave_so2_aqi = mean(SO2.AQI, na.rm = TRUE), .groups = 'drop')
  
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
  
  #----------------------------------------------------------------------------#
  # Wrangle Data for Table
  #----------------------------------------------------------------------------#
  output$table <- DT::renderDataTable({
    
    df <- states %>% select(year, State, SO2.Units, ave_so2_mean, ave_so2_max_val, ave_so2_aqi)

    return(datatable(df, rownames = FALSE) 
           %>% formatStyle( c("year","State","SO2.Units","ave_so2_mean","ave_so2_max_val","ave_so2_aqi"),
                                         backgroundColor = 'gray', color='white')) 
  })
  
  
  
}
