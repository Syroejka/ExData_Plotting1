data<-read.table("household_power_consumption.txt", sep=";")
newdata<-data[which(data$V1=="1/2/2007"|data$V1=="2/2/2007"),]
newdata$V3<-as.numeric(as.character(newdata$V3))
hist(newdata$V3, col="red",main="Global active power", xlab="Global active power (kilowatts)", 
     ylab="Frequency")
dev.copy(png, 'plot1.png', height=480, width=480)
dev.off()