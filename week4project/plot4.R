# load data
SCC <- readRDS("Source_Classification_Code.rds")
sumSCC <- readRDS("summarySCC_PM25.rds")

# select specified data
v1 <- SCC[grep(pattern="Coal",SCC$EI.Sector),]
v1 <- as.character(v1$SCC)
data_coal <- sumSCC[which(sumSCC$SCC %in% v1),]
total_coal <- aggregate(Emissions ~ year , data_coal, sum)

# plot
library(ggplot2)
png("plot4.png",height = 480,width = 480)
p <- ggplot(total_coal, aes(factor(year), Emissions))
p <- p + geom_bar(stat='identity',fill="red") +
  xlab("year") +
  ylab("total emissions") +
  ggtitle("total emissions of coal combustion in USA every year")
print(p)
dev.off()

