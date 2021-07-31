powData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")

powDataRange <- subset(powData, powData$Date=="1/2/2007"|powData$Date=="2/2/2007")
dev.cur()
hist(powDataRange$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, filename = "./plot1.png", width = 480, height = 480, units = "px", bg = "white")
dev.off()


