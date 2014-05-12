library(lubridate);
library(sqldf);
e <- read.table("household_power_consumption.txt", header=T, sep=";")
e <- sqldf("select * from e where Date='1/2/2007' or Date='2/2/2007'")
datetime <- dmy_hms(paste(e$Date, e$Time))
e <- cbind(e, datetime)
png(file="plot4.png");

par(mfrow=c(2, 2))

#top left
plot(e$datetime, e$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l");

#top right
plot(e$datetime, e$Voltage, type="l", xlab="datetime", ylab="Voltage")

#bottom left
with(e, plot(datetime, Sub_metering_1, type="n"))
with(e, points(datetime, Sub_metering_1, type="l", col="black"))
with(e, points(datetime, Sub_metering_2, type="l", col="red"))
with(e, points(datetime, Sub_metering_3, type="l", col="blue"))

#bottom right
plot(e$datetime, e$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off();