powerdata <- read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE, dec = ".")

febdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(febdata$Global_active_power)
GRP <- as.numeric(febdata$Global_reactive_power)
sm1 <- as.numeric(febdata$Sub_metering_1)
sm2 <- as.numeric(febdata$Sub_metering_2)
sm3 <- as.numeric(febdata$Sub_metering_3)
voltage <- as.numeric(febdata$Voltage)


png("Plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
#plot 1
plot(datetime, GAP, type = "l", xlab = "", ylab = "Global Active Power")
#plot 2
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot3
plot(datetime, sm1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, sm2, type = "l", col = "red")
lines(datetime, sm3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#plot 4
plot(datetime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


