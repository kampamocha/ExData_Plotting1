# Read and format data
file <- "household_power_consumption.txt"
df <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
df$Time <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Make plot 1
png("plot1.png", width=480, height=480)
hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()