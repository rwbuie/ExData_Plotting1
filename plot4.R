#Read and subset data

dataset<-read.csv2("household_power_consumption.txt")
subset<-subset(dataset, Date=="2/1/2007" | Date=="2/2/2007")

subset$Sub_metering_2<- as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3<- as.numeric(subset$Sub_metering_3)
subset$Sub_metering_1<- as.numeric(subset$Sub_metering_1)
subset$Global_active_power<- as.numeric(subset$Global_active_power)
subset$Global_reactive_power<- as.numeric(subset$Global_reactive_power)
subset$Voltage<-as.numeric(subset$Voltage)

subset$Date<-as.Date(subset$Date, format="%m/%d/%Y")
subset$Time<-as.POSIXct(paste(subset$Date,subset$Time, format="%H:%M:%S"))
global<-subset$Sub_metering_2+subset$Sub_metering_3+subset$Sub_metering_1



png("plot4.png")
par(mfrow=c(2,2))
plot(subset$Time, as.numeric(subset$Global_active_power), type="l", ylab="Global Active Power", xlab="")
plot(subset$Time, as.numeric(subset$Voltage), type="l", ylab="Voltage", xlab="datetime")
plot(subset$Time, subset$Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", ylim=c(0,max(global)), col="blue")
lines(subset$Time,subset$Sub_metering_1, type="l", col="black")
lines(subset$Time,subset$Sub_metering_2, type="l", col="red")
legend("topright", c(as.character(names(subset[7:9]))), lty=c(1,1,1), col=c("black","red","blue", lwd=c(2,2,2)))
plot(subset$Time, subset$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.off()