fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("./data/household_power_consumption.txt")) 
{
  if(!file.exists("./data")) { dir.create("./data")}
  download.file(fileurl, destfile="./data/power_data.zip")
  unzip("./data/power_data.zip", overwrite = T, exdir = "./data")
}

data <- read.table("./data/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

histdata <- data[((data$Datetime >= '2007-02-01') & (data$Datetime <= '2007-02-03')),]

png("./data/plot3.png", width=480, height=480, bg="white") 

plot(histdata$Datetime, histdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(histdata$Datetime, histdata$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering",col = "red")
points(histdata$Datetime, histdata$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering",col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
