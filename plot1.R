Data <- read.table('.\\household_power_consumption.txt', header = TRUE, sep = ';')

Data_Subset <- subset(Data, Data$Date=='1/2/2007'| Data$Date== '2/2/2007')

GlobalActivePower <- as.numeric(Data_Subset$Global_active_power)
hist(GlobalActivePower, col='red', main='Global Active Power', xlab='Global active Power (Kilowatts)')
dev.copy(png, file='plot1.png', width=480, height=480)
dev.off()