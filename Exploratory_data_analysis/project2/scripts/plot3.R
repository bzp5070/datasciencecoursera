## Exploratory data analysis Course Project 2

#Set working directory
setwd("~/Desktop/data_science/Exploratory data analysis/project2/")

#Download data
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile="NEI_data.zip")
unzip('NEI_data.zip',exdir='NEI_data',overwrite=TRUE)

#Read in the data
SCC <- readRDS("NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")

names(SCC)
names(NEI)

#Create new column with unique source id
NEI$sourceid <- paste(NEI$fips, NEI$SCC, sep=".")

# Subset Baltimore city data
baltimore <- NEI[NEI$fips == "24510",]

#Store data frames by "year"
total_emissions <- aggregate(Emissions~year+type, data=baltimore, sum)

#Open device
png(filename = "plot3.png", width = 480, height = 480, units='px')

#Generate Bar Plot of total emissions by year
library(ggplot2)
g <- ggplot(total_emissions, aes(x=year, y=Emissions, fill=factor(year)))
g+geom_bar(stat="identity")+facet_grid(.~type, margins=TRUE)+ theme(axis.text.x = element_blank())+labs(title="PM25 Emissions in Baltimore City by type")

#Close device
dev.off()

#Clean up data after running the analysis
if(dir.exists('NEI_data/')){
  file.remove("NEI_data/Source_Classification_Code.rds")
  file.remove("NEI_data/summarySCC_PM25.rds")
  file.remove('NEI_data/', recursive=TRUE)
}
file.remove("NEI_data.zip")

