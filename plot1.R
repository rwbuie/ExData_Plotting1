#read and subset data

dataset<-read.csv2("household_power_consumption.txt")
subset<-subset(dataset, Date=="2/1/2007" | Date=="2/2/2007")

subset$Sub_metering_2<- as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3<- as.numeric(subset$Sub_metering_3)
subset$Sub_metering_1<- as.numeric(subset$Sub_metering_1)

png("plot1.png")
#build the depicted graph
hist(as.numeric(subset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()