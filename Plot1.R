
#Read data

NEI <- readRDS("summarySCC_PM25.rds")


# Total of PM2.5 for all United States for the years 1999,2002,2005,2008

meanPM2.5 <- tapply(NEI$Emissions,NEI$year,sum)
dates <- c(1999,2002,2005,2008)

#Plot

plot(dates,meanPM2.5,type="l",lwd=2,xlab="year",ylab="Total PM2.5 emissions",main="Evolution of total PM2.5 emissions")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()


