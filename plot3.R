library(lubridate)

data <- read.csv("household_power_consumption.txt", sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na.strings="?")

filtered_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
filtered_data["DateTime"] <- with(filtered_data, dmy_hms(paste(Date, Time)))

# Default width and height 480px, transparent background as in figure subdirectory.
png(filename="plot3.png", bg="transparent")

with(filtered_data, plot(DateTime, Sub_metering_1, type="n", xlab="",
                         ylab = "Energy sub metering"))
with(filtered_data, lines(DateTime, Sub_metering_1))
with(filtered_data, lines(DateTime, Sub_metering_2, col="red"))
with(filtered_data, lines(DateTime, Sub_metering_3, col="blue"))
legend('topright', names(filtered_data)[7:9], col=c('black', 'red', 'blue'), lty=1)
dev.off()