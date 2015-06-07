setwd("c:/users/behzad/desktop/Exploratory")
## read data
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")
## set the date and time type and other parameters as numeric
  selected.data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  datetime <- strptime(paste(selected.data$Date, selected.data$Time), format = "%d/%m/%Y %H:%M:%S")
  selected.data$Global_active_power <- as.numeric(selected.data$Global_active_power)
  selected.data$Voltage <- as.numeric(selected.data$Voltage)
  selected.data$Global_reactive_power <- as.numeric(selected.data$Global_reactive_power)
## Plot
  png("plot4.png",  width = 480, height = 480, units = "px")
  par(mfrow = c(2,2))
  plot(datetime, selected.data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(datetime, selected.data$Global_active_power, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(datetime, selected.data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(datetime, selected.data$Sub_metering_2, type = "l", col = "red")
  points(datetime, selected.data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), bty = "n", lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75
  plot(datetime, selected.data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()