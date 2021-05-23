# load data
alldata <- read.table("household_power_consumption.txt",stringsAsFactors = F,header = T,sep = ";")

# change format of Date
alldata$fulltime <- strptime(paste(alldata$Date, alldata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

# select specified rows
newd1<-alldata[grep(pattern = "2007-02-01",alldata[,10]),]
newd2<-alldata[grep(pattern = "2007-02-02",alldata[,10]),]
newdata <- rbind(newd1,newd2)
str(newdata)
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

# plot
png("plot2.png",height = 480,width = 480)
with(newdata, plot(fulltime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()
