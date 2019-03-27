library("data.table")

setwd("~/Work/Training/Data Science Coursera/4-Data Analysis/Project")

#read using data table package
mainDF <- data.table::fread(input = "../household_power_consumption.txt"
                            , na.strings="?"
)

mainDF$Global_active_power <- as.numeric(mainDF$Global_active_power)

# Change Date Column to Date Type
# mainDF$DateTime <- as.Date(mainDF$Date, "%d/%m/%Y")

mainDF$DateTime <- as.POSIXct(paste(mainDF$Date, mainDF$Time), format = "%d/%m/%Y %H:%M:%S")

# Filter Dates for 2007-02-01 and 2007-02-02
mainDF <- mainDF[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(mainDF$DateTime, mainDF$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(mainDF$DateTime,mainDF$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(mainDF$DateTime, mainDF$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mainDF$DateTime, mainDF$Sub_metering_2, col="red")
lines(mainDF$DateTime, mainDF$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(mainDF$DateTime, mainDF$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()