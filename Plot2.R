Data <- read.table('.\\household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors=FALSE, dec='.')

Data_Subset <- subset(Data, Data$Date=='1/2/2007'| Data$Date== '2/2/2007')


Date_time <- strptime(paste(Data_Subset$Date, Data_Subset$Time, sep = ' '), format= '%d/%m/%Y %H:%M:%S')


plot(Date_time, as.numeric(Data_Subset$Global_active_power), type='l', xlab='', ylab='Global Active Power (Kilowatts)')
dev.copy(png, file='plot2.png', width=480, height=480)
dev.off()