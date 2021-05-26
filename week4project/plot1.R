# load data
SCC <- readRDS("Source_Classification_Code.rds")
sumSCC <- readRDS("summarySCC_PM25.rds")

# calculate by year
data_year <- aggregate(Emissions ~ year, sumSCC, sum)

# plot
png("plot1.png",height = 480,width = 480)
plot(Emissions ~ year,data = data_year,type = "o", col = "red", xlab = "year", ylab = "Emissions",
     main = "total emissions every year")
dev.off()

