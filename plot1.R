# load data
alldata <- read.table("household_power_consumption.txt",stringsAsFactors = F,header = T,sep = ";")

# change format of Date
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

# select specified rows
newd1<-alldata[grep(pattern = "2007-02-01",alldata[,1]),]
newd2<-alldata[grep(pattern = "2007-02-02",alldata[,1]),]
newdata <- rbind(newd1,newd2)
str(newdata)
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

# plot
png("plot1.png",height = 480,width = 480)
hist(newdata$Global_active_power,col = "red",border = "black",main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",ylab = "Frequency")
dev.off()
