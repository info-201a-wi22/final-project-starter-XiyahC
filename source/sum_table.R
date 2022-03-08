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
library("dplyr", warn.conflicts = FALSE)
library("tidyverse")

# Load Data
setwd("C:/Users/mobtn/Documents/_code/final-project-starter-XiyahC/data")
data <- "uspollution_pollution_us_2010_2016.csv"
uspollution <- read.csv(data, header=TRUE, stringsAsFactors=FALSE)
View(uspollution)

# dataframe1: Indicators of four pollutants(NO2, SO2, 03, CO) of different states in US. 

# This dataframe named as "states", which concludes the average, maximum, and minimum value of 
# "pollutant Mean", "pollutant 1st Max Value", and "pollutant AQI" in different states in US. We want 
# to have basic understanding of siutation of different pollutants in different states. 

uspollution <-  mutate(uspollution, year = c(str_sub(uspollution$Date.Local, 1, 4)))
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

View(states)

# dataframe2: Indicators of four pollutants (NO2, SO2, 03, CO) of different counties in each state.

# This dataframe named as "counties", which concludes the average, maximum, and minimum value of 
# "pollutant Mean", "pollutant 1st Max Value", and "pollutant AQI" in different counties in a state. We want 
# to have basic understanding of situation of different pollutants in different counties of a state. 

uspollution <- mutate(
  uspollution,
  state_county=paste(County, State, sep = ",")
)
counties_ave <- uspollution %>%
  group_by(year,State,County, NO2.Units,O3.Units,SO2.Units,CO.Units) %>%
  summarise(ave_no2_mean=mean(NO2.Mean,na.rm=TRUE), ave_no2_max_val=mean(NO2.1st.Max.Value,na.rm=TRUE), ave_no2_aqi=mean(NO2.AQI,na.rm=TRUE),
            ave_o3_mean=mean(O3.Mean,na.rm=TRUE), ave_o3_max_val=mean(O3.1st.Max.Value,na.rm=TRUE), ave_o3_aqi=mean(O3.AQI,na.rm=TRUE), 
            ave_so2_mean=mean(SO2.Mean,na.rm=TRUE), ave_so2_max_val=mean(SO2.1st.Max.Value,na.rm=TRUE), ave_so2_aqi=mean(SO2.AQI,na.rm=TRUE),
            ave_co_mean=mean(CO.Mean,na.rm=TRUE), ave_co_max_val=mean(CO.1st.Max.Value,na.rm=TRUE), ave_co_aqi=mean(CO.AQI,na.rm=TRUE), .groups = 'drop')


counties_maximum <- uspollution %>%
  group_by(year,State,County) %>%
  summarise(max_no2_mean=max(NO2.Mean,na.rm=TRUE), max_no2_max_val=max(NO2.1st.Max.Value,na.rm=TRUE), max_no2_aqi=max(NO2.AQI,na.rm=TRUE),
            max_o3_mean=max(O3.Mean,na.rm=TRUE), max_o3_max_val=max(O3.1st.Max.Value,na.rm=TRUE), max_o3_aqi=max(O3.AQI,na.rm=TRUE), 
            max_so2_mean=max(SO2.Mean,na.rm=TRUE), max_so2_max_val=max(SO2.1st.Max.Value,na.rm=TRUE), max_so2_aqi=max(SO2.AQI,na.rm=TRUE),
            max_co_mean=max(CO.Mean,na.rm=TRUE), max_co_max_val=max(CO.1st.Max.Value,na.rm=TRUE), max_co_aqi=max(CO.AQI,na.rm=TRUE), .groups = 'drop')


