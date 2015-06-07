setwd("c:/users/behzad/desktop/Exploratory")
## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")
## Select the dates
selected.data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

selected.data$Global_active_power <- as.numeric(selected.data$Global_active_power)
png("plot1.png",  width = 480, height = 480, units = "px")
hist(selected.data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Golbal Active Power (kilowatts)")
dev.off()