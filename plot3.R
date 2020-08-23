# Read in the cleaned-up data, which is generated if it doesn't already exist
datafile <- "./data/subset_power.csv"
if(!file.exists(datafile)) { source('./data_clean.R') }
plotdata <- read.csv(datafile)
plotdata$datetime <- strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S")

# Generate plot 3 - sub metering over time
png("plot3.png")
with(plotdata, {
    plot(datetime, Sub_metering_1, type = "l", xlab = "", 
         ylab = "Energy sub metering")
    points(datetime, Sub_metering_2, type = "l", col = "red")
    points(datetime, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
dev.off()
