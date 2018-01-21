powerdata <- read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE, dec = ".")

febdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
febdata$Global_active_power <- as.numeric(febdata$Global_active_power)

png("Plot1.png", width = 480, height = 480, units = "px")
hist(febdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")
dev.off()
