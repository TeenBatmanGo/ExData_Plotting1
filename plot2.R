library(data.table)
dat<-fread("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE,header=T)
consume<-subset(dat,dat$Date %in% c("1/2/2007","2/2/2007"))

# Convert the Date and Time variables to Date/Time classes 
datetime<-strptime(paste(consume$Date,consume$Time),"%d/%m/%Y %H:%M:%S")
consume1<-cbind(consume,as.data.frame(datetime))

png("plot2.png",width=480,height=480)
with(consume1,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()