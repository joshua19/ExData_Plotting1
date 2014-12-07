#The code below only works with dplyr,tidyr, lubridate

library(dplyr)
library(tidyr)
library(lubridate)

#setwd("~GitHub/ExData_Plotting1")

Data <- read.csv("household_power_consumption.txt",sep = ";")
Data <- select(Data,1:3)
Data <- mutate(Data, Date = dmy(Date))
Data <- filter(Data, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
hist(as.numeric(as.character(Data$Global_active_power)),col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.copy(png,filename="plot1.png")
dev.off ()