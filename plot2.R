# Read data
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                 na.strings = "?")
# Subset data
df <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007", ]

# Merge date and time, change format, and add column to dataset
datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

# Plot
png("plot2.png", width = 480, height = 480)
with(df, plot(df$datetime, df$Global_active_power, xlab = "", ylab = 
                  "Global Active Power (kilowatts)", type = "l"))
dev.off()