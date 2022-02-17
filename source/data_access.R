# Example: Project Data Access Functions  ----
#----------------------------------------------------------------------------#
# These functions are used to access data sources ... 
#----------------------------------------------------------------------------#
#data_access_test <- function (name="World!") {
#  t <- paste0("Hello: ", name)
#  return(t)
#}
#----------------------------------------------------------------------------#
#
# The analysis.R file will need to complete the following tasks:
#  -Load the data.
#  -Compute metrics of interest.
#  -Generate data visualizations to display.
#
#----------------------------------------------------------------------------#

# Load Packages
library("dplyr")
library("tidyverse")

# Load Data
load_data <- function() {
  filename <- "../data/uspollution_pollution_us_2010_2016.csv"
  df <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
  return(df)
}


