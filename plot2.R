install.packages("data.table")
library("data.table")
data1<-fread("household_power_consumption.txt")
# To generate the png file
png("plot2.png",width = 480, height = 480)
# To extract the data for the two days under consideration
# One should check the format of the date since format is not typical
data2 <- subset(data1, data1$Date == "2/2/2007" | data1$Date == "1/2/2007" )
data3<-as.numeric(data2$Global_active_power)
# To change the format of the date / time
data4 <- as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")
# To change the local settings in order to have the proper label on the x axis
Sys.setlocale("LC_TIME", "English")
plot(data3 ~ data4,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()