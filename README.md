
# Investigating Airbnb and their impact on crime

This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com) at Tilburg University as part of the Master's program 'Marketing Analytics', used for the team project of group 8. 

![AirBnB Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Airbnb_Logo_Bélo.svg/2560px-Airbnb_Logo_Bélo.svg.png)

__To what extent does the number of Airbnb listings affect crime rates within Amsterdam, and to what extent is this relationship different within different Amsterdam neighbourhoods?__

## Authors

 Members of our team: 

 * [Cas van Dijk](https://github.com/Cas-24), c.c.j.m.vandijk@tilburguniversity.edu

 * [Chokie Tang](https://github.com/chokietang), c.k.tang@tilburguniversity.edu

 * [Rob Esenkbrink](https://github.com/opgeROBt), r.m.esenkbrink@tilburguniversity.edu

 * [Michael Serbanescu](https://github.com/MihaiVladS), v.serbanescu@tilburguniversity.edu
 
 * [Anoesjka Raateland](https://github.com/Anoesjka97), a.Raateland@tilburguniversity.edu


## Build instructions

1) Dependencies

Please follow the installation guide on
https://www.tilburgsciencehub.com/ for

- R and RStudio (3.6.x)
  Install the following R packages:

	packages <- c("data.table", "ggplot2")

	install.packages(packages)

- Gnu Make
  Put GnuMake and R to path so that you can run it
  from anywhere on your system. See http://www.tilburgsciencehub.com/

- Obtain raw data files and put them into /data/

2) Directory structure

* code/ = stores all the codes.
* data/ = stores the raw data. 
* documentation/ = stores outlines, drafts, other text.
* output/ = stores graphics from our data. 

The project pipeline consists of the following stages:

/src/collect                Code required to collect/download raw data

/src/data-preparation       Data preparation

/src/analysis               Data analysis

/src/paper                  Stores literature reference, paper, and slides


Each directory has a makefile, with running descriptions
for each stage of the pipeline.

For each pipeline stage, the /gen directory contains
files generated on the basis of the /data and
source code stored in /src.

Each directory contains subdirectories,
	/input (for input files)
	/output (for final output files)
	/temp (for any temporary files)
	/audit (for any auditing files)

3) How to run the project

Navigate to the project's root directory, open a terminal,
and run

> make

## Data

* AirBnB data used available at [Inside AirBnB](http://insideairbnb.com/get-the-data.html).

* Police data used available at [Data.Police](https://data.politie.nl/#/Politie/nl/dataset/47022NED/table?ts=1645109405238 ).

## More resources

* example set data.politie.nl: https://data.politie.nl/#/Politie/nl/dataset/47022NED/table?ts=1645109405238  
* documentation of dataset: https://data.politie.nl/portal.html?_la=en&_catalog=Politie&tableId=47022NED&_theme=97  
* Statline webpage (incl. user support): https://www.cbs.nl/en-gb/onze-diensten/open-data/statline-as-open-data  
* python quick guide api: https://www.cbs.nl/en-gb/onze-diensten/open-data/statline-as-open-data/quick-start-guide  
* check the CBSoData api in the browser: https://dataderden.cbs.nl/ODataApi/odata/47022NED/  
* check the CBSoData api in the browser: https://dataderden.cbs.nl/ODataApi/odata/47022NED/  
* github of CBS R package: https://github.com/edwindj/cbsodataR/blob/master/example/cbs_get_datasets.R  
* github v3: https://github.com/statistiekcbs/CBS-Open-Data-v3  
* github v4: https://github.com/statistiekcbs/CBS-Open-Data-v4  

