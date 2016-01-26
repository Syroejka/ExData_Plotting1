data<-read.table("household_power_consumption.txt", sep=";")
newdata<-data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
newdata$idx=c(1:2880)
newdata$V3<-as.numeric(as.character(newdata$V3))
plot(newdata$idx, newdata$V3, type="l", ylab="Global active power (kilowatts)", xaxt="n", xlab=NA)
axis(side=1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"))
dev.copy(png, 'plot2.png', height=480, width=480)
dev.off()