## getting the second plot of assignment
## Getting the Data
data<-read.csv("exdata-data-household_power_consumption//household_power_consumption.txt",sep=";",na.strings="?", stringsAsFactors=FALSE)

## Get the Data belonging to only 1st and 2nd of Feb
x<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
## Get the values of Global Active Power
plotx<-x[,"Global_active_power"]
## get the date time in POSIX
dateTime  <- as.POSIXlt(paste(as.Date(x$Date,format="%d/%m/%Y"), x$Time, sep=" "))
## plot the data
plot(dateTime,plotx,xlab="",ylab="Global Active Power (kilowatts)",type="l")
## save the file in .png format
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()