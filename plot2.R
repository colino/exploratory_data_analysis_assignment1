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

# plot2



png(filename="plot2.png",width=480, height=480)
par(mar=c(6,6,4,4))
plot(as.numeric(subset$Global_active_power) ~ as.numeric(datetime) ,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     xaxt = "n")
axis(1, at = c(datetime[1],datetime[length(datetime)/2],datetime[length(datetime)]), labels =c("Thu", "Fri", "Sat" ))

dev.off()
