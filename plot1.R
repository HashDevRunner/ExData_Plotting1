source("utility.R")

hist(df$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

devdump("plot1.png")