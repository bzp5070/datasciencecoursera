### Course Project 1 - Get and clean data of household power consumption

library(lubridate)
library(dplyr)

setwd("~/Desktop/data_science/Exploratory data analysis/project1/")

if(!file.exists('power consumption')){
  dir.create('power consumption')
}
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="power consumption/power_consumption.zip")
unzip('power consumption/power_consumption.zip',exdir='power consumption',overwrite=TRUE)

household_all <- read.table("power consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings = '?')
head(household_all)

power_consumption_2days <- filter(household_all, Date %in% c("2/2/2007", "1/2/2007"))
power_consumption_2days$DateTime = dmy_hms(paste(as.character(power_consumption_2days$Date), as.character(power_consumption_2days$Time), sep=" "))
power_consumption_2days$Weekday = weekdays(power_consumption_2days$DateTime)
head(power_consumption_2days)
power_consumption_2days$Global_active_power = as.numeric(as.character(power_consumption_2days$Global_active_power))

if(file.exists('power consumption/household_power_consumption.txt')){
  file.remove('power consumption/household_power_consumption.txt')
  file.remove("power consumption/power_consumption.zip")
  file.remove('power consumption', recursive=TRUE)
}

rm(household_all)
