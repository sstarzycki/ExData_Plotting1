data <- read.csv("household_power_consumption.txt", sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na.strings="?")
filtered_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# Default width and height 480px, transparent background as in figure subdirectory.
png(filename="plot1.png", bg="transparent")

with(filtered_data,
     hist(Global_active_power, col="red",
          main="Global Active Power",
          xlab = "Global Active Power (kilowatts)"))
dev.off()