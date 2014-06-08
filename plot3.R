#Load data
initial<-read.table("household_power_consumption.txt",nrows = 100,header = TRUE,sep = ";")
classes <- sapply(initial, class)

initial2<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses = classes)
x<-as.Date(initial2[,1], format = "%d/%m/%Y")
assData<-subset(initial2, Date == "2007-02-02" | Date == "2007-02-01")


#Plot 3
library(memoise)
library(lubridate)
plotx <- ymd_hms(paste(assData$Date, assData$Time, sep = "_"))

png(file = "Plot 3.png", width = 480, height = 480, units = "px")
with(assData, plot(plotx,Sub_metering_1, type = "n", ylab = "Energy sub meteing", xlab = ""))
with(assData,lines(plotx,Sub_metering_1))
with(assData,lines(plotx,Sub_metering_2, col = "red"))
with(assData,lines(plotx,Sub_metering_3, col = "blue"))
legend("topright", pch = "--", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
