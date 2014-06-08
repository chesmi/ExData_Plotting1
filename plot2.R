#Load data
initial<-read.table("household_power_consumption.txt",nrows = 100,header = TRUE,sep = ";")
classes <- sapply(initial, class)

initial2<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses = classes)
x<-as.Date(initial2[,1], format = "%d/%m/%Y")
assData<-subset(initial2, Date == "2007-02-02" | Date == "2007-02-01")


#Plot 2
library(memoise)
library(lubridate)

plotx <- ymd_hms(paste(assData$Date, assData$Time, sep = "_"))
png(file = "Plot 2.png", width = 480, height = 480, units = "px")
plot(plotx,assData$Global_active_power, type = "n", ylab = "Global Active Power (killowats)", xlab = "")
lines(plotx,assData$Global_active_power)
dev.off()

