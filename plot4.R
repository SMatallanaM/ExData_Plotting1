# Read data
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      na.strings = "?")
# Subset data
df <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007", ]

# Merge date and time, change format, and add column to dataset
datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

# Plot
png("plot4.png", width = 480, height = 480)
attach(df)
par(mfrow = c(2, 2))
plot(df$datetime, df$Global_active_power, xlab = "", 
               ylab = "Global Active Power (kilowatts)", type = "l")
plot(df$datetime, df$Voltage, xlab = "datetime", ylab = "Voltage",
         type = "l")
plot(df$datetime, df$Sub_metering_1, type = "n", xlab = "", 
              ylab = "Energy sub metering")
lines(df$datetime, df$Sub_metering_1, col = "black")
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", lty = c(1,1), col=c("black", "red", "blue"))
plot(df$datetime, df$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")
dev.off()