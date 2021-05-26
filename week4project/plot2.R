# load data
SCC <- readRDS("Source_Classification_Code.rds")
sumSCC <- readRDS("summarySCC_PM25.rds")

# select specified data
maryland <- subset(sumSCC,sumSCC$fips == 24510)
total_maryland <- aggregate(Emissions ~ year, maryland, sum)

# plot
png("plot2.png",height = 480,width = 480)
barplot(total_maryland$Emissions,names.arg = total_maryland$year,
        xlab = "year",ylab = "Emissions",col = "blue",
        main = "total emissions in maryland every year")
dev.off()

