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
png(filename='plot4.png',width=480,height=480,units='px')

## Generate line plots of Global active power, Voltage, Energy sub metering and Global reactive power
par(mfrow=c(2,2))

#Plot 1
plot(power_consumption_2days$DateTime, power_consumption_2days$Global_active_power, ylab="Global Active Power (kilowatts)'", xlab="", type="l")

#Plot 2
plot(power_consumption_2days$DateTime, power_consumption_2days$Voltage, ylab="Voltage", xlab="datetime", type="l")

#Plot 3
plot(power_consumption_2days$DateTime, power_consumption_2days$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black")
lines(power_consumption_2days$DateTime, power_consumption_2days$Sub_metering_2, col="red")
lines(power_consumption_2days$DateTime, power_consumption_2days$Sub_metering_3, col="blue")
#Plot 3 legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75, y.intersp = 0.75, bty="n", col = c("black","red","blue"), lty = "solid")

#Plot 4
plot(power_consumption_2days$DateTime, power_consumption_2days$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

## Close device
dev.off()

