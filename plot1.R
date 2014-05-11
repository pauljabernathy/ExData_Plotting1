library(sqldf);
e <- read.table("household_power_consumption.txt", header=T, sep=";")
e <- sqldf("select * from e where Date='1/2/2007' or Date='2/2/2007'")
png(file="plot1.png");
hist(as.numeric(as.character(e$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)");
dev.off();