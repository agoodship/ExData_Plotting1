
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

hist(condensePower$Global_active_power, 
     main = "Global Active Power",
     col = "red", 
     ylab = "Frequency", 
     xlab = "Global Active Power (in kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()