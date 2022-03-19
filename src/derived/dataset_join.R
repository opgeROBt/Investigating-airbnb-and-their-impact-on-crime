## Explanation
#This file combines the previously downloaded and modified datasets of Airbnb listings and Police Crime data through a join statement.

# Loading neccesary library
library(dplyr)

# Loading the modified Airbnb listings and Police Crime datasets.
airbnb_listings_summarized <- read.csv("temp-data/summarized/airbnb_listings_summarized.csv")
crime_data_summarized <- read.csv("temp-data/summarized/crime_data_summarized.csv")

# Merging the two datasets via an outer join
listings_crime_dataset = airbnb_listings_summarized %>% full_join(crime_data_summarized,by="Neighborhoods")

# Create a new folder in 'temp-data' called 'analysis'
dir.create('temp-data/analysis')

# Save the final dataset in data folder
write.csv(na.omit(listings_crime_dataset), "temp-data/analysis/listings_crime_dataset.csv", row.names = FALSE)