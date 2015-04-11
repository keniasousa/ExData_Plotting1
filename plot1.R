plot1 <- function(){
  # Load the data from the dates 1/2/2007 to 2/2/2007
  # Since we read from the middle of the file, it must not consider the header.
  # The separator is ;
  # In this dataset, missing values are coded as ?.
  # skip="string" searches for "string" in the file and starts on that line
  # The data set has records for each minute in a day
  # Number of rows to be read = 1440 minutes/day * 2 days = 2880
  # To run this script, download the dataset referenced in the readme file 
  # and save it to the working directory
  library(data.table)
  dt <- fread("household_power_consumption.txt", header=F, sep=";", na.strings = "?", 
              skip="1/2/2007", nrows=2880)
  
  # Set the names of the variables according to original data set
  setnames(dt, c("V1","V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9"), c("Date","Time","Global_active_power","Global_reactive_power",
                       "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  # Plot1
  # Save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels
  # Use the default background color, which is white (Omit the bg argument, bg = "white")
  png(filename = "plot1.png", width = 480, height = 480)
  # Plot a histogram of the distribution of the Global Active Power 
  hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  # Close the file device
  dev.off()
  # Remove the data set from the working environment
  rm(dt)
}
