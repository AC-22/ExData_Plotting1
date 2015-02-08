## plotting a histogram for the Global Active Power, in the month of feb
## and day is 1st and 2nd.

## Getting the Data
data<-read.csv("exdata-data-household_power_consumption//household_power_consumption.txt",sep=";",na.strings="?", stringsAsFactors=FALSE)
## Get the Data belonging to only 1st and 2nd of Feb
x<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
## Get the values of Global Active Power
plotx<-x[,"Global_active_power"]
## plotting the histogram
hist(plotx,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
## save the file in .png format
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()