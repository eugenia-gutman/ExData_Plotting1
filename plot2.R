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

png(file = 'plot2.png', width = 480, height = 480, units = "px")
par(mar=c(2,4,2,2))

with(data, plot(DateTime, Global_active_power, type = 'l', lwd = 2, xlab = '', ylab = 'Global Active Power (kilowatts)'))

dev.off()

