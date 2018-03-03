##PLOT 2
#Reading data
library(graphics)
setwd("C:\\Users\\mahe\\Desktop\\Course4")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
#Subsetting Data
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
#COnverting to time
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#Plotting the data 
with(data1, plot(data1$Time,data1$Global_active_power,type = "l" ,xlab = "", ylab = "Global Active Power (kilowatts)", main = "Global Active Power Vs Time"))
dev.copy(png, file = "C:\\Users\\mahe\\Desktop\\Submissions\\plot2.png")
dev.off()
