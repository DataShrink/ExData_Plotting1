plot1<- function(file="household_power_consumption.txt") {
  data<-read.table(file, header=TRUE, sep=";", na.strings="?", colClasses=c(Time="character", Date="character"))
  data<-transform(data, Date=as.Date(Date,"%d/%m/%Y"))
  data<-merge(subset(data, Date==as.Date("2007-02-01")), subset(data, Date==as.Date("2007-02-02")), all=TRUE)

  png(filename="plot1.png")
  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
  dev.off()
}