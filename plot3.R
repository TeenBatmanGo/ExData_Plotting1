library(data.table)
dat<-fread("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE,header=T)
consume<-subset(dat,dat$Date %in% c("1/2/2007","2/2/2007"))

# Convert the Date and Time variables to Date/Time classes
datetime<-strptime(paste(consume$Date,consume$Time),"%d/%m/%Y %H:%M:%S")
consume1<-cbind(consume,as.data.frame(datetime))

png("plot3.png",width=480,height=480)
with(consume1,plot(datetime,Sub_metering_1,type="l",ylab="Energy Submetering",xlab=""))
with(consume1,lines(datetime,Sub_metering_2,type="l",col="red"))
with(consume1,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=colnames(consume)[7:9],lty=rep(1,3),col=c("black","red","blue"))
dev.off()