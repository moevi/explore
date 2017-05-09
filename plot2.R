if(!file.exists('Data')) dir.create('Data')
fileUrl<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl,destfile = './Data/Individual_household_electric_power_consumption.zip')
unzip('./Data/Individual_household_electric_power_consumption.zip', exdir = './data')
files <- file('./Data/household_power_consumption.txt')


##List Files in Data Directory

list.files("Data")

data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')


## Plot2
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
png(filename = './Data/plot2.png' , width = 480, height = 480, units ="px")
plot(data$DateTime,data$Global_active_power,xlab =  , ylab = 'Global_active_power(kilowat',type ='l')
dev.off()