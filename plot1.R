library(data.table)   
dat<-fread("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE,header=T)
consume<-subset(dat,dat$Date %in% c("1/2/2007","2/2/2007"))

png("plot1.png",width=480,height=480)
hist(consume$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
