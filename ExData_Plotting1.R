# Load necessary library
library(dplyr)

# Read the data
data <- read.table("C:\\Users\\onuru\\OneDrive\\Belgeler\\GitHub\\ExData_Plotting1\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Filter data for the specified dates
data <- data %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))

# Convert Date and Time to DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot 1: Histogram of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

# Plot 2: Time series of Global Active Power (with custom x-axis)
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis.POSIXct(1, at = seq(min(data$DateTime), max(data$DateTime), by = "day"), format = "%a")
dev.off()

# Plot 3: Energy sub-metering
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()

# Plot 4: Multi-panel plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2: Voltage
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3: Energy sub-metering
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# Plot 4: Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()