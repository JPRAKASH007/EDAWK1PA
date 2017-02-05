## Dowload & save the Zip data "exdata%2Fdata%2Fhousehold_power_consumption.zip" in working directory

## Unzip the data file and store "household_power_consumption.txt" in working directory

## read complete POwer Consumption data and tag "?" as missing value

powerdata <- read.table("./household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")

##subset the power data for 2007-02-01 and 2007-02-02 (yyyy-mm-dd) into pdsub data table

pdsub <- subset(powerdata, Date=="1/2/2007" | Date=="2/2/2007")

## convert the Date and Time variables to Date/Time classes in R 
## using the strptime()  and as.Date() functions.

pdsub$Date <- as.Date(pdsub$Date,format="%d/%m/%Y")
pdsub$Time <- strptime(paste(pdsub$Date,pdsub$Time),format ="%Y-%m-%d %H:%M:%S")


png(file="plot4.png",width = 480, height = 480) ## Open PNG device; create "plot4.png" in working directory
par(mfcol=c(2,2)) ## setting plot parameters

## Adding plots to graphic device

plot(pdsub$Time, pdsub$Global_active_power,ylab="Global Active Power",xlab = "",type="l")

plot(pdsub$Time, pdsub$Sub_metering_1,ylab="Energy sub metering",xlab = "",type="l",col="black")
lines(pdsub$Time, pdsub$Sub_metering_2,col="red")
lines(pdsub$Time, pdsub$Sub_metering_3,col="blue")
legend('topright', names(pdsub[7:9]) , lty=1, col=c("black", "red", "blue"),bty="n")

plot(pdsub$Time, pdsub$Voltage,ylab="Voltage",xlab = "datetime",type="l")

plot(pdsub$Time, pdsub$Global_reactive_power,ylab="Global_reactive_power",xlab = "datetime",type="l")

dev.off() ## Close PNG file device