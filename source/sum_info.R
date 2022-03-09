# Load Packages
library("dplyr", warn.conflicts = FALSE)
library("tidyverse")

# Load Data

data <- "~/final-project-starter-XiyahC/data/uspollution_pollution_us_2010_2016.csv"
uspollution <- read.csv(data, header=TRUE, stringsAsFactors=FALSE)
View(uspollution)

# Basic Summary
df <- uspollution
summary_info <- list()
summary_info$col_names <- unique(colnames(df))
summary_info$vars_size <- ncol(df)
summary_info$obsv_size <- nrow(df)
summary_info$max_year  <- max(df$Date.Local, na.rm=TRUE)
summary_info$min_year  <- min(df$Date.Local, na.rm=TRUE)
summary_info$NO2_unit  <- unique(df$NO2.Units)
summary_info$O3_unit   <- unique(df$O3.Units)
summary_info$SO2_unit  <- unique(df$SO2.Units)
summary_info$CO_unit   <- unique(df$CO.Units)