setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
cc<-c("myDate","character", rep("numeric",7))
df<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
               colClasses=cc, nrows=2075259, comment.char="", header=TRUE)
df<- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

png(filename="plot1.png",width=480,height=480,units="px",bg="transparent")
hist(df$Global_active_power,col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
garb<-dev.off()