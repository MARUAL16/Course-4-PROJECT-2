#Read data

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

#Select the data 

BALTIMORE_ONROAD<- subset(NEI,fips=="06037" & type=="ON-ROAD")

BALTIMORE_ONROAD<- aggregate(Emissions ~ year, BALTIMOREvsLA, sum)


#Plot

library(ggplot2)

ggplot(BALTIMORE_ONROAD, aes(year, Emissions)) + geom_line() + geom_point() + xlab("year") + ylab("Total PM2.5 Emissions") + ggtitle("Changes in the Emissions from motor vehicles in Baltimore City")

dev.copy(png, file = "plot5.png", height = 480, width = 480)
dev.off()
