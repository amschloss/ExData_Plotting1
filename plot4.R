# Read in the cleaned-up data, which is generated if it doesn't already exist
datafile <- "./data/subset_power.csv"
if(!file.exists(datafile)) { source('./data_clean.R') }
plotdata <- read.csv(datafile)
plotdata$datetime <- strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S")

# Every plot is a line plot, so wrap it in a function
lplot <- function(...) { plot(..., type = "l") }

# Generate plot 4 - 4 plots all together in a 2x2 matrix
png("plot4.png")
par(mfrow = c(2,2))
with(plotdata, {
    lplot(datetime, Global_active_power, xlab = "", 
                    ylab = "Global Active Power")
    lplot(datetime, Voltage)
    lplot(datetime, Sub_metering_1, xlab = "", 
         ylab = "Energy sub metering")
    points(datetime, Sub_metering_2, type = "l", col = "red")
    points(datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), lwd = 1, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    lplot(datetime, Global_reactive_power)
})
dev.off()
