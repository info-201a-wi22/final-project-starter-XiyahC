library("shiny")
library("dplyr")
library("plotly")
library("ggplot2")
library("shinythemes")
library("gfonts")



tab_introduction_panel <- tabPanel(
  "Introduction",
  h1("US Air Pollution in Recent Years"),
  img(src = "air-pollution-smog-1500-1280x640.jpeg", width = "460", height = "345"),
  h3("Background"),
  p("In recent years, we have seen a great increase in air pollution, which 
    leads to a lot of environmental problems. We are really concerned about this 
    problem and want to explore more about it. Therefore, we search the database 
    related to this topic, from which we can see the level of air pollution in 
    different states in the U.S. The elements that the database uses to 
    represent the air pollution are four major pollutants which are NO2, O3, 
    SO2, and CO. Units, Mean, AQI, 1st Max Value, and 1st Max Hour are five 
    variable latitudes to show the level of air pollution. When analyzing the 
    data, we need to figure out what the five variable latitudes stand for. 
    In the result of the analysis, we hope to find the relationship between 
    states and air pollution and the trend of air pollution over the years. 
    We also want to analyze the possible elements (locations, human behavior, 
    economic development) behind it."),
  
  h3("Design Situation"),
  tags$ul(id = "list1",
    tags$li(strong("Framing the topic of concern:")," Our topic addresses the scientific issues 
  related to the Air Problems in the U.S. There are many pollutants related 
  to the Air Pollution Level, if the Air Pollution problem is not treated seriously, 
  then it might cause a series of natural disasters."),
    br(),
    tags$li(strong("Human Values:"), " Health awareness should be the big part connected to our topic 
  of concern. The value seems to be originated from the truth that air is the substantial 
  thing that human beings need to maintain their livings.Also, it will indirectly 
  affect our health by negatively causing global warming and the sea level rising, 
  which will increase the spread of diseases. This will hugely impact human health."),
    br(),
    tags$li(strong("Stakeholders:"), " The direct stakeholders of our topic are those who are really 
    interested in air pollution topics, and who are concerned about the environment 
    which will affect human activities and health. They should have the values of 
    environmental protection and healthy lives for all humankind. The indirect 
    stakeholders would be all human beings around the world since we are 
    all relying on air to breathe and we all need fresh air to live a better and 
    healthier life. Besides human beings, there are all other kinds of living in 
    the world, such as plants, animals, and soil. They are also counted as 
    indirect stakeholders. "),
    br(),
    tags$li(strong("Benefits and harms: "), " If interventions are taken with data and technology, 
    air pollution might be controlled at a certain level which 
    will neither limit human development(either on technologies or weapons), 
    nor negatively impact the global environment on Earth. However, there could 
    be the risk that before we, humans actually have the ability to control air 
    pollution, the air pollution have already grown to the level that is irreversible. 
    And the technology we are developing might accelerate the impacts of air pollution in a negative way.")
),

  h3("Research Question"),
   p("How much SO2 AQI is necessary to generate Acid Rain?"),
    tags$ol(id = "list2",
      tags$li("If the highest AQI doesn't have enough SO2 to generate acid rain 
              we don??t have to worry about acid rain the possibilities of future acid rain in the US."),
      tags$li("We look at the lowest level(s) of SO2 AQI inside the US because we want to find 
              the safest areas without possibilities of acid rain in the future.")
    ),
    
      
  h3("The Dataset"),
    p("The dataset has 778, 254 observations, and 28 variables. The data represents 
      the level of four major pollutants(Nitrogen Dioxide, Sulphur Dioxide, 
      Carbon Monoxide, and Ozone) for every day from 2010 to 2016 and the specific 
      locations and date the data was recorded. There is a user of Kaggle, 
      BrendaSo collected the data from the database of U.S. EPA around 2017. 
      She originally scraped all data from U.S. EPA because she did a related 
      project with her friends in college to help other data-scientist to use 
      this pre-scrapped dataset to do further analysis. It is trustworthy since U.S. 
      EPA is an official government agency. We saw the dataset from Kaggle, then we 
      go to the data.world website to download the neat .csv file which contains 
      all the data we need. Yes, we do credit the source of the data as one of our 
      references.")
)






