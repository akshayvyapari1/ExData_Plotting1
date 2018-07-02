 Ele_con = read.table("C:/R - Coursera/EDA/Week1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## reading the data 
 Ele_con = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## extracting the data for first two days of Feb 2007
 two_days = Ele_con[Ele_con$Date %in% c("1/2/2007" , "2/2/2007"),]
## reading the "Date" column in date format
two_days$Date = as.Date(two_days$Date)

## Plotting and saving the graph
png("plot1.png", width=480, height=480)
hist(two_days$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
 