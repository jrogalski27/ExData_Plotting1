powerdata <- read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE, dec = ".")

febdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(febdata$Global_active_power)

png("Plot2.png", width = 480, height = 480, units = "px")
plot(datetime,GAP, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()