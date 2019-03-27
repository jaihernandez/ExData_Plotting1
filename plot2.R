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

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = mainDF$DateTime
     , y = mainDF$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()