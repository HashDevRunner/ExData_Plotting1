source("utility.R")

png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))

with(df, {
  plot(y = df$Global_active_power,
       x= df$Datetime,
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  { plot(df$Sub_metering_1~df$Datetime, 
         type = "l",
         xlab = "",
         ylab = "Energy sub metering")
    lines(df$Sub_metering_2~df$Datetime, col = "Red")
    lines(df$Sub_metering_3~df$Datetime, col = "Blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend = names(df)[7:9]) }
  
  plot(df$Voltage~df$Datetime,
       type = "l",
       xlab = "datetime",
       ylab = names(df)[5]) 
  
  plot(df$Global_reactive_power~df$Datetime,
       type = "l",
       xlab = "datetime",
       ylab = names(df)[4]) 
  
  })

dev.off()