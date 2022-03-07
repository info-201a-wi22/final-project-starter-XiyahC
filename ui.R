#----------------------------------------------------------------------------#
# Import Library
#----------------------------------------------------------------------------#
library("shiny")
library("dplyr")
library("plotly")
library("ggplot2")
library("shinythemes")

#----------------------------------------------------------------------------#
# Import source
#----------------------------------------------------------------------------#

source("tab_panels/tab_introduction_panel.R")


#----------------------------------------------------------------------------#
# Define content for the first page
#----------------------------------------------------------------------------#
page_one <- tabPanel(
  "Introduction", 
  tab_introduction_panel)

#----------------------------------------------------------------------------#
# First Chart
#----------------------------------------------------------------------------#

# Create a sidebar for first chart panel
first_chart_sidebar <- sidebarPanel(
  selectizeInput(
    inputId = "select_state",
    label = "Select a variable for coloring:",
    choices = c("average SO2 mean", "average SO2 max", 
                "average SO2 AQI(Air Quality Indicator)"),
    selected= "average SO2 mean"
  )
)

first_chart_main <- mainPanel(
  h3("Average SO2 AQI in Different Selected States in US (2016)"),
  plotOutput("first_chart_plot"),
  br(),
  p("This first chart is visualizing the states with the highest pollution of 
    SO2 pollutants using a bar chart. The state with the highest average SO2 AQI 
    being Ohio at around 9.6 parts per billion and the lowest being North Dakota 
    at around 0.1 parts per billion."),
  br(),
  p("If playing around with the variables for coloring, we see that Ohio has the
     highest average SO2 maximum value which is above 5 parts per billion. Due to
     New Jersey Department of Health's ", strong("Hazardous Substance Fact Sheet"),
    ", there is no hazard with SO2 level not exceeding 5 parts per million (= 5000 
    parts per billion). Therefore, there is no need to be worried about the level 
    of SO2 even you are in Ohio. However, it's still good to keep track on future SO2
     levels to better prevent future increses.")
  
)

first_chart_panel <- tabPanel(
  "First Chart",
  first_chart_sidebar,
  first_chart_main
)

#----------------------------------------------------------------------------#
# Second Chart
#----------------------------------------------------------------------------#

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
      br(),
      p("In the second chart we noticed that Ohio has the highest parts per billion. 
        This chart focuses on Ohio plotting from 2010-2016 focusing on the pollution 
        in Ohio's specific counties. We notice in 2011 it is at an all time high and 
        by 2016 we can already see some changes. In 2011 we can see that there 
        is over 20 parts per billion for Cuyahoga and Hamilton (We notice 
        Medina disappears after 2010). In 2016 we visibly notice changes in the 
        scatter plot showing a major decrease in amounts of average SO2 AQI in 
        Cuyahoga and Hamilton to the range of 0-10 parts per billion. "),
      br(),
    )
  ),
)





#----------------------------------------------------------------------------#
# Reference
#----------------------------------------------------------------------------#

reference_panel <- tabPanel(
  "Reference",
  h3("Reference"),
  br(),
  tags$ol(id = "list2",
          tags$li("Nitrogen Dioxide & Sulfur Dioxide. (n.d.). Retrieved February 18, 2022, from 
          https://scdhec.gov/sites/default/files/Library/CR-008071.pdf"), 
          br(),
          tags$li("U.S. air pollution data - dataset by data-society. data.world. 
                  (2016, December 4). Retrieved February 4, 2022, from 
                  https://data.world/data-society/us-air-pollution-data/workspace/project-summary?
                  agentid=data-society&datasetid=us-air-pollution-data "),
          br(),
          tags$li("Sonwani, S., & Saxena , P. (2016, October). Identifying the 
                  Sources of Primary Air Pollutants and their Impact on 
                  Environmental Health: A Review . Retrieved February 4, 2022, 
                  from https://www.erpublication.org/published_paper/IJETR042555.pdf "),
          br(),
          tags$li("U.S. air pollution data - dataset by data-society. data.world. 
                  (2016, December 4). Retrieved February 4, 2022, from 
                  https://data.world/data-society/us-air-pollution-data/workspace
                  /project-summary?agentid=data-society&datasetid=us-air-pollution-data"),
          br(),

))



#----------------------------------------------------------------------------#
# Pass each page to a multi-page layout 
#----------------------------------------------------------------------------#
ui <- navbarPage(
  "US-Air-Pollution",
  theme = shinytheme("cyborg"),
  page_one,
  first_chart_panel,
  second_chart_panel,
  reference_panel,
  includeCSS("style.css")
)

