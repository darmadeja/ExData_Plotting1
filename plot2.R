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

#Set backgroud to Grey
par(bg="grey87")

#Plot the Global active power against Date and time in Screen Device
with(powerconsumption, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

#Copy the histogram to the PNG file device.
dev.copy(png, file="plot2.png")

#Close the PNG file device.
dev.off()
