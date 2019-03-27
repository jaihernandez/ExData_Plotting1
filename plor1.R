library("data.table")

setwd("~/Work/Training/Data Science Coursera/4-Data Analysis/Project")

#read using data table package
mainDF <- data.table::fread(input = "../household_power_consumption.txt"
                             , na.strings="?"
)

mainDF$Global_active_power <- as.numeric(mainDF$Global_active_power)

# Change Date Column to Date Type
mainDF$Date <- as.Date(mainDF$Date, "%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02
mainDF <- mainDF[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(mainDF$Global_active_power , main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()