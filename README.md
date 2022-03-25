
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
 


# Repository overview
### **src/collection** 
The src folder contains two folders for collection and reporting. The collection folder holds the seperate python files that are needed to collect the data and parse them in seperate files or dataframes. The folder reporting is at this moment empty and can be used for reporting purposes when working with the data. For now this was left empty since our project focused mainly on collecting the data. 

### **data** 
Data collected trough the files in src/collection are automatically written to the data folder. Collected data consists of raw .json files containing app ids, collected app ids, and the raw data. Furthermore, with the parsing script all nested json objects in the raw dataset and the raw dataset are writen to .xlsx files and saved in the data folder.  

### **documentation** 
Our full research documentation can be found in the [**documentation**](https://github.com/opgeROBt/steam-API/tree/main/documentation) folder. 


# Running instructions 

### **run in following order**  
"libraries and functions.py" ->  "collect all app id's.py" -> "collect appdetails.py" ->  "parsing nested json into dataframes and excel files.py"


### **step 1 | installing libraries and functions**
The following libraries are needed to run the code. These have been added in the 'libraries and functions script which should always be run as the first script. 
 

```
import requests
from datetime import datetime
import numpy
import time
import json
from pathlib import Path
import pandas as pd
from os.path import exists
```

```
get_request(url, parameters=None)  #creates the get request to collect data, used in getAppDetails
getAppList()                       #gets the full  list of current app_id's from the store.steampowered API
getAppDetails(id)                  #the function used to collect the appdetails per app_id 
```

### **step 2 | collect available app_ids**
By running the code from 'collect all app id's.py'  all app ids from the steam store are collected in the 'app_ids.json' and saved in the /data folder. 

### **step 3 | collect app_details per app_id**
This is where the magic happens and the details of every app is collected and put in a big raw_data.json. It is possible to specify of how many app_id's the details should be collected. Since running the code can be very time consuming. Benchmark: circa 60 minutes per 2500 app ids. This is due to the **limitations** that are set. Although there is no official documentation on this, there is a limit of around 10 calls per 10 seconds with a maximum of 100.000 calls per day. Furthermore, a timestamp is added to the collected data to keep track of when which records have been collected.  

### **step 4 | parse raw data to usable datasets**
This code parses all the data in the raw_data.json file and puts for every nested category the data in seperate dataframes. The steam_appid is included in the parsed dataframe which gives the option to join the data to the raw dataset when further exploration is needed.   

