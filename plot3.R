data <- read.csv('household_power_consumption.txt',  header = TRUE, sep = ";", dec = ".", colClasses = c('character', 'character', rep('numeric', 7)), na.strings = '?')

data1 <- subset(data, Date == '1/2/2007')

data2 <- subset(data, Date == '2/2/2007')

data3 <- rbind(data1, data2)

dtime <- strptime(with(data3, paste(Date, Time)), '%d/%m/%Y %H:%M:%S')

png("plot3.png", width = 480, height = 480)

plot(dtime, data3$Sub_metering_1, type="n", xlab = "",ylab = "Energy sub metering")

lines(dtime, data3$Sub_metering_1)

lines(dtime, data3$Sub_metering_2, col = "Red")

lines(dtime, data3$Sub_metering_3, col = "Blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),
       col=c("Black","Red", "Blue"), cex = 0.8)

dev.off()
