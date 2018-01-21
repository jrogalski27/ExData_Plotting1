powerdata <- read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE, dec = ".")

febdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1 <- as.numeric(febdata$Sub_metering_1)
sm2 <- as.numeric(febdata$Sub_metering_2)
sm3 <- as.numeric(febdata$Sub_metering_3)


png("Plot3.png", width = 480, height = 480, units = "px")
plot(datetime, sm1, xlab = "", ylab = "Energy sub metering", type="l")
lines(datetime, sm2, type="l", col = "red")
lines(datetime, sm3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
