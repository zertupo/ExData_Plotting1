

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

png(filename = "Plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

with(data,{
  plot(Global_active_power,type="l",ylab="Global active power")
  plot(Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(Sub_metering_1,type="l",xlab = "",ylab="Energy sub metering")
  lines(data$Sub_metering_2,col="red")
  lines(data$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power,type="l",ylab="Power reactive power",xlab = "datetime")
})


dev.off()
