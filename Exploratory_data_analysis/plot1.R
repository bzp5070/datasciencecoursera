## Create plots directory if it doesn't already exist
setwd("~/Desktop/data_science/Exploratory data analysis/project1/")

if(!file.exists('plots')){
  dir.create('plots')
}

## Load data
source("getData.R")

## Set current working directory to plots where all the plots are stored
setwd('plots')

## Open device
getwd()
png(filename='plot1.png',width=480,height=480,units='px')

## Generate histogram plot
hist(power_consumption_2days$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red", xlim = c(0,6), breaks = 12)

## Close device
dev.off()
