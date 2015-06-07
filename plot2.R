setwd("c:/users/behzad/desktop/Exploratory")
## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")
selected.data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
selected.data$Global_active_power <- as.numeric(selected.data$Global_active_power)
## Set the date and time type
datetime <- strptime(paste(selected.data$Date, selected.data$Time), format = "%d/%m/%Y %H:%M:%S") 
## Plot
png("plot2.png",  width = 480, height = 480, units = "px")
plot(datetime, selected.data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
