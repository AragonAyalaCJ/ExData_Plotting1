
# Load data ---------------------------------------------------------------

library(tidyverse)

## Path file for independent platform

data_path <- file.path("data",
                       "exdata_data_household_power_consumption",
                       "household_power_consumption.txt")

## Read all data
raw_data <- read.delim(data_path, sep = ";")

# Clean data --------------------------------------------------------------

clean_data <- raw_data |> 
  filter(Date %in% c("1/2/2007","2/2/2007") ) |> 
  mutate(raw_Date_Time = paste(Date,Time,sep = " ")) |> 
  mutate(Date_Time = strptime(raw_Date_Time, format= "%d/%m/%Y %H:%M:%S"),
         .before = 1,
         .keep = "unused") |> 
  mutate(across(c(4:9),as.numeric))

## Verifying missing values ("?") are not present in clean data, but yes in 
## raw data.

sapply(clean_data[,c(-1)],function(x) sum(x=="?"))
sapply(raw_data[,c(-1)],function(x) sum(x=="?"))

sapply(clean_data[,c(-1)],function(x) sum(is.na(x)))
sapply(raw_data[,c(-1)],function(x) sum(is.na(x)))

# Save to clean_data.RData

save(clean_data, file = "clean_data.RData")
