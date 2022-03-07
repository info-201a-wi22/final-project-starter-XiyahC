# Import Library
library("shiny")
library("dplyr")
library("plotly")
library("ggplot2")
library("shinythemes")

# Import source
source("tab_panels/tab_introduction_panel.R")

# Define content for the first page
page_one <- tabPanel(
  "Introduction", 
  tab_introduction_panel)


#Create a siderbar for second chart panel
second_chart_siderbar <- sidebarPanel(
  selectizeInput(
    inputId = "select_county",
    label = "Select a county:",
    choices = c("Cuyahoga", "Hamilton", "Medina"),
    selected = "Cuyahoga")
)

#Create a main panel for second chart panel

second_chart_main <- mainPanel(
  h3("Average SO2 AQI in Ohio(2010-2016)"),
  plotOutput(
    outputId = "second_chart_ggplot"
  )
)

second_chart_panel <- tabPanel(
  "Second Chart",
  tabsetPanel(
    type = "tabs",
    tabPanel("Plot",
  second_chart_siderbar,
  second_chart_main
),
tabPanel(
  "Summary",
  h1("Summary"),
  p("In the second chart we noticed that Ohio has the highest parts per billion. 
    This chart focuses on Ohio plotting from 2010-2016 focusing on the pollution 
    in Ohio's specific counties. We notice in 2011 it is at an all time high and 
    by 2016 we can already see some changes. In 2011 we can see that there 
    is over 20 parts per billion for Cuyahoga and Hamilton (We notice 
    Medina disappears after 2010). In 2016 we visibly notice changes in the 
    scatter plot showing a major decrease in amounts of average SO2 AQI in 
    Cuyahoga and Hamilton to the range of 0-10 parts per billion. ")
)
),
)

# Pass each page to a multi-page layout 
ui <- navbarPage(
  "US Pollution",
  theme = shinytheme("cyborg"),
  page_one,
  second_chart_panel,
  includeCSS("style.css")
 )

