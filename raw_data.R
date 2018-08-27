library(ggplot2)

raw_data <- read.csv2("C:/Users/Dennis/Documents/eHA/FME/Tosin/RawData.csv", sep =",")
head(raw_data)
str(raw_data)

##Subsetting the data set
raw_data_subset <- raw_data[c(4,5,6,8,9,11,12,15,16,17,18,20,23)]
str(raw_data_subset)

##Data transformation
raw_data_subset$ward <- as.character(raw_data_subset$ward)
raw_data_subset$dc_name <- as.factor(raw_data_subset$dc_name)
raw_data_subset$X_gps_latitude <- as.numeric(raw_data_subset$X_gps_latitude)
raw_data_subset$X_gps_longitude <- as.numeric(raw_data_subset$X_gps_longitude)
raw_data_subset$machine_gen_settlement_name <- as.character(raw_data_subset$machine_gen_settlement_name)
raw_data_subset$correct_settlement_name <- as.character(raw_data_subset$correct_settlement_name)
raw_data_subset$X_uuid <- as.character(raw_data_subset$X_uuid)
str(raw_data_subset)


#Changing names of the data 
new_names <- c("state","lga","other_lga_name","ward","dc_name","latitude","longitude",
               "settlement_type","machine_gen_settlement_name","correct_settlement_name","alternate_name",
               "habitation_status","unique_id")
names(raw_data_subset) <- new_names
colnames(raw_data_subset)

##Visualization with the dataset
summary(raw_data_subset$dc_name)
summary(raw_data_subset$other_lga_name)

##Converting the csv data to shapefile
head(raw_data_subset$latitude) ##Easting 

library(raster)
library(rgdal)
library(sp)

new_data <- raw_data_subset
new_data$latitude <- as.character(new_data$latitude)

new_data$latitude <- as.double(new_data$latitude)
head(new_data$latitude)
new_data$longitude <- as.character(new_data$longitude)
new_data$longitude <- as.double(new_data$longitude)

##Writing data in CSV 
write.csv(new_data, "C:/Users/Dennis/Documents/eHA/FME/Tosin/new_data1.csv")

















