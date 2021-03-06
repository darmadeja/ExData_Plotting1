# Initialize the Libraries
library(data.table)
library(sqldf)
library(lubridate)

# read the household power consumption data filtered by the date "1/2/2007" & "2/2/2007"
powerconsumption <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")

#Clear the current plot wondow
dev.off()

#Create another attribute called datetime to convert the current date & time elements to a proper "datetime" format.
powerconsumption$datetime <- dmy_hms(paste(powerconsumption$Date, powerconsumption$Time, sep = " "), tz="America/Los_Angeles", locale = Sys.getlocale("LC_TIME"))

#Open plot3.png file device
png(file="plot3.png")

#Set backgroud to Grey
par(bg="grey87")

#Plot the Sub_metering_1 first and then add 2 & 3 using points function
with(powerconsumption, plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(powerconsumption, points(datetime, Sub_metering_2, col = "red", type ="l"))
with(powerconsumption, points(datetime, Sub_metering_3, col = "blue", type ="l"))
legend("topright", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

#Close the PNG file device.
dev.off()