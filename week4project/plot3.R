# load data
SCC <- readRDS("Source_Classification_Code.rds")
sumSCC <- readRDS("summarySCC_PM25.rds")

# select specified data
maryland <- subset(sumSCC,sumSCC$fips == 24510)
total_maryland <- aggregate(Emissions ~ year + type, maryland, sum)

# plot
library(ggplot2)
png("plot3.png",height = 480,width = 480)
p <- ggplot(total_maryland, aes(year, Emissions, color = type))
p <- p + geom_line() +
  xlab("year") +
  ylab("total emissions") +
  ggtitle("total emissions in Baltimore City every year")
print(p)
dev.off()

