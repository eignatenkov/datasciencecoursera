rm(list=ls())

setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)), 
                   col.names=c("Date", "Time", "GlobalActivePower", "GlobalReactivePower",
                               "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3"),
                   skip=1440*45)
subdat <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

png("plot3.png", width=480, height=480)
plot(subdat$SubMetering1, xlab=NA, ylab="Energy sub metering", type="l", xaxt="n")
lines(subdat$SubMetering2, col="red")
lines(subdat$SubMetering3, col="blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"))
dev.off()


