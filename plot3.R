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

png("plot3.png")
plot(Data[,10],as.numeric(as.character(Data[,7])),type = "l",xlab = "Date/Time", ylab ="Energy sub metering")
lines(Data[,10],as.numeric(as.character(Data[,8])),col = "red")
lines(Data[,10],as.numeric(as.character(Data[,9])),col = "blue")
legend("topright",legend = c("sub_metering 1","sub_metering 2","sub_metering 3"),lwd = c(1,1,1),col = c("black","red", "blue"))


dev.off ()
