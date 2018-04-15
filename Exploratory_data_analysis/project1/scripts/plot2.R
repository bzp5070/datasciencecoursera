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
png(filename='plot2.png',width=480,height=480,units='px')

## Generate Global active power line plot
plot(power_consumption_2days$DateTime, power_consumption_2days$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

## Close device
dev.off()



