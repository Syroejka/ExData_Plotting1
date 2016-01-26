data<-read.table("household_power_consumption.txt", sep=";")
newdata<-data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
newdata$V1<-as.Date(newdata$V1, "%d/%m/%Y")
newdata$timestamp=format(as.POSIXct(paste(newdata$V1, newdata$V2)), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), mar=c(4,4,0.5,0.5), oma=c(1.5,2,1,1))

newdata$V3<-as.numeric(as.character(newdata$V3))
plot(newdata$timestamp, newdata$V3, type="l", ylab="Global active power", xlab=NA)


newdata$V5<-as.character(newdata$V5)
plot(newdata$timestamp, newdata$V5, type="l", ylab="Voltage", xlab="datetime")


newdata$V7<-as.character(newdata$V7)
newdata$V8<-as.character(newdata$V8)
newdata$V9<-as.character(newdata$V9)
plot(newdata$timestamp, newdata$V7, type="l", ylab="Energy sub metering", xlab=NA)
lines(newdata$timestamp, newdata$V8, type="l", col="red")
lines(newdata$timestamp, newdata$V9, type="l", col="blue")
legend('topright',  c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue","red"))


newdata$V4<-as.character(newdata$V4)
plot(newdata$timestamp, newdata$V4, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, 'plot4.png', height=480, width=480)
dev.off()