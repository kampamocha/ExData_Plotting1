# Read and format data
file <- "household_power_consumption.txt"
df <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
df$Time <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Change locale to print day names in english
lc_time <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")

# Make plot 2
png("plot2.png", width=480, height=480)
with(df, plot(Time, Global_active_power, type="l", xlab="",
              ylab="Global Active Power (kilowatts)"))
dev.off()

# Change locale back to default
Sys.setlocale("LC_TIME", lc_time)
