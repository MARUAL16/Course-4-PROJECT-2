#Read data

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# After of consult the meaning of the different source in the web of the "United States Environmental Protection Agency" (EPA), i´ve supposed that the motor vehicles belong to the "on-road" type. Hence, I'll select the data which belong to Baltimore and to the "On-road" Type

BALTIMOREvsLA<- subset(NEI,fips %in% c("06037", "24510") & type=="ON-ROAD")

BALTIMORE_LA <- aggregate(Emissions ~ year + fips, BALTIMOREvsLA, sum)

BALTIMORE_LA$fips=ifelse(BALTIMORE_LA$fips=="06037","Los Angeles","Baltimore City")


#plot 
library(ggplot2)

ggplot(BALTIMORE_LA, aes(year, Emissions, color = fips))+ geom_line() + xlab("year") +
  ylab("Total PM2.5 Emissions") + ggtitle("Motor vehicle emission variation in Baltimore and Los Angeles")


dev.copy(png, file = "plot6.png", height = 480, width = 480)
dev.off()

 


