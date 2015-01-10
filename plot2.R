source("utility.R")

plot(y = df$Global_active_power,
     x= df$Datetime,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

devdump("plot2.png")