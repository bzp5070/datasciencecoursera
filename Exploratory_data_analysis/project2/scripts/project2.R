## Exploratory data analysis Course Project 2

setwd("~/Desktop/data_science/Exploratory data analysis/project2/")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

names(SCC)
names(NEI)

NEI$sourceid <- paste(NEI$fips, NEI$SCC, sep=".")

emissions99 <- subset(NEI, year=="1999")
emissions02 <- subset(NEI, year=="2002")
emissions05 <- subset(NEI, year=="2005")
emissions08 <- subset(NEI, year=="2008")

boxplot(log10(emissions99$Emissions), log10(emissions02$Emissions), log10(emissions05$Emissions), log10(emissions08$Emissions), main="Total Emissions in the United States from 1999 to 2008", names=c("1999", "2002", "2005", "2008"))


baltimore_md <- subset(NEI, fips == "24510")
baltimore_md99 <- subset(baltimore_md, year=="1999")
baltimore_md02 <- subset(baltimore_md, year=="2002")
baltimore_md05 <- subset(baltimore_md, year=="2005")
baltimore_md08 <- subset(baltimore_md, year=="2008")

boxplot(log10(baltimore_md99$Emissions), log10(baltimore_md02$Emissions), log10(baltimore_md05$Emissions), log10(baltimore_md08$Emissions), main="Total Emissions in Baltimore City, MD from 1999 to 2008", names=c("1999", "2002", "2005", "2008"))

