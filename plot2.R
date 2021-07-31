powData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")

powDataRange <- subset(powData, powData$Date=="1/2/2007"|powData$Date=="2/2/2007")
powDataRange$DT <- paste(powDataRange$Date, powDataRange$Time)
powDataRange$DT <- strptime(powDataRange$DT, format = "%d/%m/%Y %H:%M:%S")               
dev.cur()
plot(powDataRange$DT, powDataRange$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.copy(png, filename = "./plot2.png", width = 480, height = 480, units = "px", bg = "white")
dev.off()
     