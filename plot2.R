plot2 <- function(){
        
        # Reading Data and Subsetting by Required Date
        
        data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        
        # Subsetting Data for Feb 1 and Feb 2
        
        data$Date = as.Date(data$Date, format = "%d/%m/%Y")
        data = subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
        
        # Converting Factors to Numerical Data
        
        data[,3:8]= sapply(data[,3:8],as.character)
        data[,3:8]= sapply(data[,3:8],as.numeric)
        
        # Plotting Line Plot of Global Active Power
        
        png("plot2.png", width = 480, height = 480)
        par(mar=c(3.1,4.1,4.1,2.1))
        plot(data$Global_active_power,xaxt="n",xlab="",ylab="Global Active Power (kilowatts)", type='l',col="black")
        axis(side=1, at = c(0,nrow(subset(data,Date==as.Date("2007-02-01"))),nrow(data)), labels=c("Thu","Fri","Sat"))
        dev.off()
}