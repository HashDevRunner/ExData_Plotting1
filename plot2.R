source("utility.R")

df$Datetime <- as.POSIXct(paste(as.Date(df$Date), df$Time))
plot(y = df$Global_active_power,
     x= df$Datetime,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

devdump("plot2.png")