plot4<-function(file="household_power_consumption.txt"){
  data<-read.table(file, header=TRUE, sep=";", na.strings="?", colClasses=c(Time="character", Date="character"))
  data<-transform(data, Date=as.Date(Date,"%d/%m/%Y"))
  data<-merge(subset(data, Date==as.Date("2007-02-01")), subset(data, Date==as.Date("2007-02-02")), all=TRUE)
  data$DateTime <- as.POSIXct(paste(as.character(data$Date), data$Time), format = "%Y-%m-%d %H:%M:%S") 
  
  png(filename="plot4.png")
  par(mfcol=c(2,2))
  plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
  lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")
  plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(data$DateTime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
  dev.off()
}