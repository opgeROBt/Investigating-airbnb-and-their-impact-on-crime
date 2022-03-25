
# Investigating Airbnb and their impact on crime

This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com) at Tilburg University as part of the Master's program 'Marketing Analytics', used for the team project of group 8. 

![AirBnB Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Airbnb_Logo_Bélo.svg/2560px-Airbnb_Logo_Bélo.svg.png)

__To what extent does the number of Airbnb listings affect crime rates within Amsterdam, and to what extent is this relationship different within different Amsterdam neighbourhoods?__

## Authors

 * [Cas van Dijk](https://github.com/Cas-24), c.c.j.m.vandijk@tilburguniversity.edu
 * [Chokie Tang](https://github.com/chokietang), c.k.tang@tilburguniversity.edu
 * [Rob Esenkbrink](https://github.com/opgeROBt), r.m.esenkbrink@tilburguniversity.edu
 * [Michael Serbanescu](https://github.com/MihaiVladS), v.serbanescu@tilburguniversity.edu
 * [Anoesjka Raateland](https://github.com/Anoesjka97), a.raateland@tilburguniversity.edu


## Running instructions

### Dependencies
Please install the following programs:
* [R and R-studio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
* [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)

### How to run the project

Navigate to the project's root directory, open a terminal, and run
> make

## Repository overview

* gen/analysis = stores the analysis with the motivation
* scr/data-analysis = stores XXXXXX
* scr/derived = stores the code for the Airbnb listings, the crime data and the joint dataset
* scr/download = stores the code for downloading the Airbnb dataset and the crimerate dataset and stores the make file 
* scr/tools = stores the code for installing the r packages
* Temp/data = stores temporary data, while running the make file this will be deleted

## Data

* AirBnB data used available at [Inside AirBnB](http://insideairbnb.com/get-the-data.html)
* Police data used available at [Data.Police](https://data.politie.nl/#/Politie/nl/dataset/47022NED/table?ts=1645109405238 )

## More resources

* example set data.politie.nl: https://data.politie.nl/#/Politie/nl/dataset/47022NED/table?ts=1645109405238  
* documentation of dataset: https://data.politie.nl/portal.html?_la=en&_catalog=Politie&tableId=47022NED&_theme=97  
* Statline webpage (incl. user support): https://www.cbs.nl/en-gb/onze-diensten/open-data/statline-as-open-data  
* python quick guide api: https://www.cbs.nl/en-gb/onze-diensten/open-data/statline-as-open-data/quick-start-guide  
* check the CBSoData api in the browser: https://dataderden.cbs.nl/ODataApi/odata/47022NED/  
* check the CBSoData api in the browser: https://dataderden.cbs.nl/ODataApi/odata/47022NED/  
* github of CBS R package: https://github.com/edwindj/cbsodataR/blob/master/example/cbs_get_datasets.R  
 


