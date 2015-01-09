install.packages("data.table")
library("data.table")
data1<-fread("household_power_consumption.txt")
# To generate the png file
png("plot1.png",width = 480, height = 480)
# To extract the data for the two days under consideration
# One should check the format of the date since format is not typical
data2 <- subset(data1, data1$Date == "2/2/2007" | data1$Date == "1/2/2007" )
data3<-as.numeric(data2$Global_active_power)
hist(data3,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
