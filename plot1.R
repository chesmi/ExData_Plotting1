#Load data
initial<-read.table("household_power_consumption.txt",nrows = 100,header = TRUE,sep = ";")
classes <- sapply(initial, class)

initial2<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses = classes)
x<-as.Date(initial2[,1], format = "%d/%m/%Y")
assData<-subset(initial2, Date == "2007-02-02" | Date == "2007-02-01")


#Plot 1
png(file = "Plot 1.png", width = 480, height = 480, units = "px")
hist(assData$Global_active_power, col = "red", xlab = "Global Active Power (killowats)",main = "Global Active Power")
dev.off()
