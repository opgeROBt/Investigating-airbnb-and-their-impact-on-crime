
# The dark side of tourism: Investigating Airbnb and their impact on crime rate  
<p align="center">
  <img width="70%" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Airbnb_Logo_Bélo.svg/2560px-Airbnb_Logo_Bélo.svg.png">
</p>

## Project description
---

Tourism is ramping up in many countries around the globe. Recently, Liowska brought together several research experiments on the the subject of crime and tourism. Conceptually, she argues a logical relation between tourism and presence of crime either done by or to tourists. However, there is insufficient research on how criminalistic statistics are related to this phenomenon. 

Our team is intrigued in conducting a similar analyses and further contributing to this field by researching data retrieved from Airbnb and the Central Bureau of Statistics in the Netherlands. With our research we attempt to answer the following question:  

**_"To what extent does the number of Airbnb listings affect crime rates within Amsterdam, and to what extent is this relationship different within different Amsterdam neighbourhoods?"_**

Read the generated research file by going to [**gen/analyses**](https://github.com/opgeROBt/Investigating-airbnb-and-their-impact-on-crime/blob/main/gen/analysis.pdf).  


## Repository overview
---
   
```
├── README.md
├── makefile			
├── .gitignore			
├── gen 	#stores the PDF version of the analysis with the motivation
├── temp-data	#stores temporary data, while running the make file this will be deleted
│   ├── analysis
│   ├── raw
│   └── summarized
└── src
    ├── data-analysis	#stores the code for the analysis with the motivation
    ├── derived		#stores the code for the Airbnb listings, the crime data and the joint dataset
    ├── download	#stores the code for downloading the Airbnb dataset and the crimerate dataset and stores the make file
	└── tools	#stores the code for installing the r packages
```  


## How to run the analyses?
---
To run the file you must have installed the following programs:
* [R and R-studio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
* [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)
* [Git Bash](https://gitforwindows.org/) (windows user) or terminal (mac user)   

### **R libraries**
The R code contains libraries that need to be installed in order to run the code. 
By running the `install_packages.r` code, which is included in the `src/tools` folder, all needed packages will be installed automatically. This script is included in the makefile. Therefore, libraries will be installed/updated automatically.  

### **How to run the project**
With make installed, it is possible to open a terminal (or Git Bash) and run: 

    make   

This runs the entire project. To run certain parts of the project, it is possible to run the specific make targets specified in the `makefile`. Without arguments, make builds the first target that appears in its makefile, which is traditionally a target named "all".

     make [TARGET ...]

## Data sources for this research 
---
* Airbnb data used available at [Inside Airbnb](http://insideairbnb.com/get-the-data.html)
* Police data used available at [Data.Police](https://data.politie.nl/#/Politie/nl/dataset/47022NED/table?ts=1645109405238 )


## Authors
---

This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com) at Tilburg University as part of the Master's program Marketing Analytics, used for the team project of group 8. 

 * [Cas van Dijk](https://github.com/Cas-24), c.c.j.m.vandijk@tilburguniversity.edu
 * [Chokie Tang](https://github.com/chokietang), c.k.tang@tilburguniversity.edu
 * [Rob Esenkbrink](https://github.com/opgeROBt), r.m.esenkbrink@tilburguniversity.edu
 * [Michael Serbanescu](https://github.com/MihaiVladS), v.serbanescu@tilburguniversity.edu
 * [Anoesjka Raateland](https://github.com/Anoesjka97), a.raateland@tilburguniversity.edu

## More resources
---

* [Example police dataset](https://data.politie.nl/#/Politie/nl/dataset/47022NED/table?ts=1645109405238)  
* [Documentation of police dataset](https://data.politie.nl/portal.html?_la=en&_catalog=Politie&tableId=47022NED&_theme=97)  
* [Statline webpage (incl. user support)](https://www.cbs.nl/en-gb/onze-diensten/open-data/statline-as-open-data)  
* [CBS R quick guide api](https://www.cbs.nl/en-gb/onze-diensten/open-data/statline-as-open-data/quick-start-guide)   
* [CBS oData api in the browser](https://dataderden.cbs.nl/ODataApi/odata/47022NED/)  
* [CBS oData github v3](https://github.com/statistiekcbs/CBS-Open-Data-v3)  
* [CBS oData  github v4](https://github.com/statistiekcbs/CBS-Open-Data-v4)  

