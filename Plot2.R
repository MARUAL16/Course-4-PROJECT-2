#Read data

NEI <- readRDS("summarySCC_PM25.rds")


# Total of PM2.5 in the baltimore City

dataBaltimore <- subset(NEI,NEI$fips=="24510")
totalPM2.5 <- tapply(dataBaltimore$Emissions,dataBaltimore$year,sum)


dates <- c(1999,2002,2005,2008)

#Plot

plot(dates,totalPM2.5,type="l",lwd=2,xlab="year",ylab="Total PM2.5 emissions",main="Evolution of total PM2.5 emissions Baltimore")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
