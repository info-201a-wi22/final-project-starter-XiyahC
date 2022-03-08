#----------------------------------------------------------------------------#
# Import Library
#----------------------------------------------------------------------------#
library("shiny")
library("dplyr")
library("plotly")
library("ggplot2")
library("shinythemes")
library("DT")

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
# Third Chart
#----------------------------------------------------------------------------#
# Part One
third_chart_sidebar <- sidebarPanel(
  selectInput(
    "search",
    label = "Select a Variable for Exploring:",
    choices = c("Average SO2 Mean"="ave_so2_mean", "Average SO2 Max Value"="ave_so2_max_val", 
                "Average SO2 AQI"="ave_so2_aqi"),
    selected= "Average SO2 Mean")
)
#Part Two

third_chart_main <- mainPanel(
  h3("Average SO2 AQI in Wyoming(2010-2016)"),
  plotlyOutput("line"),
  br(),
  p("In the third chart, we used the line chart. By analyzing the first chart, 
    we can easily find the state with the least SO2 pollution. For the measurement 
    of the data, we must consider that not all counties are suitable for measurement.
    And not all counties will measure. At the same time, people can choose various 
    types of values to explore on this page. This ensures that the analysis of SO2 
    air pollution is more specific.Therefore, we took the relevant data for 
    Wyoming (state) and wanted to find out which of its counties had the least 
    air pollution."),
  br(),
  p("We noticed that in", strong("Laramie,"), "from", strong("2011 to 2014"), ", 
  the growth trend of average SO2 parts per billion", em("leveled off"), "but 
  started to", em("increase suddenly"), "and sharply from", strong("2014"), ". After
  the data peaked in", strong("2015"), ", it began to show a significant", 
  strong("downward trend"), ". Looking at Sweetwater and Fremont, we notice only 
  two little lines. This can be due to various reasons such as lack of measurement, data 
  collection issues, etc.")
  )

third_chart_panel <- tabPanel(
  "Third Chart",
  third_chart_sidebar,
  third_chart_main
)


# Define content for the summary page
summary_panel <- tabPanel(
  "Summary",
  h3("Summary of US Air Pollution"),
  p("Air pollution is the most considerable environmental risk to public health 
    worldwide. People worldwide are exposed to air pollution, whether at work, 
    during travel, or home. It is an invisible killer lurking around us. It will
    not only seriously affect human health but also damage the ecosystem. We chose 
    to primarily explore the impact of the air pollutant SO2 in different states 
    and counties in the United States and trends in air pollution over the years. 
    SO2 has the greatest impact on the environment among the four major pollutants.
    SO2 has a stimulating effect on human respiratory organs and eye membranes, 
    and long-term inhalation is harmful to the respiratory system, liver, kidney, 
    and heart. At the same time, it plays a significant role in forming acid rain,
    which seriously damages the environment."),
  br(),
  p("We can easily find that Ohio is the state with the highest SO2 pollution through 
    data analysis. The highest AQI value can reach", strong("161"), ", which belongs 
    to moderate pollution. However, North Dakota, as the least polluted state, has an AQI value
    of", strong("only one"), "and has no air pollution. This shows that North Dakota State is the 
    safest area without the possibility of acid rain in the future. Ohio is very 
    likely to be affected by acid rain, and the local government should pay attention
    to this and plan emergency measures on time."),
  br(),
  p("Further analysis of Ohio's counties shows that in 2011 it was at an all-time
    high. In 2016, the average SO2 AQI of Cuyahoga and Hamilton dropped significantly 
    to the range of", strong("0-10"), "parts per billion. This is what everyone expects to see. 
    Due to the lack of North Dakota data, we chose to analyze the SO2 specific values
    of counties in Wyoming (the second least SO2 polluted state in the United States).
    Laramie's average SO2 AQI is in a very safe range all year round, between", strong("0 and 3"), ". 
    Therefore, it is not subject to any risk of acid rain formation, and the environment 
    is not affected."),
  br(),
  p("At last, with the development of society, if pollutants are not effectively 
    controlled, they will only cause more and more severe damage to human health 
    and the environment. Human beings need to pay attention to this and jointly 
    protect this beautiful homeland - the Earth."),
  a(href = "https://youtu.be/GVBeY1jSG9Y", "How air pollution impacts your body")
)


#----------------------------------------------------------------------------#
# Reference
#----------------------------------------------------------------------------#

reference_panel <- tabPanel(
  "Reference",
  h3("Reference"),
  br(),
  tags$ol(id = "list2",
          tags$li("Nitrogen Dioxide & Sulfur Dioxide. (n.d.). Retrieved February 18, 2022, from ",
                  a(href="https://scdhec.gov/sites/default/files/Library/CR-008071.pdf",
                    "https://scdhec.gov/sites/default/files/Library/CR-008071.pdf.")), 
          br(),
          tags$li("U.S. air pollution data - dataset by data-society. data.world. 
                  (2016, December 4). Retrieved February 4, 2022, from ",
                  a(href="https://data.world/data-society/us-air-pollution-data/workspace/
                    project-summary?agentid=data-society&datasetid=us-air-pollution-data",
                    "https://data.world/data-society/us-air-pollution-data/workspace/
                    project-summary?agentid=data-society&datasetid=us-air-pollution-data.")),
          br(),
          tags$li("Sonwani, S., & Saxena , P. (2016, October). Identifying the 
                  Sources of Primary Air Pollutants and their Impact on 
                  Environmental Health: A Review . Retrieved February 4, 2022, from ",
                  a(href="https://www.erpublication.org/published_paper/IJETR042555.pdf",
                    "https://www.erpublication.org/published_paper/IJETR042555.pdf.")),
          br(),
          tags$li("U.S. air pollution data - dataset by data-society. data.world. 
                  (2016, December 4). Retrieved February 4, 2022, from ", 
                  a(href=" https://data.world/data-society/us-air-pollution-data/workspace/
                    project-summary?agentid=data-society&datasetid=us-air-pollution-data",
                    " https://data.world/data-society/us-air-pollution-data/workspace/project-summary
                    ?agentid=data-society&datasetid=us-air-pollution-data.")),
          br(),
          tags$li("New Jersey Department of Health. (2000, June). Right to know hazardous 
                  substance fact sheet. nj.gov. Retrieved March 7, 2022, from ", 
                  a(href="https://nj.gov/health/eoh/rtkweb/documents/fs/1759.pdf",
                    "https://nj.gov/health/eoh/rtkweb/documents/fs/1759.pdf.")),
          br()

))

#----------------------------------------------------------------------------#
# Table(P02)
#----------------------------------------------------------------------------#

table_panel <- tabPanel(
  "Table(P02)",
  h3("Table for Information at States Level"), 
  em("Indicators of SO2 of different states in US."), 
  p(strong("Table added since in P02 we didn't have a table."),
    "This dataframe named as 'states', which concludes the average, maximum, and AQI value of 
    SO2 in different states in US. We want to have basic understanding of siutation of SO2 in different states. "),
  br(),
  DT::dataTableOutput("table")
)

#----------------------------------------------------------------------------#
# Pass each page to a multi-page layout 
#----------------------------------------------------------------------------#
ui <- navbarPage(
  "US-Air-Pollution",
  theme = shinytheme("cyborg"),
  page_one,
  first_chart_panel,
  second_chart_panel,
  third_chart_panel,
  summary_panel,
  reference_panel,
  table_panel,
  includeCSS("style.css")
)
