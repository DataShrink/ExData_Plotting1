plot3<-function(file="household_power_consumption.txt"){
  data<-read.table(file, header=TRUE, sep=";", na.strings="?", colClasses=c(Time="character", Date="character"))
  data<-transform(data, Date=as.Date(Date,"%d/%m/%Y"))
  data<-merge(subset(data, Date==as.Date("2007-02-01")), subset(data, Date==as.Date("2007-02-02")), all=TRUE)
  data$DateTime <- as.POSIXct(paste(as.character(data$Date), data$Time), format = "%Y-%m-%d %H:%M:%S") 
  
  png(filename="plot3.png")
  plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
  lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
  dev.off()
}