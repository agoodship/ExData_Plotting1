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

plot(datetime, condensePower$Global_active_power, 
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()