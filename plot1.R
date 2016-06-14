data<-read.csv("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = FALSE,dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


## Subsetting the data
sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plotting
globalActivePower <- as.numeric(sub_data$Global_active_power)
hist(globalActivePower, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()