counties_minimum <- uspollution %>%
  group_by(year,State,County) %>%
  summarise(min_no2_mean=min(NO2.Mean,na.rm=TRUE), min_no2_max_val=min(NO2.1st.Max.Value,na.rm=TRUE), min_no2_aqi=min(NO2.AQI,na.rm=TRUE),
            min_o3_mean=min(O3.Mean,na.rm=TRUE), min_o3_max_val=min(O3.1st.Max.Value,na.rm=TRUE), min_o3_aqi=min(O3.AQI,na.rm=TRUE), 
            min_so2_mean=min(SO2.Mean,na.rm=TRUE), min_so2_max_val=min(SO2.1st.Max.Value,na.rm=TRUE), min_so2_aqi=min(SO2.AQI,na.rm=TRUE),
            min_co_mean=min(CO.Mean,na.rm=TRUE), min_co_max_val=min(CO.1st.Max.Value,na.rm=TRUE), min_co_aqi=min(CO.AQI,na.rm=TRUE), .groups = 'drop')

counties <- left_join(counties_ave, counties_maximum, by = c("year", "State", "County"))
counties <- left_join(counties, counties_minimum, by = c("year", "State", "County"))

View(counties)

# dataframe3: Indicators of four pollutants of different cities in each county.

# This dataframe named as "cities", which concludes the average, maximum, and minimum value of 
# "pollutant Mean", "pollutant 1st Max Value", and "pollutant AQI" in different cities in the county. We want 
# to have basic understanding of siutation of different pollutants in different cities. 

uspollution <- mutate(
  uspollution,
  state_county_city=paste(City, County, State, sep = ",")
)

cities_ave <- uspollution %>%
  group_by(year,City, County, NO2.Units,O3.Units,SO2.Units,CO.Units) %>%
  summarise(ave_no2_mean=mean(NO2.Mean,na.rm=TRUE), ave_no2_max_val=mean(NO2.1st.Max.Value,na.rm=TRUE), ave_no2_aqi=mean(NO2.AQI,na.rm=TRUE),
            ave_o3_mean=mean(O3.Mean,na.rm=TRUE), ave_o3_max_val=mean(O3.1st.Max.Value,na.rm=TRUE), ave_o3_aqi=mean(O3.AQI,na.rm=TRUE), 
            ave_so2_mean=mean(SO2.Mean,na.rm=TRUE), ave_so2_max_val=mean(SO2.1st.Max.Value,na.rm=TRUE), ave_so2_aqi=mean(SO2.AQI,na.rm=TRUE),
            ave_co_mean=mean(CO.Mean,na.rm=TRUE), ave_co_max_val=mean(CO.1st.Max.Value,na.rm=TRUE), ave_co_aqi=mean(CO.AQI,na.rm=TRUE), .groups = 'drop') 


cities_maximum <- uspollution %>%
  group_by(year,City, County) %>%
  summarise(max_no2_mean=max(NO2.Mean,na.rm=TRUE), max_no2_max_val=max(NO2.1st.Max.Value,na.rm=TRUE), max_no2_aqi=max(NO2.AQI,na.rm=TRUE),
            max_o3_mean=max(O3.Mean,na.rm=TRUE), max_o3_max_val=max(O3.1st.Max.Value,na.rm=TRUE), max_o3_aqi=max(O3.AQI,na.rm=TRUE), 
            max_so2_mean=max(SO2.Mean,na.rm=TRUE), max_so2_max_val=max(SO2.1st.Max.Value,na.rm=TRUE), max_so2_aqi=max(SO2.AQI,na.rm=TRUE),
            max_co_mean=max(CO.Mean,na.rm=TRUE), max_co_max_val=max(CO.1st.Max.Value,na.rm=TRUE), max_co_aqi=max(CO.AQI,na.rm=TRUE), .groups = 'drop')


