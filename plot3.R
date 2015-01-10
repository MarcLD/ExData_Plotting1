install.packages("data.table")
library("data.table")
data1<-fread("household_power_consumption.txt")
# To generate the png file
png("plot3.png",width = 480, height = 480)
# To extract the data for the two days under consideration
# One should check the format of the date since format is not typical
data2 <- subset(data1, data1$Date == "2/2/2007" | data1$Date == "1/2/2007" )
data3<-as.numeric(data2$Global_active_power)
# To change the format of the date / time
data4 <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")
# To change the local settings in order to have the proper label on the x axis
Sys.setlocale("LC_TIME", "English")
# First set of values
plot(data2$Sub_metering_1 ~ data4,type='l',xlab="",ylab="Energy sub metering")
# Second set of values
points(data2$Sub_metering_2 ~ data4,type='l',col="red")
# Third set of values
points(data2$Sub_metering_3 ~ data4,type='l',col="blue")
# Add legend
legend("topright",lty = c(1, 1, 1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()