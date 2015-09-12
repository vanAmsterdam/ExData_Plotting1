
# Initialization ----------------------------------------------------------
setwd('/Users/vanAmsterdam/Dropbox/coursera/project1/files')
file.name <- "household_power_consumption.txt"
df <- read.table(file.name, sep = ';', na.strings = '?', skip = 66637, nrows = 2880, header = F)
heads <- colnames(read.table(file.name, sep = ';', na.strings = '?', nrows = 1, header = T))
colnames(df) <- heads
df$Time <- with(df, strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %T"))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
par(mfcol=c(1,1))

# Plot --------------------------------------------------------------------
png("plot4.png")
par(mfcol = c(2, 2))
with(df, {
  plot(x=Time, y=Global_active_power, type = 'l', xlab='', ylab = 'Global Active Power (kilowatts)')
  plot(x = Time, y = Sub_metering_1, type = 'l', ylab = 'Energy sub metering')
  lines(x = Time, y = Sub_metering_2, type = 'l', col = 'red')
  lines(x = Time, y = Sub_metering_3, type = 'l', col = 'blue')
  plot(x = Time, y = Voltage, type = 'l', xlab = 'datetime')
  plot(x = Time, y = Global_reactive_power, type = 'l', xlab = 'datetime')
})
dev.off()
