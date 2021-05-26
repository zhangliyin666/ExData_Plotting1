# load data
SCC <- readRDS("Source_Classification_Code.rds")
sumSCC <- readRDS("summarySCC_PM25.rds")

# select specified data
v2 <- SCC[grep(pattern="Vehicles",SCC$EI.Sector),]
v2 <- as.character(v2$SCC)
data_Bal <- sumSCC[which(sumSCC$SCC %in% v2),]
data_Bal <- subset(data_Bal,fips == 24510)
total_Bal <- aggregate(Emissions ~ year , data_Bal, sum)

# plot
library(ggplot2)
png("plot5.png",height = 480,width = 480)
p <- ggplot(total_Bal, aes(factor(year), Emissions))
p <- p + geom_bar(stat='identity',fill="#CC99FF") +
  xlab("year") +
  ylab("total emissions") +
  ggtitle("total emissions of vehicles in Baltimore City every year")
print(p)
dev.off()

