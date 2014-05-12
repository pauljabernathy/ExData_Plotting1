library(lubridate);
library(sqldf);
e <- read.table("household_power_consumption.txt", header=T, sep=";")
e <- sqldf("select * from e where Date='1/2/2007' or Date='2/2/2007'")
datetime <- dmy_hms(paste(e$Date, e$Time))
e <- cbind(e, datetime)
png(file="plot3.png");
with(e, plot(datetime, Sub_metering_1, type="n"))
with(e, points(datetime, Sub_metering_1, type="l", col="black"))
with(e, points(datetime, Sub_metering_2, type="l", col="red"))
with(e, points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off();