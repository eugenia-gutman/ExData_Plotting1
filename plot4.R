setwd('C:/Users/eugenia/Documents/GitHub/ExData_Plotting1/')
if (!file.exists('./data')) {dir.create('./data')}
  
  
download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = './data/Fhousehold_power_consumption.zip')
unzip(zipfile='./data/Fhousehold_power_consumption.zip', exdir = './data')
data <- read.table('./data/household_power_consumption.txt', sep=';', header = TRUE)
head(data)
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data$DateTime <- strptime(paste(data$Date,data$Time), '%Y-%m-%d %H:%M:%S')
data <- subset(data, Date>= '2007-02-01' & Date<='2007-02-02')
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data@Voltage <- as.numeric(as.character(data$Voltage))

png(file = 'plot4.png', width = 480, height = 480, units = "px")

par(mfrow=c(2,2), mar=c(4,4,2,2))

with(data, plot(DateTime, Global_active_power, type = 'l', lwd = 2, xlab = '', ylab = 'Global Active Power'))

with(data, plot(DateTime, Voltage, type = 'l', lwd = 2, xlab = 'datetime'))

with(data, plot(DateTime, Sub_metering_1, type = 'l', lwd = 2, xlab = '', ylab = 'Energy sub merging'))
with(data, points(DateTime, Sub_metering_2, type = 'l', lwd = 2, col = 'red'))
with(data, points(DateTime, Sub_metering_3, type = 'l', lwd = 2, col = 'blue'))

legend('topright', lwd=2, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

with(data, plot(DateTime, Global_reactive_power, type = 'l', lwd = 2, xlab = 'datetime'))

dev.off()

