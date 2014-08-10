## import the data to R
data <- read.csv("household_power_consumption.txt", sep = ";", 
                 stringsAsFactors=F, na.strings="?")

## subset the desired date range
pwr <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Convert the Date column from char to Date class
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")

## Create a PNG of the hitogram plot
png("plot1.png", width=480, height=480)
hist(pwr$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()