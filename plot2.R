library(data.table)

data <- fread("household_power_consumption.txt")
data <- data[(Date == "1/2/2007") | (Date == "2/2/2007"),]
data <- data[, Date := paste(Date,Time)]
date <- data[, Date := strptime(Date,format = "%d/%m/%Y %H:%M:%S")]
png("plot2.png", width = 480, height = 480)
plot(data$Date,as.numeric(data$Global_active_power), 
     type = "l", 
     xlab = "", 
     main = "Global Active Power",
     ylab = "Global Active Power (kilowatts)")
dev.off()
