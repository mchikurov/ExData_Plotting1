data <- read.csv('household_power_consumption.txt',  header = TRUE, sep = ";", dec = ".", colClasses = c('character', 'character', rep('numeric', 7)), na.strings = '?')

data1 <- subset(data, Date == '1/2/2007')

data2 <- subset(data, Date == '2/2/2007')

data3 <- rbind(data1, data2)

dtime <- strptime(with(data3, paste(Date, Time)), '%d/%m/%Y %H:%M:%S')

png("plot2.png", width = 480, height = 480)

plot(dtime, data3$Global_active_power, pch = 46, xlab = "",ylab = "Global Active Power (kilowatts)")

lines(dtime, data3$Global_active_power)

dev.off()
