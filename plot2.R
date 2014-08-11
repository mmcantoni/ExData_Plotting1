data <- read.table("household_power_consumption.txt", as.is=T, na.strings=c("?"), sep=";", header=T)
data.subset1 <- data[(data$Date=="1/2/2007"),]
data.subset2 <- data[(data$Date=="2/2/2007"),]
data.subset<-rbind(data.subset1,data.subset2)
data.subset[,1]<-c(rep("01/02/2007",1440),rep("02/02/2007",1440))
data.subset <- cbind(data.subset, as.character(paste(data.subset[,1], data.subset[,2])))
names(data.subset)[10] <- "DateTime"
data.subset <- cbind(data.subset, strptime(data.subset[,10], "%d/%m/%Y %H:%M:%S", tz="GMT"))
names(data.subset)[11] <- "DateTimeConv"
head(data.subset)
png(filename="plot2.png",type="Xlib")
plot(data.subset[,11], data.subset[,3], ylab="Global Active Power (kilowatts)",xlab="",type="l") 
mtext("Thu",side=1,line=0,adj=0)
mtext("Fri",side=1,line=0)
mtext("Sat",side=1,line=0,adj=1)
dev.off()