cities_minimum <- uspollution %>%
  group_by(year,City, County) %>%
  summarise(min_no2_mean=min(NO2.Mean,na.rm=TRUE), min_no2_max_val=min(NO2.1st.Max.Value,na.rm=TRUE), min_no2_aqi=min(NO2.AQI,na.rm=TRUE),
            min_o3_mean=min(O3.Mean,na.rm=TRUE), min_o3_max_val=min(O3.1st.Max.Value,na.rm=TRUE), min_o3_aqi=min(O3.AQI,na.rm=TRUE), 
            min_so2_mean=min(SO2.Mean,na.rm=TRUE), min_so2_max_val=min(SO2.1st.Max.Value,na.rm=TRUE), min_so2_aqi=min(SO2.AQI,na.rm=TRUE),
            min_co_mean=min(CO.Mean,na.rm=TRUE), min_co_max_val=min(CO.1st.Max.Value,na.rm=TRUE), min_co_aqi=min(CO.AQI,na.rm=TRUE), .groups = 'drop')

cities <- left_join(cities_ave, cities_maximum, by = c("year", "City", "County"))
cities <- left_join(cities, cities_minimum, by = c("year", "City", "County"))

cities <- cities %>% 
arrange(year)

View(cities)

# 4 dataframes: each contains a table of cities that have maximum max pollutant aqi of each county each year.

# From these four dataframes, it is clear for us to find that which city has the greatest maximum AQI in each county 
#from 2020-2016
aqi_max_no2 <- cities_maximum%>%
  group_by(County,year)%>%
  filter(max_no2_aqi==max(max_no2_aqi,na.rm = TRUE))%>%
  ungroup() %>%
  select(max_no2_aqi,City)

aqi_max_so2 <- cities_maximum%>%
  group_by(County,year)%>%
  filter(max_so2_aqi==max(max_so2_aqi,na.rm = TRUE))%>%
  ungroup() %>%
  select(max_so2_aqi,City)

aqi_max_o3 <- cities_maximum%>%
  group_by(County,year)%>%
  filter(max_o3_aqi==max(max_o3_aqi,na.rm = TRUE))%>%
  ungroup() %>%
  select(max_o3_aqi,City)

aqi_max_co <- cities_maximum%>%
  group_by(County,year)%>%
  filter(max_co_aqi==max(max_co_aqi,na.rm = TRUE))%>%
  ungroup() %>%
  select(max_co_aqi,City)

#4 dataframes: each contains a table of cities that have minimum average pollutant aqi of each county each year.

#From these four dataframes, it is clear for us to find that which city has the lowest average AQI in each county 
#from 2020-2016
min_aqi_mean_no2 <- cities_ave%>%
  group_by(County,year)%>%
  filter(ave_no2_aqi==min(ave_no2_aqi,na.rm=TRUE))%>%
  ungroup() %>%
  select(ave_no2_aqi,City)

min_aqi_mean_so2 <- cities_ave%>%
  group_by(County,year)%>%
  filter(ave_so2_aqi==min(ave_so2_aqi,na.rm=TRUE))%>%
  ungroup() %>%
  select(ave_so2_aqi,City)

min_aqi_mean_03 <- cities_ave%>%
  group_by(County,year)%>%
  filter(ave_o3_aqi==min(ave_o3_aqi,na.rm=TRUE))%>%
  ungroup() %>%
  select(ave_o3_aqi,City)

min_aqi_mean_co <- cities_ave%>%
  group_by(County,year)%>%
  filter(ave_co_aqi==min(ave_co_aqi,na.rm=TRUE))%>%
  ungroup() %>%
  select(ave_co_aqi,City)



# Average pollutant mean in each year.

#This dataframe is named as "ave_mean_year", where presents the trend of the average pollutant mean 
#from 2010-2016. 

ave_mean_year <- uspollution %>%
  group_by(year)%>%
  summarise(ave_no2_mean=round(mean(NO2.Mean,na.rm=TRUE), digits = 2),
            ave_o3_mean=round(mean(O3.Mean,na.rm=TRUE), digits = 2),
            ave_so2_mean=round(mean(SO2.Mean,na.rm=TRUE),digits = 2),
            ave_co_mean=round(mean(CO.Mean,na.rm=TRUE),digits = 2),
            .groups = 'drop')







