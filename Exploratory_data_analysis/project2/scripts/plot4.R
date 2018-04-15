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

# Merge data frames to append short names
merged <- merge(NEI, SCC, by="SCC")

# Subset data for coal combustion related sources
coalCombustion <- merged[grep("coal", tolower(as.character(merged$SCC.Level.Four))),]
coalCombustion <- coalCombustion[grep("comb", tolower(as.character(coalCombustion$SCC.Level.One))), ]

#Store data frames by "year" and aggregate by sum
coalCombustion_emissions <- aggregate(Emissions~year, data=coalCombustion, sum)

#Open device
png(filename = "plot4.png", width = 480, height = 480, units='px')

#Generate Bar Plot of total emissions by year
library(ggplot2)
g <- ggplot(coalCombustion_emissions, aes(x=year, y=Emissions, fill=factor(year)))
g+geom_bar(stat="identity")+theme(axis.text.x = element_blank())+labs(title="Emissions from Coal Combustion sources")

#Close device
dev.off()

#Clean up data after running the analysis
if(dir.exists('NEI_data/')){
  file.remove("NEI_data/Source_Classification_Code.rds")
  file.remove("NEI_data/summarySCC_PM25.rds")
  file.remove('NEI_data/', recursive=TRUE)
}
file.remove("NEI_data.zip")

