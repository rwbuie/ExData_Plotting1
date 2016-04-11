#Read and subset data

dataset<-read.csv2("household_power_consumption.txt")
subset<-subset(dataset, Date=="2/1/2007" | Date=="2/2/2007")

subset$Sub_metering_2<- as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3<- as.numeric(subset$Sub_metering_3)
subset$Sub_metering_1<- as.numeric(subset$Sub_metering_1)
subset$Date<-as.Date(subset$Date, format="%m/%d/%Y")
subset$Time<-as.POSIXct(paste(subset$Date,subset$Time, format="%H:%M:%S"))

png("plot2.png")
plot(subset$Time, as.numeric(subset$Global_active_power), type="l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()