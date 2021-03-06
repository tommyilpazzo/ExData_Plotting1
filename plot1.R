# Sets workign directory
# setwd("D:/GitHub/datasciencecoursera/04_exploratory_data_analysis/week_1/course_project")

zipurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipname = "exdata-data-household_power_consumption.zip"
filename <- "household_power_consumption.txt"

# Retrieves zip file if itdoesn't exist
if(!file.exists(zipname)) {
    download.file(zipurl, zipname)
}

# Unzip file if itdoesn't exist
if(!file.exists(filename)) {
    unzip(zipname)
}

# Loads whole file.
# dataset = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Loads only rows from the dates 2007-02-01 and 2007-02-02.
library(sqldf)
filename <- "household_power_consumption.txt"
query <- "select * from file where Date == '1/2/2007' or Date == '2/2/2007'"
dataset <- read.csv.sql(filename, sql = query, sep = ";")

# Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
dataset$Date = as.Date(dataset$Date, "%d/%m/%Y")
dataset$Time = strptime(dataset$Time, "%H:%M:%S")

# Checks columns classes
# lapply(dataset, class)

# Generate plot on png device
png(file="plot1.png", width=480, height= 480)

hist(
    dataset$Global_active_power, 
    freq=TRUE, 
    col = "red", 
    main = "Global Active Power", 
    xlab="Global Active Power (kilowatts)"
)

dev.off()


