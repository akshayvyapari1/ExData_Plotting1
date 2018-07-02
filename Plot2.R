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
png("plot2.png", width=480, height=480)
plot(x = two_days$Date_and_time, y = two_days$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()


 