##PLOT 1
#Reading data
setwd("C:\\Users\\mahe\\Desktop\\Course4")
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
#Subsetting Data
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data1$Global_active_power <- as.numeric(data1$Global_active_power)
#Plotting the data 
with(data1, hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency"))
dev.copy(png, file = "C:\\Users\\mahe\\Desktop\\Submissions\\plot1.png")
dev.off()
