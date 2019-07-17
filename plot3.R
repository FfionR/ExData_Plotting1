Data <- read.table('.\\household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors=FALSE, dec='.')

Data_Subset <- subset(Data, Data$Date=='1/2/2007'| Data$Date== '2/2/2007')

Date_time <- strptime(paste(Data_Subset$Date, Data_Subset$Time, sep = ' '), format= '%d/%m/%Y %H:%M:%S')

plot(Date_time, as.numeric(Data_Subset$Sub_metering_1), type='l', ylab = 'Energy Submetering', xlab=' ')
lines(Date_time, as.numeric(Data_Subset$Sub_metering_2), type='l', col='red')
lines(Date_time, as.numeric(Data_Subset$Sub_metering_3), type='l', col='blue')

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3' ), col= c('black', 'red', 'blue'), lty=1)


dev.copy(png, file='plot3.png', width=480, height=480)
dev.off()

