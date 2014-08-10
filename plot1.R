data <- read.table("household_power_consumption.txt", as.is=T, na.strings=c("?"), sep=";", header=T)
data.subset1 <- data[(data$Date=="1/2/2007"),]
data.subset2 <- data[(data$Date=="2/2/2007"),]
data.subset<-rbind(data.subset1,data.subset2)
hist(data.subset[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
png(filename="plot1.png",type="Xlib")
dev.off()