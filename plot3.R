# load data
alldata <- read.table("household_power_consumption.txt",stringsAsFactors = F,header = T,sep = ";")

# change format of Date
alldata$fulltime <- strptime(paste(alldata$Date, alldata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

# select specified rows
newd1<-alldata[grep(pattern = "2007-02-01",alldata[,10]),]
newd2<-alldata[grep(pattern = "2007-02-02",alldata[,10]),]
newdata <- rbind(newd1,newd2)
str(newdata)
newdata$Sub_metering_1 <- as.numeric(newdata$Sub_metering_1)
newdata$Sub_metering_2 <- as.numeric(newdata$Sub_metering_2)
newdata$Sub_metering_3 <- as.numeric(newdata$Sub_metering_3)

# plot
png("plot3.png",height = 480,width = 480)
with(newdata, plot(fulltime, Sub_metering_1, type="l", col="black",xlab="Day", ylab="Energy sub metering"))
lines(newdata$fulltime, newdata$Sub_metering_2,type="l", col= "red")
lines(newdata$fulltime, newdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
