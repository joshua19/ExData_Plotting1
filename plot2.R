#The code below only works with dplyr,tidyr, lubridate
library(dplyr)
library(tidyr)
library(lubridate)

#setwd("~GitHub/ExData_Plotting1")

Data <- read.csv("household_power_consumption.txt",sep = ";")
Data <- select(Data,1:3)
Data <- mutate(Data, Date = dmy(Date))
Data <- filter(Data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
Data <- mutate(Data, Time = hms(Time))
Data <- mutate(Data, Date_Time = (Date + Time))
plot(Data[,4],as.numeric(as.character(Data[,3])), type = "l",ylab = "Global Active Power(Killowatts)",xlab = "Date/Time")

dev.copy(png,filename="plot2.png")
dev.off ()