---
title: "Our Report"
author: "Han Rui Liu, Kris Shen, Iris Mao, Xiyah Chang"
date: "3/8/2022"
output: html_document
---





## Abstract

We are concerned with the air pollution trends in the U.S. during the time from Jan. 2010 to Dec. 2016, because the air quality is closely related to human activities and will significantly affect human health. To address this concern, we plan to use the dataset from data.world to come up with useful analysis and to visualize the possible trends of the U.S. air pollution situation. Therefore, we can use the results of the analysis to find existing air-pollution problems and to generate useful solutions.

## Keywords

“environmental science; air pollution; major pollutants”

## Affiliation

INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Introduction 

In recent years, we have seen a great increase in air pollution, which leads to a lot of environmental problems. We are really concerned about this problem and want to explore more about it. Therefore, we search the database related to this topic, from which we can see the level of air pollution in different states in the U.S. The elements that the database uses to represent the air pollution are four major pollutants which are NO2, O3, SO2, and CO. Units, Mean, AQI, 1st Max Value, and 1st Max Hour are five variable latitudes to show the level of air pollution. When analyzing the data, we need to figure out what the five variable latitudes stand for. In the result of the analysis, we hope to find the relationship between states and air pollution and the trend of air pollution over the years. We also want to analyze the possible elements (locations, human behavior, economic development…) behind it.

## Design Situation 

Framing the topic of concern: Our topic addresses the scientific issues related to the **Air Problems in the U.S**. There are many pollutants related to the Air Pollution Level, if the Air Pollution problem is not treated seriously, then it might cause a series of natural disasters. Human Values: Health awareness should be the big part connected to our topic of concern. The value seems to be originated from the truth that air is the substantial thing that human beings need to maintain their livings.Also, it will indirectly affect our health by negatively causing global warming and the sea level rising, which will increase the spread of diseases. This will hugely impact human health. 

**Stakeholders**: The direct stakeholders of our topic are those who are really interested in air pollution topics, and who are concerned about the environment which will affect human activities and health. They should have the values of environmental protection and healthy lives for all humankind. The **indirect stakeholders** would be all human beings around the world since we are all relying on air to breathe and we all need fresh air to live a better and healthier life. Besides human beings, there are all other kinds of living in the world, such as plants, animals, and soil. They are also **counted as indirect stakeholders**. Benefits and harms: If interventions are taken with data and technology, air pollution might be controlled at a certain level which will neither limit human development(either on technologies or weapons), nor negatively impact the global environment on Earth. However, there could be the risk that before we, humans actually have the ability to control air pollution, the air pollution have already grown to the level that is irreversible. And the technology we are developing might accelerate the impacts of air pollution in a negative way.



## Research Questions

1. If the highest AQI doesn't have enough SO2 to generate acid rain we don??t have to worry about acid rain the possibilities of future acid rain in the US.

2. We look at the lowest level(s) of SO2 AQI inside the US because we want to find the safest areas without possibilities of acid rain in the future.
    
## Dataset Information and Summary

This dataset has **30** variables and **778254** observations, collected data from **2010-01-01** to **2016-05-31**.  

There are four pollutants recorded, they are NO2(**Parts per billion**), O3 (**Parts per million**), SO2 (**Parts per billion**), and CO (**Parts per million**).  

**Column Names:** X, Unnamed..0, State.Code, County.Code, Site.Num, Address, State, County, City, Date.Local, NO2.Units, NO2.Mean, NO2.1st.Max.Value, NO2.1st.Max.Hour, NO2.AQI, O3.Units, O3.Mean, O3.1st.Max.Value, O3.1st.Max.Hour, O3.AQI, SO2.Units, SO2.Mean, SO2.1st.Max.Value, SO2.1st.Max.Hour, SO2.AQI, CO.Units, CO.Mean, CO.1st.Max.Value, CO.1st.Max.Hour, CO.AQI 


## Expected Implications

We hope people will raise their awareness of air pollution and get to know more knowledge related to reducing air pollution, like using more public transportation. The school should help students to cultivate the environmental protection consciousness. The community can also get involved to educate residents of the importance of reducing air pollution. We also want the government to regulate the emissions of air pollutants and make rules of buying cars. There can also be a discount for taking public transportation. However, different states have different reasons that lead to air pollution, so governments of different states should apply professional technologists to find out the main reasons and figure out the most reasonable solutions. Besides, the car designers are encouraged to design more functions that can reduce the emission of air pollutants. 

