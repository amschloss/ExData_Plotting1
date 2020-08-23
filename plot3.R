# Read in the cleaned-up data, which is generated if it doesn't already exist
datafile <- "./data/subset_power.csv"
if(!file.exists(datafile)) { source('./data_clean.R') }
plotdata <- read.csv(datafile)
plotdata$datetime <- strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S")
