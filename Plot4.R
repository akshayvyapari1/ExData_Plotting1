## reading the data 
 Ele_con = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

 ## extracting the data for first two days of Feb 2007
 two_days = Ele_con[Ele_con$Date %in% c("1/2/2007" , "2/2/2007"),]

 ## creating date and time column
two_days$Date = as.Date(two_days$Date, format="%d/%m/%Y")
datetime = paste(two_days$Date, two_days$Time)
class(datetime)
two_days$Date_and_time = strptime(datetime, format = ("%Y-%m-%d %H:%M:%S"))
head(two_days)
str(two_days)

## Plotting and saving the graph 
png("plot4.png", width=480, height=480)


par(mfrow=c(2,2))


## Graph 1
plot(x = two_days$Date_and_time, y = two_days$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Graph 2
plot(x = two_days$Date_and_time, y = two_days$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


## graph 3
plot(x = two_days$Date_and_time, y = two_days$Sub_metering_1, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", col = "Black")
lines(x = two_days$Date_and_time, y = two_days$Sub_metering_2, col = "Red")
lines(x = two_days$Date_and_time, y = two_days$Sub_metering_3, col = "Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5, bty = "n")

## Graph 4
plot(x = two_days$Date_and_time, y = two_days$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
