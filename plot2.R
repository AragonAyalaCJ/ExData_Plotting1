
# Load Data ---------------------------------------------------------------

load("clean_data.RData")

# Making plot2 ------------------------------------------------------------

Sys.setlocale("LC_TIME", "C")

## Create png graphical device

png(filename = "plot2.png", width = 480, height = 480)

## Make a plot2

x_ct <- as.POSIXct(clean_data$Date_Time)

plot(x = x_ct,
     y = clean_data$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     xaxt = "n"
     )

# Definir las posiciones y etiquetas personalizadas del eje x
ticks <- c(min(x_ct), mean(range(x_ct)), max(x_ct))  
labels <- c("Thu","Fri","Sat")

# Agregar las etiquetas personalizadas del eje x
axis(1, at = ticks, labels = labels)


## Close device

dev.off()
