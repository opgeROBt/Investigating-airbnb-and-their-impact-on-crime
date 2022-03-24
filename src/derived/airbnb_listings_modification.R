## Explanation
#This file takes the previously downloaded Airbnb dataset and changes it in several ways. The dplyr and stringr packages 
#are required and loaded. The code below groups the data by Amsterdam's neighborhoods as separated by Airbnb, then computes the 
#following summary statistics per neighborhood: the total amount of listings, the average price of listings, and the percentages 
#of each room type out of the total listings. The end result is a compact dataset with 22 rows (observations) and 7 columns (variables). 
#Lastly, the resulting dataset is saved.

#Remove the hashtags (#) below if you do not have dplyr and/or stringr installed, as this code requires them
#install.packages("dplyr")
#install.packages("stringr")
library(dplyr)
library(stringr)

#Loads the listings csv from the 'temp-data/raw' folder of the repository
airbnb_listings <- read.csv("../../temp-data/raw/airbnb_listings.csv")

#Create a new dataset with summarized statistics separated per Airbnb neighborhood
airbnb_listings_modified <- airbnb_listings %>% 
  group_by(neighbourhood) %>% 
  summarise(Listing_sum = sum(calculated_host_listings_count),
            Average_price = mean(price), 
            Percentage_home_apt = sum(str_count(room_type,"Entire home/apt"))/n(), 
            Percentage_hotel_room = sum(str_count(room_type,"Hotel room"))/n(), 
            Percentage_private_room = sum(str_count(room_type,"Private room"))/n(), 
            Percentage_shared_room = sum(str_count(room_type,"Shared room"))/n())

names(airbnb_listings_modified)[names(airbnb_listings_modified) == "neighbourhood"] <- "Neighborhoods"

#Create a new folder in 'temp-data' called 'summarized'
dir.create('../../temp-data/summarized')

#Save the new dataset as a csv in the 'temp-data/summarized' folder of the repository
write.csv(na.omit(airbnb_listings_modified), "../../temp-data/summarized/airbnb_listings_summarized.csv", row.names = FALSE)