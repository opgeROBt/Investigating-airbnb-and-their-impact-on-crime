## Explanation
#This file combines the previously downloaded and modified datasets of Airbnb listings and Police Crime data through a join statement.

# Loading neccesary library
library(dplyr)

# Loading the modified Airbnb listings and Police Crime datasets.
airbnb_listings_modified <- read.csv("../data/airbnb_listings_modified.csv")
police_data_modified <- read.csv("../data/police_dataset.csv")

# Merging the two datasets via an outer join
final_dataset = airbnb_listings_modified %>% full_join(police_data_modified,by="Neighborhoods")

# Save the final dataset in data folder
write.csv(final_dataset, "../data/final_dataset.csv", row.names = FALSE)