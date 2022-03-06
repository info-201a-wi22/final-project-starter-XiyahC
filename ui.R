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

# Pass each page to a multi-page layout 
ui <- navbarPage(
  "US Pollution",
  theme = shinytheme("cyborg"),
  page_one,
  includeCSS("style.css")
 )

