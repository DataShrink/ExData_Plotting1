plot2<-function(file="household_power_consumption.txt") {
  data<-read.table(file, header=TRUE, sep=";", na.strings="?", colClasses=c(Time="character", Date="character"))
  data<-transform(data, Date=as.Date(Date,"%d/%m/%Y"))
  data<-merge(subset(data, Date==as.Date("2007-02-01")), subset(data, Date==as.Date("2007-02-02")), all=TRUE)
  data$DateTime <- as.POSIXct(paste(as.character(data$Date), data$Time), format = "%Y-%m-%d %H:%M:%S") 

  png(filename="plot2.png")
  plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
  dev.off()
}