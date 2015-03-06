library("data.table")
#extract data
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataUrl,destfile="household_power_consumption.zip")
unzip(zipfile="household_power_consumption.zip")
#read data
var_class<-c("character","character",rep("numeric",7))
data<-read.table("household_power_consumption.txt",header=TRUE,
                 sep=";",na.strings="?",colClasses=var_class)
data<-data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

png(filename="plot1.png",width=480,height=480,units="px")
# plot data
hist(data$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
x<-dev.off()