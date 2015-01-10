##Helper functions
##Functions
fileJoin <- function(...) {
  paste(..., sep="/")
}

downloadToDataDir <- function(url, dest) {
  if(!file.exists(dataDir)) { dir.create(dataDir) }
  download.file(url, dest, method="auto")
}

extractUciHarFile <- function(filePath) {
  fullFilePath <- filePath
  unz(uciHarZipfile, fullFilePath)
}

devdump <- function(myFile){
  dev.copy(png, file = myFile,
           width = 480,
           height = 480,
           units = "px")
  dev.off()
}
##Constants
dataDir <- "data"
uciHarUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
uciHarZipfile <- fileJoin(dataDir, "exdata-data-household_power_consumption.zip")

##Main
if (!file.exists(uciHarZipfile)) {
  downloadToDataDir(uciHarUrl, uciHarZipfile)
}

require(dplyr)
df <- read.csv(extractUciHarFile("household_power_consumption.txt"),
               header = TRUE,sep = c(";"),
               na.strings = c("?"),
               nrows=2075259)

#Convert to Date type
df["Date"] = as.Date(strptime(df$Date, "%d/%m/%Y"))

#Filter only needed dates
df <- filter(df, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create a DateTime type
df$Datetime <- as.POSIXct(paste(as.Date(df$Date), df$Time))