# Read and format data
file <- "household_power_consumption.txt"
df <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
df$Time <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Change locale to print day names in english
lc_time <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")

# Make plot 4
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2), cex.axis=0.83, cex.lab=0.83)
# plot 4.1
with(df, plot(Time, Global_active_power, type="l", xlab="",
              ylab="Global Active Power"))
# plot 4.2
with(df, plot(Time, Sub_metering_1, type="l", xlab="",
              ylab="Energy sub metering", col="black"))
with(df, lines(Time, Sub_metering_2, col="red"))
with(df, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), cex=0.83, bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# plot 4.3
with(df, plot(Time, Voltage, type="l", xlab="datetime"))
# plot 4.4
with(df, plot(Time, Global_reactive_power, type="l", xlab="datetime"))
dev.off()

# Change locale back to default
Sys.setlocale("LC_TIME", lc_time)