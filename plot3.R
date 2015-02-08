## getting the third plot of assignment
## Getting the Data
data<-read.csv("exdata-data-household_power_consumption//household_power_consumption.txt",sep=";",na.strings="?", stringsAsFactors=FALSE)

## Get the Data belonging to only 1st and 2nd of Feb
x<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
## getting the data belonging to each sub meter 
PlotSubMtr1<-x[,"Sub_metering_1"]
PlotSubMtr2<-x[,"Sub_metering_2"]
PlotSubMtr3<-x[,"Sub_metering_3"]
## get the date time in POSIX
dateTime  <- as.POSIXlt(paste(as.Date(x$Date,format="%d/%m/%Y"), x$Time, sep=" "))
plot(dateTime,PlotSubMtr1,type="l",xlab="",ylab="Energy sub metering")
lines(dateTime,PlotSubMtr2,col='Red')
lines(dateTime,PlotSubMtr3,col='Blue')

legend("topright",col=c("black","red","blue"),lty=1,lwd=1,cex=0.6,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## save the file in .png format
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()