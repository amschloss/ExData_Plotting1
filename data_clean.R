# Download and clean the data up a bit before we plot it

# Download and extract the base data if that hasn't already happened
fullfilename <- "./data/household_power_consumption.txt"
if(!file.exists(fullfilename)) {
    zipname <- "power.zip"
    if(!file.exists(zipname)) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipname, mode="wb")
    }
    unzip(zipname, exdir = "./data")
}

# Read in the data
classes <- c(rep("character", 2), rep("numeric", 7))
fulltab <- read.table(fullfilename, header=T, sep=";", na.strings = "?", colClasses = classes)

# Subset
spectab <- subset(fulltab, Date %in% c("1/2/2007", "2/2/2007"))
spectab <- rbind(spectab, subset(fulltab, Date == "3/2/2007" & Time == "00:00:00")) # make sure we get Saturday at the end of our time plots

# Make the date/time columns actually a proper datetime
formDate <- strptime(spectab$Date, "%d/%m/%Y")
spectab$datetime <- as_datetime(paste(formDate, spectab$Time))
spectab <- spectab[, c(10, 3:9)]

# Write the cleaned subset out
write.csv(spectab, "./data/subset_power.csv", row.names = F)
