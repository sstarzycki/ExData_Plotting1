library(lubridate)

data <- read.csv("household_power_consumption.txt", sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na.strings="?")

filtered_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
filtered_data["datetime"] <- with(filtered_data, dmy_hms(paste(Date, Time)))

# Default width and height 480px, transparent background as in figure subdirectory.
png(filename="plot4.png", bg="transparent")

par(mfrow = c(2, 2))

# plot 1
with(filtered_data, plot(datetime, Global_active_power, type="n", xlab="",
                         ylab = "Global Active Power"))
with(filtered_data, lines(datetime, Global_active_power))

# plot 2
with(filtered_data, plot(datetime, Voltage, type="n"))
with(filtered_data, lines(datetime, Voltage))

# plot 3
with(filtered_data, plot(datetime, Sub_metering_1, type="n", xlab="",
                         ylab = "Energy sub metering"))
with(filtered_data, lines(datetime, Sub_metering_1))
with(filtered_data, lines(datetime, Sub_metering_2, col="red"))
with(filtered_data, lines(datetime, Sub_metering_3, col="blue"))
legend('topright', names(filtered_data)[7:9], col=c('black', 'red', 'blue'), lty=1, bty = "n")

# plot 4
with(filtered_data, plot(datetime, Global_reactive_power, type="n"))
with(filtered_data, lines(datetime, Global_reactive_power))

dev.off()