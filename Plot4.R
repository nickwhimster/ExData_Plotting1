

#plot 4 
# This code presumes the data has been downloaded and extacted to the current working directory


df <- read.table(file="household_power_consumption.txt", sep=';',header=TRUE, na.strings='?')
df$dates<-as.Date(df$Date, "%d/%m/%Y")

df<- df[df$dates>='2007-02-01' & df$dates<='2007-02-02',]
df$fullDate<-as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

png('Plot 4.png')
par(mfcol= c(2,2), mar=c(5,4,3,1))

plot( df$fullDate,df$Global_active_power, ylab='Global Active Power',xlab='', type='l')

plot( df$fullDate,df$Sub_metering_1, ylab='Energy Sub Metering',xlab='',type='n')
points( df$fullDate,df$Sub_metering_1,type='l')
points( df$fullDate,df$Sub_metering_2,type='l', col='red')
points( df$fullDate,df$Sub_metering_3,type='l', col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1,  bty='n')


plot( df$fullDate,df$Voltage, ylab='Voltage',xlab='datetime', type='l')



plot( df$fullDate,df$Global_reactive_power, ylab='Global_reactive_power', xlab='datetime', type='l')

dev.off()
