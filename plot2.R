data<-read.table("household_power_consumption.txt", sep=";")
newdata<-data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
newdata$V1<-as.Date(newdata$V1, "%d/%m/%Y")
newdata$timestamp=format(as.POSIXct(paste(newdata$V1, newdata$V2)), "%d/%m/%Y %H:%M:%S")
newdata$V3<-as.numeric(as.character(newdata$V3))
plot(newdata$timestamp, newdata$V3, type="l", ylab="Global active power (kilowatts)", xlab=NA)

dev.copy(png, 'plot2.png', height=480, width=480)
dev.off()