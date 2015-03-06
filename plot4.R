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
data$date<-as.Date(data$Date,format="%d/%m/%Y")
data$datetime<-strptime(paste(data$Date,data$Time, sep = " "), 
                        format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
#plot data
#subplot 1,1
with(data, plot(data$datetime, data$Global_active_power, type = "n",xlab ="", 
                ylab="Global Active Power"))
with(data, lines(data$datetime, data$Global_active_power))

#subplot 2,1
with(data, plot(data$datetime, data$Sub_metering_1, type = "n",xlab ="", 
                ylab="Energy sub metering"))
with(data, lines(data$datetime, data$Sub_metering_1,col="black"))
with(data, lines(data$datetime, data$Sub_metering_2,col="red"))
with(data, lines(data$datetime, data$Sub_metering_3,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

#subplot 1,2
with(data,plot(data$datetime, data$Voltage, type = "n", ylab = "Voltage",
               xlab = "datetime"))
with(data, lines(data$datetime, data$Voltage,col="black"))

#subplot 2,2
with(data,plot(data$datetime, data$Global_reactive_power,type = "n",
               ylab = "Globle_reactive_power", xlab = "datetime"))
with(data, lines(data$datetime, data$Global_reactive_power,col="black"))
x<-dev.off()