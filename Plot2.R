

#plot 2
# This code presumes the data has been downloaded and extacted to the current working directory

df <- read.table(file="household_power_consumption.txt", sep=';',header=TRUE, na.strings='?')
df$dates<-as.Date(df$Date, "%d/%m/%Y")

df<- df[df$dates>='2007-02-01' & df$dates<='2007-02-02',]
df$fullDate<-as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
png('Plot 2.png')
plot( df$fullDate,df$Global_active_power, ylab='Global Active Power (kilowatts)',xlab='', type='l')
dev.off()


