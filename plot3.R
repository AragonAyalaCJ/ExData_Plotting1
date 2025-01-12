
# Load Data ---------------------------------------------------------------

load("clean_data.RData")

# Making plot3 ------------------------------------------------------------

Sys.setlocale("LC_TIME", "C")

## Create png graphical device

png(filename = "plot3.png", width = 480, height = 480)

## Make a plot3

x_ct <- as.POSIXct(clean_data$Date_Time)

plot(x = x_ct,
     y = clean_data$Sub_metering_1,
     type = "l", col = "black",
     ylab = "Energy sub metering",
     xlab = "",
     xaxt = "n"
)

lines(x = x_ct,
      y = clean_data$Sub_metering_2,
      type = "l", col = "red")

lines(x = x_ct,
      y = clean_data$Sub_metering_3,
      type = "l", col = "blue")

# Add legend

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

# Defines ticks and labels
ticks <- c(min(x_ct), mean(range(x_ct)), max(x_ct))  
labels <- c("Thu","Fri","Sat")

# Add labels x axis
axis(1, at = ticks, labels = labels)


## Close device

dev.off()
