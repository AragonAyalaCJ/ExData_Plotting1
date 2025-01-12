
# Load Data ---------------------------------------------------------------

load("clean_data.RData")

# Making plot4 ------------------------------------------------------------

Sys.setlocale("LC_TIME", "C")

## Create png graphical device

png(filename = "plot4.png", width = 480, height = 480)

## Dive by four graphic device

par(mfcol = c(2, 2))

## Make a plot1

x_ct <- as.POSIXct(clean_data$Date_Time)

plot(x = x_ct,
     y = clean_data$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     xaxt = "n"
)

ticks <- c(min(x_ct), mean(range(x_ct)), max(x_ct))  
labels <- c("Thu","Fri","Sat")

axis(1, at = ticks, labels = labels)

## Make a plot2

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

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

ticks <- c(min(x_ct), mean(range(x_ct)), max(x_ct))  
labels <- c("Thu","Fri","Sat")

axis(1, at = ticks, labels = labels)

## Make a plot3

plot(x = x_ct,
     y = clean_data$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime",
     xaxt = "n"
)

ticks <- c(min(x_ct), mean(range(x_ct)), max(x_ct))  
labels <- c("Thu","Fri","Sat")

axis(1, at = ticks, labels = labels)

## Make a plot4

plot(x = x_ct,
     y = clean_data$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     xaxt = "n"
)

ticks <- c(min(x_ct), mean(range(x_ct)), max(x_ct))  
labels <- c("Thu","Fri","Sat")

axis(1, at = ticks, labels = labels)


# Restore 1 graphic device

par(mfcol = c(1, 1))

## Close device

dev.off()
