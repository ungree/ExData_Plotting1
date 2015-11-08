plot3 <- function(){
        
        # Reading Data and Subsetting by Required Date
        
        data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        
        # Subsetting Data for Feb 1 and Feb 2
        
        data$Date = as.Date(data$Date, format = "%d/%m/%Y")
        data = subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
        
        # Converting Factors to Numerical Data
        
        data[,3:8]= sapply(data[,3:8],as.character)
        data[,3:8]= sapply(data[,3:8],as.numeric)
        
        # Plotting Line Plot of Energy Sub Metering
        
        png("plot3.png", width = 480, height = 480)
        par(mar=c(3.1,4.1,4.1,2.1))
        plot(data$Sub_metering_1,xaxt="n",xlab="",ylab="Energy sub metering", type='l',col="black")
        points(data$Sub_metering_2,type="l",col="red")
        points(data$Sub_metering_3,type="l",col="blue")
        axis(side=1, at = c(0,nrow(subset(data,Date==as.Date("2007-02-01"))),nrow(data)), labels=c("Thu","Fri","Sat"))
        legend('topright',colnames(data)[7:9],lty = 1,col=c("black","red","blue"))
        dev.off()
}