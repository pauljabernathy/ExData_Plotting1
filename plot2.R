library(lubridate);
library(sqldf);
e <- read.table("household_power_consumption.txt", header=T, sep=";")
e <- sqldf("select * from e where Date='1/2/2007' or Date='2/2/2007'")
datetime <- dmy_hms(paste(e$Date, e$Time))
e <- cbind(e, datetime)
png(file="plot2.png");
plot(e$datetime, e$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l");
dev.off();