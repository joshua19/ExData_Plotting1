#The code below only works with dplyr,tidyr, lubridate
library(dplyr)
library(tidyr)
library(lubridate)

#setwd("~GitHub/ExData_Plotting1")

Data <- read.csv("household_power_consumption.txt",sep = ";")
Data <- mutate(Data, Date = dmy(Date))
Data <- filter(Data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
Data <- mutate(Data, Time = hms(Time))
Data <- mutate(Data, Date_Time = (Date + Time))

png("plot4.png")
par(mfrow = c(2,2))
plot(Data[,10],as.numeric(as.character(Data[,3])), type = "l",ylab = "Global Active Power(Killowatts)",xlab = "Date/Time")
plot(Data[,10],as.numeric(as.character(Data[,5])), type = "l",ylab = "Voltage",xlab = "Date/Time")

plot(Data[,10],as.numeric(as.character(Data[,7])),type = "l",xlab = "Date/Time", ylab ="Energy sub metering")
lines(Data[,10],as.numeric(as.character(Data[,8])),col = "red")
lines(Data[,10],as.numeric(as.character(Data[,9])),col = "blue")
legend("topright",legend = c("sub_metering 1","sub_metering 2","sub_metering 3"),lwd = c(1,1,1),col = c("black","red", "blue"),border = "transparent")
plot(Data[,10],as.numeric(as.character(Data[,4])), type = "l",ylab = "Global_Reactive_Power",xlab = "Date/Time")

dev.off ()