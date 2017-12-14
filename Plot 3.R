#Read data

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

dataBaltimore <- subset(NEI,NEI$fips=="24510")

dataBaltimore <- aggregate(Emissions ~ year + type, dataBaltimore, sum)


ggplot(dataBaltimore, aes(year, Emissions, color = type))+ geom_line() + xlab("year") +
  ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions in Baltimore City from 1999 to 2008")


dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
