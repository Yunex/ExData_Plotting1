setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
cc<-c("myDate","character", rep("numeric",7))
df<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
               colClasses=cc, nrows=2075259, comment.char="", header=TRUE, stringsAsFactors=FALSE)
df<- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]
df$Datetime<-paste(df$Date, df$Time)
df$Datetime<-as.POSIXct(df$Datetime, format="%Y-%m-%d %H:%M:%S")


png(filename="plot2.png",width=480,height=480,units="px",bg="transparent")
plot(df$Datetime,df$Global_active_power,
     ylab="Global Active Power (kilowatts)",type="s",xlab="")
garb<-dev.off()