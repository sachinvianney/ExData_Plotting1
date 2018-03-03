##PLOT 4

#Reading data
library(graphics)
setwd("C:\\Users\\mahe\\Desktop\\Course4")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)

#Subsetting Data
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#COnverting to time
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plotting the data 
par(mfrow = c(2, 2))
#plot1
with(data1, plot(data1$Time,data1$Global_active_power,type = "l" ,xlab = "", ylab = "Global Active Power"))
#plot2
with(data1, plot(data1$Time,data1$Voltage,type = "l" ,xlab = "datetime", ylab = "Voltage"))
#plot3
plot(data1$Time,data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering", main = "Energy sub metering")
with(data1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
#legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.25)
#plot4
with(data1, plot(data1$Time,data1$Global_reactive_power,type = "l",xlab = "datetime", ylab = "Global Reactive Power"))
dev.copy(png, file = "C:\\Users\\mahe\\Desktop\\Submissions\\plot4.png")
dev.off()