#Read data

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Merge between NEI and SCC

coalMatches  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)

SCC_coal <- SCC[coalMatches,]

NEI_SCC_merged <- merge(NEI,SCC_coal,by="SCC")


Emission_coal<- aggregate(Emissions ~ year, NEI_SCC_merged, sum)



#Plot

library(ggplot2)

ggplot(Emission_coal, aes(year, Emissions)) + geom_line() + geom_point() + xlab("year") + ylab("Total PM2.5 Emissions") + ggtitle("Changes in the Emissions from coal combustion-related sources.1999–2008")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
