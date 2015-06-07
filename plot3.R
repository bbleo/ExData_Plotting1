setwd("c:/users/behzad/desktop/Exploratory")
## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")
selected.data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
## set the date and time type
datetime <- strptime(paste(selected.data$Date, selected.data$Time), format = "%d/%m/%Y %H:%M:%S")
## Metering data type to numeric
    selected.data$Sub_metering_1 <- as.numeric(selected.data$Sub_metering_1)
    selected.data$Sub_metering_2 <- as.numeric(selected.data$Sub_metering_2)
    selected.data$Sub_metering_3 <- as.numeric(selected.data$Sub_metering_3)
## plot
    png("plot3.png",  width = 480, height = 480, units = "px")
    plot(datetime, selected.data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
## Plot the metering 2
    points(datetime, selected.data$Sub_metering_2, type = "l", col = "red")
##Plot metering 3
    points(datetime, selected.data$Sub_metering_3, type = "l", col = "blue")
## Legendsd    
    legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1)
dev.off()