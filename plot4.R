powerURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(powerURL, "./householdpower.zip", mode = "wb")
power <- unz("householdpower.zip", "household_power_consumption.txt")
powerData <- read.table(power, header = TRUE, sep = ";",
                        colClasses = c("character","factor","numeric",
                                       "numeric","numeric","numeric", 
                                       "numeric", "numeric", "numeric"), 
                        na.strings = "?")
powerData$Date = as.Date(powerData$Date, "%d/%m/%Y")
condensePower <- powerData[powerData$Date == c("2007-02-01","2007-02-02"),]

datetime1 <- paste(condensePower$Date, condensePower$Time, sep = ";")

datetime <- strptime(datetime1,"%Y-%m-%d;%H:%M:%S")

par(mfcol = c(2,2))
par(cex = 0.6)

plot(datetime, condensePower$Global_active_power, 
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(datetime, condensePower$Sub_metering_1, 
     type = "l",
     main = "",
     xlab = "",
     ylab = "Energy sub metering")

lines(datetime, condensePower$Sub_metering_2, type = "l", col = "red")
lines(datetime, condensePower$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col=c("black", "red", "blue"),
       bty = "n")

plot(datetime, condensePower$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(datetime, condensePower$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()