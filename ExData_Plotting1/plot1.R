rm(list=ls())

setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)), 
                   col.names=c("Date", "Time", "GlobalActivePower", "GlobalReactivePower",
                               "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3"),
                   skip=1440*45)
subdat <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

png(filename="plot1.png", width=480, height=480)
hist(subdat$GlobalActivePower, xlab="Global Active Power(kilowatts)", col="red", main="Global Active Power")
dev.off()


