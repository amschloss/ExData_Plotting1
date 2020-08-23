# Read in the cleaned-up data, which is generated if it doesn't already exist
datafile <- "./data/subset_power.csv"
if(!file.exists(datafile)) { source('./data_clean.R') }
plotdata <- read.csv(datafile)
plotdata$datetime <- strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S")

# Generate plot 2 - global active power over time
png("plot2.png")
with(plotdata, plot(datetime, Global_active_power, type = "l", xlab = "", 
                    ylab = "Global Active Power (kilowatts)"))
dev.off()
