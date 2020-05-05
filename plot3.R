library(data.table)

data <- fread("household_power_consumption.txt")
data <- data[(Date == "1/2/2007") | (Date == "2/2/2007"),]
data <- data[, Date := paste(Date,Time)]
date <- data[, Date := strptime(Date,format = "%d/%m/%Y %H:%M:%S")]
png("plot3.png", width = 480, height = 480)
with(data,{
     plot(Date,Sub_metering_1,
          type = "l", 
          xlab = "", 
          ylab = "Energy Sub Metering",
          col = "black")
     lines(Date,Sub_metering_2,
          col = "red")
     lines(Date,Sub_metering_3,
           col = "blue")
     legend("topright",
            c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            text.col = c("black","red","blue"))})
dev.off()
