## Explanation
#This file is used with the sole purpose of downloading the airbnb listings data from 
#inside airbnb (http://insideairbnb.com/index.html) and saving it on the local repository in the data folder for further changes.

#Download the data of Inside Airbnb in Amsterdam.
airbnb_listings <- read.csv("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/visualisations/listings.csv")

#Creates the directory 'temp-data/raw' within the repository by creating the folder 'temp-data' and the folder 'raw' within it.
dir.create('../../temp-data')
dir.create('../../temp-data/raw')

#Save the data as csv file in the repository's 'temp-data/raw' folder
write.csv(airbnb_listings, "../../temp-data/raw/airbnb_listings.csv", row.names = FALSE)
