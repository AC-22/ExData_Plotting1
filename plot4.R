## getting the fourth plot of assignment
## Getting the Data
data<-read.csv("exdata-data-household_power_consumption//household_power_consumption.txt",sep=";",na.strings="?", stringsAsFactors=FALSE)

## Get the Data belonging to only 1st and 2nd of Feb
x<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
## get the date time in POSIX
dateTime  <- paste(as.Date(x$Date,format="%d/%m/%Y"), x$Time, sep=" ")
x$DateTime<-as.POSIXlt(dateTime)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(x,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(x,plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(x,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(x,lines(DateTime,Sub_metering_2,col='Red'))
with(x,lines(DateTime,Sub_metering_3,col='Blue'))
legend("topright",col=c("black","red","blue"),lty=1,lwd=1,bty="n",cex=0.5,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(x,plot(DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
## save the file in .png format
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()