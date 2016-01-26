data<-read.table("household_power_consumption.txt", sep=";")
newdata<-data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
newdata$idx=c(1:2880)

par(mfrow = c(2, 2), mar=c(4,4,0.5,0.5), oma=c(1.5,2,1,1))

newdata$V3<-as.numeric(as.character(newdata$V3))
newdata$idx=c(1:2880)
plot(newdata$idx, newdata$V3, type="l", ylab="Global active power", xaxt="n", xlab=NA)
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"))

newdata$V5<-as.character(newdata$V5)
plot(newdata$idx, newdata$V5, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"))

newdata$V7<-as.character(newdata$V7)
newdata$V8<-as.character(newdata$V8)
newdata$V9<-as.character(newdata$V9)
plot(newdata$idx, newdata$V7, type="l", ylab="Energy sub metering", xaxt="n", xlab=NA)
lines(newdata$idx, newdata$V8, type="l", col="red")
lines(newdata$idx, newdata$V9, type="l", col="blue")
legend('topright',  c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue","red"))
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"))

newdata$V4<-as.character(newdata$V4)
plot(newdata$idx, newdata$V4, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"))

dev.copy(png, 'plot4.png', height=480, width=480)
dev.off()