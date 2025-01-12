
# Load Data ---------------------------------------------------------------

load("clean_data.RData")

# Making plot1 ------------------------------------------------------------

## Create png graphical device

png(filename = "plot1.png", width = 480, height = 480)

## Make a plot1

hist(clean_data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

## Close device

dev.off()
