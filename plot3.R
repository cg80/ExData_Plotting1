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

## Create a line plot, add 2 remianing plots and store as .PNG file
png("plot3.png", width=480, height=480)
plot(pwr$DateTime, pwr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pwr$DateTime, pwr$Sub_metering_2, type="l", col="red")
lines(pwr$DateTime, pwr$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()