plot1 <- function(){
        
        # Reading Data and Subsetting by Required Date
        
        data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
        
        # Subsetting Data for Feb 1 and Feb 2
        
        data$Date = as.Date(data$Date, format = "%d/%m/%Y")
        data = subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
        
        # Converting Factors to Numerical Data
        
        data[,3:8]= sapply(data[,3:8],as.character)
        data[,3:8]= sapply(data[,3:8],as.numeric)
        
        # Plotting Histogram
        
        png("plot1.png", width = 480, height = 480)
        hist(data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power")
        dev.off()
        
}