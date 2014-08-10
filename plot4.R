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

## create a frame for the graph panel and set to store as a PNG file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## plot the graps for the panel

## plot [1,1]
plot(pwr$DateTime, pwr$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

## plot [1,2]
plot(pwr$DateTime, pwr$Voltage, type="l", xlab="datetime", ylab="Voltage")

## plot [2,1]
plot(pwr$DateTime, pwr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(pwr$DateTime, pwr$Sub_metering_2, type="l", col="red")
lines(pwr$DateTime, pwr$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), bty="n")

## plot [2,2]
plot(pwr$DateTime, pwr$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()