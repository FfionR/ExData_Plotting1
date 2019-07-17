Data <- read.table('.\\household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors=FALSE, dec='.')

Data_Subset <- subset(Data, Data$Date=='1/2/2007'| Data$Date== '2/2/2007')

Date_time <- strptime(paste(Data_Subset$Date, Data_Subset$Time, sep = ' '), format= '%d/%m/%Y %H:%M:%S')

par(mfrow = c(2,2))
## plot 1 
hist(as.numeric(Data_Subset$Global_active_power), col='red', main='Global Active Power', xlab='Global active Power (Kilowatts)')

## plot 2 
plot(Date_time, as.numeric(Data_Subset$Global_active_power), type='l', xlab='', ylab='Global Active Power (Kilowatts)')

## plot 3
plot(Date_time, as.numeric(Data_Subset$Sub_metering_1), type='l', ylab = 'Energy Submetering', xlab=' ')
lines(Date_time, as.numeric(Data_Subset$Sub_metering_2), type='l', col='red')
lines(Date_time, as.numeric(Data_Subset$Sub_metering_3), type='l', col='blue')

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3' ), col= c('black', 'red', 'blue'), lty=1)

## New Plot
plot(Date_time, as.numeric(Data_Subset$Global_reactive_power), type='l', xlab='datetime', ylab='Global_reactive_power')
     
dev.copy(png, file='plot4.png', width=480, height=480)

dev.off()