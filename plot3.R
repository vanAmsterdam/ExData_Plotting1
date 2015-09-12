
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
png("plot3.png")
with(df, {plot(x = Time, y = Sub_metering_1, type = 'l', ylab = 'Energy sub metering')
  lines(x = Time, y = Sub_metering_2, type = 'l', col = 'red')
  lines(x = Time, y = Sub_metering_3, type = 'l', col = 'blue')
})
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty = 1)
dev.off()
