# load data
SCC <- readRDS("Source_Classification_Code.rds")
sumSCC <- readRDS("summarySCC_PM25.rds")

# select specified data
v2 <- SCC[grep(pattern="Vehicles",SCC$EI.Sector),]
v2 <- as.character(v2$SCC)
data_vih <- sumSCC[which(sumSCC$SCC %in% v2),]
data_Bal <- subset(data_vih,fips == "24510")
data_Los <- subset(data_vih,fips == "06037")
data <- rbind(data_Bal,data_Los)
newdat <- aggregate(Emissions ~ year + fips, data, sum)

# plot
library(ggplot2)
png("plot6.png",height = 480,width = 480)
p <- ggplot(newdat, aes(year, Emissions, color = fips))
p <- p + geom_line() +
  xlab("year") +
  ylab("vehicle emissions") +
  ggtitle("vihecle emissions between Los Angeles and Baltimore City")
print(p)
dev.off()

