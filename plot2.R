library(lubridate)

data <- read.csv("household_power_consumption.txt", sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na.strings="?")

filtered_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
filtered_data["DateTime"] <- with(filtered_data, dmy_hms(paste(Date, Time)))

# Default width and height 480px, transparent background as in figure subdirectory.
png(filename="plot2.png", bg="transparent")

with(filtered_data, plot(DateTime, Global_active_power, type="n", xlab="",
                         ylab = "Global Active Power (kilowatts)"))

with(filtered_data, lines(DateTime, Global_active_power))
dev.off()