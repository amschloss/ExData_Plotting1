# Read in the cleaned-up data, which is generated if it doesn't already exist
datafile <- "./data/subset_power.csv"
if(!file.exists(datafile)) { source('~/R/explor-analysis-project1/data_clean.R') }
plotdata <- read.csv(datafile)

png("plot1.png")
hist(plotdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
