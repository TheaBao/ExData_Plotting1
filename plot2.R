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
data$datetime<-strptime(paste(data$Date,data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480,units="px")
# plot data
plot(data$datetime,data$Global_active_power,
     ylab="Global Active Power (kilowatts)", xlab=" ", type="l")
x<-dev.off()