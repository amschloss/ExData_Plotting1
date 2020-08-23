# Read in the cleaned-up data, which is generated if it doesn't already exist
datafile <- "./data/subset_power.csv"
if(!file.exists(datafile)) { source('~/R/explor-analysis-project1/data_clean.R') }
plotdata <- read.csv(datafile)

