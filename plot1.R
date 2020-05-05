library(data.table)

data <- fread("household_power_consumption.txt")
data <- data[(Date == "1/2/2007") | (Date == "2/2/2007"),]
data <- data[, Date := paste(Date,Time)]
date <- data[, Date := strptime(Date,format = "%d/%m/%Y %H:%M:%S")]
png("plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), 
     breaks = 12, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()