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

png("./data/plot1.png", width=480, height=480, bg="white") 

hist(histdata$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0,1200), xlim = c(0, 6), xaxp = c(0, 6, 3))

dev.off()



