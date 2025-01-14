powData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")

powDataRange <- subset(powData, powData$Date=="1/2/2007"|powData$Date=="2/2/2007")
powDataRange$DT <- paste(powDataRange$Date, powDataRange$Time)
powDataRange$DT <- strptime(powDataRange$DT, format = "%d/%m/%Y %H:%M:%S")               
dev.cur()
par(mfrow = c(2,2), cex=0.7)
with(powDataRange, plot(DT, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power"))
with(powDataRange, plot(DT,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(powDataRange, plot(DT,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, max(powDataRange$Sub_metering_1, powDataRange$Sub_metering_2,powDataRange$Sub_metering_3))))
par(new=TRUE)
with(powDataRange, lines(DT,Sub_metering_2, type = "l", col = "red"))
par(new=TRUE)
with(powDataRange, lines(DT,Sub_metering_3, type = "l", col = "blue"))
par(new=TRUE)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 1.5, col=c("black", "red", "blue"))
with(powDataRange, plot(DT, Global_reactive_power, type = "l", xlab = "datetime", ylab ="Global_reactive_power"))
dev.copy(png, filename = "./plot4.png", width = 480, height = 480, units = "px", bg = "white")
dev.off()