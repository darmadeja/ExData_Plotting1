# Initialize the Libraries
library(data.table)
library(sqldf)

# read the household power consumption data filtered by the date "1/2/2007" & "2/2/2007"
powerconsumption <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")

#Clear the current plot wondow
dev.off()

#Set backgroud to Grey
par(bg="grey87")

#Plot the histogram in the Screen Device
hist(powerconsumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Copy the histogram to the PNG file device.
dev.copy(png, file="plot1.png")

#Close the PNG file device.
dev.off()