## Limitation

The data in the database is only updated to 2016 so some of the data analyzed may not be useful in the current environment. In recent years, glaciers have retreated further due to global warming caused by worsening air quality. The composition of air becomes more complex and variable over time. Many factors can affect air quality. There are many sources that may not be checked due to missing data about air pollution. And because of the outbreak of the COVID-19 virus in 2019, the USA entered a very tense state, and it influenced so many people’s daily life. These external factors may become the limitations and affect the analysis of data.


## Findings 
  
Air pollution is the most considerable environmental risk to public health. People worldwide are exposed to air pollution, whether at work, during travel, or at home. It is an invisible killer lurking around us. It will not only seriously affect human health but also damage the ecosystem. We chose to primarily explore the impact of the air pollutant SO2 in different states and counties in the United States and trends in air pollution over the years. Throughout our research, we have found that Ohio has the highest pollution of SO2. This is shown in the first chart using a bar graph, showing Ohio as the state with the highest pollutants. Using the bar graph, we also found that North Dakota has the lowest pollution of SO2. Ohio at around 9.6 parts per billion and North Dakota at around 0.1 parts per billion. We also learned that with an SO2 of over 5 parts per million it becomes hazardous. From the second graph, we notice that Ohio's counties had an all-time high of SO2 in 2011 but by 2016 there has been a significant decrease to around/less than 10 parts per billion. 
  
## Discussion

Many people worldwide get exposed to air pollution in their daily lives. It is an invisible killer lurking around us. It doesn’t just seriously affect human health but also damages the ecosystem. Through studying the 4 major pollutants we found that SO2 has the greatest impact on the environment among the four major pollutants. SO2 has a stimulating effect on human respiratory organs and eye membranes, and long-term inhalation is harmful to the respiratory system, liver, kidney, and heart. At the same time, it plays a significant role in forming acid rain, which seriously damages the environment. From what we learned the amount of SO2 isn’t enough to be considered a hazard but it can mix with other pollutants and cause acid rain. Ohio having the highest amount of pollutants is very likely to be affected by acid rain, and the local government should pay attention to this and plan emergency measures on time. The highest AQI value can reach 161, which belongs to moderate pollution. However, North Dakota, as the least polluted state, has an AQI value of only one and has no air pollution. This shows that North Dakota State is the safest area without the possibility of acid rain in the future. Through further analysis, we found that Ohio’s counties in 2011 had the highest amount of average SO2 AQI. Through looking at Cuyahoga and Hamilton we noticed the average SO2 AQI had dropped significantly in 2016, dropping to the range of 0-10 parts per billion. This shows that although it used to have really high amounts of SO2 API Ohio's counties were able to reduce the amount significantly in 5 years. This shows that the pollutants are not permanent and risk of acid rain can be reduced. Due to the lack of data in North Dakota, we analyzed the average SO2 AQI in the counties of Wyoming. In Laramie, the average SO2 AQI was between 0 and 3. Therefore, it is not subject to any risk of acid rain formation, and the environment is not at risk of being affected. Although some states are not worried about SO2 or acid rain they should still continue to do their best to keep pollution levels down. 

## Conclusion

There are many places that aren’t at risk of acid rain or hazardous amounts of SO2 pollution in the air, we as humans living on Earth need to do our best to keep the Earth alive. We can already see improvement in Ohio which has the highest amount of SO2 AQI showing that it isn’t something we can’t improve on. 

As humans of Earth lets do our best to keep our home clean. 


## References

1. Nitrogen Dioxide & Sulfur Dioxide. (n.d.). Retrieved February 18, 2022, from https://scdhec.gov/sites/default/files/Library/CR-008071.pdf

2. Sonwani, S., & Saxena , P. (2016, October). Identifying the Sources of Primary Air Pollutants and their Impact on Environmental Health: A Review . Retrieved February 4, 2022, from https://www.erpublication.org/published_paper/IJETR042555.pdf 

3. U.S. air pollution data - dataset by data-society. data.world. (2016, December 4). Retrieved February 4, 2022, from             https://data.world/data-society/us-air-pollution-data/workspace/project-summary?agentid=data-society&datasetid=us-air-pollution-data 

4. U.S. air pollution data - dataset by data-society. data.world. (2016, December 4). Retrieved February 4, 2022, from https://data.world/data-society/us-air-pollution-data/workspace/project-summary?agentid=data-society&datasetid=us-air-pollution-data
