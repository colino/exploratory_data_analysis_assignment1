##
##  Assignment 1
##

options(stringsAsFactors=F)
dataset <- read.table(file="./Assignament1/household_power_consumption.txt",header=T,sep=";")


dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

minDate <- as.Date("2007-02-01")
maxDate <- as.Date("2007-02-02")
subset <- dataset[which(dataset$Date >= minDate & dataset$Date <= maxDate),]

rownames(subset) <- NULL

head(subset)

library(lubridate)
day <- as.character(wday(subset$Date, label=T, abbr=T))




subset$Time<-as.character(subset$Time)
datetime<-as.POSIXct(paste(subset$Date,subset$Time))

# plot 4

png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(as.numeric(subset$Global_active_power) ~ as.numeric(datetime) ,
     type="l",
     ylab="Global Active Power",
     xlab="",
     xaxt = "n")
axis(1, at = c(datetime[1],datetime[length(datetime)/2],datetime[length(datetime)]), labels =c("Thu", "Fri", "Sat" ))

plot(as.numeric(subset$Voltage) ~ as.numeric(datetime) ,
     type="l",
     ylab="Voltage",
     xlab="datetime",
     xaxt = "n")
axis(1, at = c(datetime[1],datetime[length(datetime)/2],datetime[length(datetime)]), labels =c("Thu", "Fri", "Sat" ))

plot(as.numeric(subset$Sub_metering_1) ~ as.numeric(datetime) ,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     xaxt = "n")
lines(as.numeric(subset$Sub_metering_2) ~ as.numeric(datetime), col="red")
lines(as.numeric(subset$Sub_metering_3) ~ as.numeric(datetime), col="blue")
axis(1, at = c(datetime[1],datetime[length(datetime)/2],datetime[length(datetime)]), labels =c("Thu", "Fri", "Sat" ))
legend("topright",pch="-",col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(as.numeric(subset$Global_reactive_power) ~ as.numeric(datetime) ,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime",
     xaxt = "n")
axis(1, at = c(datetime[1],datetime[length(datetime)/2],datetime[length(datetime)]), labels =c("Thu", "Fri", "Sat" ))
dev.off()
