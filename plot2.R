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


png(file="plot2.png",width = 480, height = 480) ## Open PNG device; create "plot2.png" in working directory
par(mfrow=c(1,1)) ## setting plot parameters

## Adding plot to graphic device

plot(pdsub$Time, pdsub$Global_active_power,ylab="Global Active Power (kilowatts)",xlab = "",type="l")

dev.off() ## Close PNG file device