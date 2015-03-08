

# plot 1
# This code presumes the data has been downloaded and extacted to the current working directory

df <- read.table(file="household_power_consumption.txt", sep=';',header=TRUE, na.strings='?')
df$dates<-as.Date(df$Date, "%d/%m/%Y")

df<- df[df$dates>='2007-02-01' & df$dates<='2007-02-02',]

png('Plot 1.png')
hist(df$Global_active_power, col='red',main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()

