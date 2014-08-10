## import the data to R
data <- read.csv("household_power_consumption.txt", sep = ";", 
                 stringsAsFactors=F, na.strings="?")

## subset the desired date range
pwr <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Convert the Date column from char to Date class
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")

## Add a column ofcombined Date and Time in POSIXct format
pwr$DateTime <- as.POSIXct(paste(pwr$Date, pwr$Time))
str(pwr)

## Create a line plot of GAP by DateTime and store as a PNG file
png("plot2.png", width=480, height=480)
plot(pwr$DateTime, pwr$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
