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
png(filename='plot3.png',width=480,height=480,units='px')

## Generate Energy sub metering line plot
plot(power_consumption_2days$DateTime, power_consumption_2days$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black")
points(power_consumption_2days$DateTime, power_consumption_2days$Sub_metering_2,type="l", col="red")
points(power_consumption_2days$DateTime, power_consumption_2days$Sub_metering_3,type="l", col="blue")

## Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"))

## Close device
dev.off()



