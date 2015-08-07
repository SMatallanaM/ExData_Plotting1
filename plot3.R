# Read data
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                      na.strings = "?")
# Subset data
df <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007", ]

# Merge date and time, change format, and add column to dataset
datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

# Plot
png("plot3.png", width = 480, height = 480)
with(df, plot(df$datetime, df$Sub_metering_1, type = "n", xlab = "", 
              ylab = "Energy sub metering"))
with(df, lines(df$datetime, df$Sub_metering_1, col = "black"))
with(df, lines(df$datetime, df$Sub_metering_2, col = "red"))
with(df, lines(df$datetime, df$Sub_metering_3, col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), col=c("black", "red", "blue"))
dev.off()