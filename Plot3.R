#Reads data from the file
dfPower <- read.csv("household_power_consumption.txt", sep = ";", colClasses = "character")

#Filter the required date and remove big data frame
data1 <- subset(dfPower, dfPower$Date == "1/2/2007" | dfPower$Date == "2/2/2007")
rm("dfPower")

#Data conversion
data1$Time <- strptime(paste(data1$Date, data1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Sub_metering_1<- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)
data1$Voltage <- as.numeric(data1$Voltage)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)

#Plotting data to Plot3.png file.
png("plot3.png",width = 480, height = 480, units = "px")
with(data1, plot(Time, Sub_metering_1,  type = "n", ylab="Energy sub metering", xlab = ""))
lines( data1$Time, data1$Sub_metering_1, col = "black")
lines( data1$Time, data1$Sub_metering_2, col = "red")
lines( data1$Time, data1$Sub_metering_3, col = "blue")
legend("topright",  col=c("black", "red", "blue"), legen=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
dev.off()

