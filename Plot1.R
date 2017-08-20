

## we load the dataset
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".")

library(lubridate)
library(dplyr)

test<-filter(data,dmy(data$Date)=="2007-02-01")
test1<-filter(data,dmy(data$Date)=="2007-02-02")
data<-rbind(test,test1)

data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Time<-hms(data$Time)

aaa<-with(data,as.numeric(as.character(Global_active_power)))
data$Global_active_power<-aaa
aaa<-with(data,as.numeric(as.character(Global_reactive_power)))
data$Global_reactive_power<-aaa
aaa<-with(data,as.numeric(as.character(Global_intensity)))
data$Global_intensity<-aaa
aaa<-with(data,as.numeric(as.character(Voltage)))
data$Voltage<-aaa
aaa<-with(data,as.numeric(as.character(Sub_metering_1)))
data$Sub_metering_1<-aaa
aaa<-with(data,as.numeric(as.character(Sub_metering_2)))
data$Sub_metering_2<-aaa
aaa<-with(data,as.numeric(as.character(Sub_metering_3)))
data$Sub_metering_3<-aaa

hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="Plot1.png")
dev.off()
