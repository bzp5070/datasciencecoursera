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

#Store data frames by "year"
baltimore_city_emissions99 <- subset(NEI, year=="1999" & fips=="24510")
baltimore_city_emissions02 <- subset(NEI, year=="2002" & fips=="24510")
baltimore_city_emissions05 <- subset(NEI, year=="2005" & fips=="24510")
baltimore_city_emissions08 <- subset(NEI, year=="2008" & fips=="24510")

#Total emissions data frame to plot
baltimore_city_total_emissions <- data.frame(years=c("1999","2002","2005","2008"), Total_emissions=
                                c(sum(baltimore_city_emissions99$Emissions, na.rm = TRUE), 
                                  sum(baltimore_city_emissions02$Emissions, na.rm = TRUE),
                                  sum(baltimore_city_emissions05$Emissions, na.rm = TRUE),
                                  sum(baltimore_city_emissions08$Emissions, na.rm = TRUE)))

#Open device
png(filename = "plot2.png", width = 480, height = 480, units='px')

#Generate Bar Plot of total emissions by year
barplot(baltimore_city_total_emissions$Total_emissions, names=baltimore_city_total_emissions$years, main="Total PM2.5 emissions (Tons) in Baltimore City, MD", xlab="Year", ylab="Total PM2.5 emissions in Tons in Baltimore City (MD)")

#Close device
dev.off()

#Clean up data after running the analysis
if(dir.exists('NEI_data/')){
  file.remove("NEI_data/Source_Classification_Code.rds")
  file.remove("NEI_data/summarySCC_PM25.rds")
  file.remove('NEI_data/', recursive=TRUE)
}
file.remove("NEI_data.zip")

