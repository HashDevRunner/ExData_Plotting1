source("utility.R")

png(file = "plot3.png", width = 480, height = 480, units = "px")

with(df, { plot(df$Sub_metering_1~df$Datetime, 
                type = "l",
                xlab = "",
                ylab = "Energy sub metering")
           lines(df$Sub_metering_2~df$Datetime, col = "Red")
           lines(df$Sub_metering_3~df$Datetime, col = "Blue")})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend = names(df)[7:9])

dev.off()
