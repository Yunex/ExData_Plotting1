setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
cc<-c("myDate","character", rep("numeric",7))
df<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
               colClasses=cc, nrows=2075259, comment.char="", header=TRUE, stringsAsFactors=FALSE)
df<- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]
df$Datetime<-paste(df$Date, df$Time)
df$Datetime<-as.POSIXct(df$Datetime, format="%Y-%m-%d %H:%M:%S")


png(filename="plot4.png",width=480,height=480,units="px",bg="transparent")
par(mfrow=c(2,2))

plot(df$Datetime,df$Global_active_power,
     ylab="Global Active Power",type="s",xlab="")

plot(df$Datetime,df$Voltage,
     ylab="Voltage",xlab="datetime", type="s")

plot(df$Datetime,df$Sub_metering_1,
     ylab="Energy sub metering",type="s",xlab="")
lines(df$Datetime,df$Sub_metering_2, col="red")
lines(df$Datetime,df$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,bty="n")

plot(df$Datetime,df$Global_reactive_power,
     ylab="Global_reactive_power",xlab="datetime", type="s")

garb<-dev.off()