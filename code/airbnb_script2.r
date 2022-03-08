## Explanation
#This file makes use of publicly available politie.nl data (https://data.politie.nl/portal.html?_la=nl&_catalog=Politie&tableId=47022NED&_theme=97) 
#to download a dataset pertaining to crime rates. For this, the cbsodatR package is used (and must be installed) to make use of the CBS API for data collection. 
#Through the API, the table of contents and the uncatalogued data are downloaded and, in turn, used to download the metadata made available by politie.nl. 
#Before downloading the data, it must be noted that there is a limit in the amount of observations that can be extracted at a time, hence the separation of all relevant parameters into 5 vectors (WijkEnBuurten_police_ams_1 through 5). 
#Additionally, another vector is defined to signal the API as to the time periods of interest to the group (2021, January to December). 
#5 data requests are issued through the CSB API, resulting in 5 different dataset fragments.
#Each request is separated by a 5 second pause, which is not inherently neccesary, but used either way to avoid potentially overwhelming the server at a time of high use. 
#The 5 separate datasets are combined into one vie bind, and the result is saved as a csv file in the data folder of the repository. 

# Identify missing packages
to_be_installed <- setdiff(uniq_packages, installed_packages)
if (length(to_be_installed)==length(uniq_packages)) cat('All packages need to be installed.\n')
if (length(to_be_installed)>0) cat('Some packages already exist; installing remaining packages.\n')
if (length(to_be_installed)==0) cat('All packages installed already!\n')

# Install missing packages
if (length(to_be_installed)>0) install.packages(to_be_installed, repos = 'https://cloud.r-project.org')

# Remove the hashtag (#) below if you do not have the cbsodataR package installed, as this code requires it
#install.packages("cbsodataR")
#install.packages("stringr") # This package is necessaary to replace values.
#install.packages("dplyr")
#install.packages("data.table")
library(cbsodataR)
library(stringr)
library(plyr)
library(dplyr)
library(data.table)

# Creating the basic tables
table_of_content <- cbs_get_toc()
catalogs <-  cbs_get_catalogs()
metadata <- cbs_get_meta("47022NED", catalog = "politie")
perioden_police_ams <- c("2021MM01","2021MM02","2021MM03","2021MM04","2021MM05","2021MM06","2021MM07","2021MM08","2021MM09","2021MM10","2021MM11","2021MM12")

# Since the c() function is limited we couldn't include all 454 values in 1 c() function. We had to create 5 different lists that we add together in 1 list to loop over.                      
WijkEnBuurten_police_ams_1 <- c("BU03630000","BU03630001","BU03630002","BU03630003","BU03630004","BU03630100","BU03630101","BU03630102","BU03630103","BU03630104","BU03630105","BU03630106","BU03630107","BU03630200","BU03630201","BU03630202","BU03630203","BU03630300","BU03630301","BU03630302","BU03630303","BU03630304","BU03630305","BU03630306","BU03630400","BU03630401","BU03630402","BU03630403","BU03630404","BU03630405","BU03630406","BU03630407","BU03630408","BU03630500","BU03630501","BU03630502","BU03630503","BU03630505","BU03630506","BU03630600","BU03630602","BU03630603","BU03630604","BU03630605","BU03630606","BU03630607","BU03630608","BU03630609","BU03630610","BU03630611","BU03630700","BU03630701","BU03630702","BU03630703","BU03630704","BU03630705","BU03630706","BU03630707","BU03630800","BU03630801","BU03630803","BU03630804","BU03630900","BU03630901","BU03630902","BU03630903","BU03630904","BU03630905","BU03630907","BU03630908","BU03631000","BU03631001","BU03631002","BU03631003","BU03631004","BU03631005","BU03631006","BU03631007","BU03631100","BU03631102","BU03631103","BU03631104","BU03631105","BU03631107","BU03631109","BU03631200","BU03631201","BU03631300","BU03631301","BU03631302","BU03631303","BU03631304","BU03631305","BU03631306","BU03631307","BU03631400","BU03631401","BU03631402","BU03631403")
WijkEnBuurten_police_ams_2 <- c("BU03631404","BU03631405","BU03631500","BU03631501","BU03631502","BU03631503","BU03631600","BU03631601","BU03631602","BU03631700","BU03631800","BU03631801","BU03631900","BU03631901","BU03631902","BU03632000","BU03632001","BU03632002","BU03632100","BU03632101","BU03632200","BU03632201","BU03632300","BU03632301","BU03632302","BU03632303","BU03632304","BU03632400","BU03632401","BU03632402","BU03632403","BU03632404","BU03632500","BU03632501","BU03632502","BU03632503","BU03632600","BU03632601","BU03632602","BU03632700","BU03632701","BU03632702","BU03632800","BU03632801","BU03632802","BU03632803","BU03632900","BU03632901","BU03632902","BU03633000","BU03633001","BU03633100","BU03633101","BU03633102","BU03633200","BU03633201","BU03633202","BU03633203","BU03633300","BU03633301","BU03633302","BU03633303","BU03633304","BU03633305","BU03633306","BU03633307","BU03633308","BU03633309","BU03633310","BU03633400","BU03633402","BU03633403","BU03633404","BU03633405","BU03633406","BU03633500","BU03633501","BU03633502","BU03633504","BU03633505","BU03633600","BU03633601","BU03633700","BU03633702","BU03633703","BU03633704","BU03633705","BU03633706","BU03633802","BU03633803","BU03633900","BU03633901","BU03633902","BU03633903","BU03634000","BU03634001","BU03634002","BU03634100","BU03634101","BU03634102")
WijkEnBuurten_police_ams_3 <- c("BU03634103","BU03634200","BU03634201","BU03634202","BU03634203","BU03634300","BU03634301","BU03634400","BU03634401","BU03634402","BU03634403","BU03634404","BU03634405","BU03634500","BU03634501","BU03634600","BU03634601","BU03634602","BU03634603","BU03634700","BU03634701","BU03634702","BU03634703","BU03634704","BU03634705","BU03634706","BU03634707","BU03634708","BU03634709","BU03634800","BU03634801","BU03634802","BU03634803","BU03634804","BU03634805","BU03634900","BU03634901","BU03634902","BU03634903","BU03634904","BU03634905","BU03635000","BU03635001","BU03635003","BU03635005","BU03635006","BU03635100","BU03635101","BU03635102","BU03635200","BU03635201","BU03635202","BU03635203","BU03635206","BU03635207","BU03635300","BU03635301","BU03635400","BU03635401","BU03635402","BU03635403","BU03635404","BU03635501","BU03635502","BU03635503","BU03635504","BU03635505","BU03635506","BU03635507","BU03635508","BU03635600","BU03635601","BU03635602","BU03635603","BU03635604","BU03635605","BU03635606","BU03635607","BU03635608","BU03635700","BU03635701","BU03635702","BU03635801","BU03635804","BU03635805","BU03635806","BU03635807","BU03635808","BU03635809","BU03635900","BU03635901","BU03636000","BU03636001","BU03636002","BU03636100","BU03636101","BU03636102","BU03636103","BU03636200","BU03636201")
WijkEnBuurten_police_ams_4 <- c("BU03636300","BU03636400","BU03636401","BU03636402","BU03636403","BU03636404","BU03636500","BU03636501","BU03636502","BU03636503","BU03636601","BU03636602","BU03636603","BU03636604","BU03636605","BU03636606","BU03636700","BU03636701","BU03636800","BU03636801","BU03636802","BU03636803","BU03636804","BU03636805","BU03636900","BU03636902","BU03636909","BU03636910","BU03636911","BU03636912","BU03637000","BU03637001","BU03637002","BU03637003","BU03637004","BU03637005","BU03637102","BU03637104","BU03637105","BU03637106","BU03637107","BU03637200","BU03637201","BU03637202","BU03637300","BU03637301","BU03637302","BU03637303","BU03637304","BU03637305","BU03637306","BU03637307","BU03637308","BU03637309","BU03637400","BU03637401","BU03637402","BU03637500","BU03637501","BU03637502","BU03637503","BU03637600","BU03637601","BU03637700","BU03637701","BU03637702","BU03637703","BU03637704","BU03637705","BU03637800","BU03637801","BU03637802","BU03637803","BU03637804","BU03637900","BU03637901","BU03638000","BU03638001","BU03638002","BU03638100","BU03638101","BU03638102","BU03638103","BU03638104","BU03638200","BU03638201","BU03638202","BU03638203","BU03638300","BU03638301","BU03638400","BU03638401","BU03638402","BU03638500","BU03638501","BU03638502","BU03638600","BU03638601","BU03638602","BU03638603")
WijkEnBuurten_police_ams_5 <- c("BU03638604","BU03638605","BU03638700","BU03638701","BU03638702","BU03638703","BU03638704","BU03638705","BU03638800","BU03638801","BU03638802","BU03638803","BU03638804","BU03638805","BU03638806","BU03638807","BU03638808","BU03638809","BU03638900","BU03638901","BU03638902","BU03638903","BU03639000","BU03639002","BU03639003","BU03639004","BU03639008","BU03639009","BU03639100","BU03639101","BU03639102","BU03639103","BU03639200","BU03639201","BU03639202","BU03639203","BU03639204","BU03639205","BU03639206","BU03639500","BU03639501","BU03639502","BU03639600","BU03639601","BU03639602","BU03639603","BU03639604","BU03639605","BU03639606","BU03639700","BU03639701","BU03639702","BU03639703","BU03639800","BU03639801")
WijkEnBuurten_combined <- c(WijkEnBuurten_police_ams_1, WijkEnBuurten_police_ams_2, WijkEnBuurten_police_ams_3, WijkEnBuurten_police_ams_4, WijkEnBuurten_police_ams_5)

# Created a function which can be used to loop trough 'wijkenenbuurten' -> use WijkEnBuurten_combined as parameter
api_call_cbsdata <- function(wijk) { 
  api_data <- cbs_get_data("47022NED", 
                           catalog = "politie",
                           Perioden = perioden_police_ams,
                           WijkenEnBuurten = wijk,
                           select = c("WijkenEnBuurten","Perioden","SoortMisdrijf","GeregistreerdeMisdrijven_1"))
}

# Method 1: Combining the data in one dataframe. 
# Using the lapply() function and the data.table() to combine it all in one dataframe. 
#pls <- lapply(WijkEnBuurten_combined, api_call_cbsdata)
#pls.datatable <- data.table(do.call(rbind, pls))
#View(pls.datatable)

# Method 2: Combining the data in one dataframe. 
# Run the  code for every value in wijkEnBuurten_combined and write it to all_data
all_data <- data.frame() 
for (val in WijkEnBuurten_combined) 
{API_data_neighbourhood <-  api_call_cbsdata(val)
all_data <- rbind(all_data, API_data_neighbourhood)
}

# Renaming the columns to English
names(all_data)[names(all_data) == "WijkenEnBuurten"] <- "Neighborhoods"
names(all_data)[names(all_data) == "Perioden"] <- "Periods"
names(all_data)[names(all_data) == "SoortMisdrijf"] <- "CrimeType"
names(all_data)[names(all_data) == "GeregistreerdeMisdrijven_1"] <- "RegisteredCrimes"

# Categorizing the different crimes underneath each CrimeType. 
all_data$CrimeType <- str_replace(all_data$CrimeType, "0.0.0", "Total")

# Yellow = Robbery/Theft
rob <- c("1.1.1", "1.1.2", "1.2.1", "1.2.2", "1.2.3", "1.2.4", "1.2.5", "1.4.6", "1.4.7", "1.5.2", "1.6.2", "2.5.1", "2.5.2")
for (.v in rob)  all_data$CrimeType <- str_replace(all_data$CrimeType, .v, "Robbery/Theft")

# Red = Violence
vio <- c("1.3.1", "1.4.1", "1.4.2", "1.4.3", "1.4.4", "1.4.5", "1.6.1", "2.2.1", "2.4.1", "2.4.2", "3.6.4")
for (.v in vio) all_data$CrimeType <- str_replace(all_data$CrimeType, .v, "Violence")

# Purple = Smuggling
smu <- c("1.6.3", "3.1.1", "3.1.2", "3.1.3", "3.2.1", "3.2.2")
for (.v in smu) all_data$CrimeType <- str_replace(all_data$CrimeType, .v, "Smuggling")

# Blue = Inappropriateness
ina <- c("2.1.1","3.3.2","3.3.5","3.4.2","3.5.2","3.5.5","3.7.1","3.7.2")
for (.v in ina) all_data$CrimeType <- str_replace(all_data$CrimeType, .v, "Inappropriateness")

# Green = Environment
env <- c("2.6.1","2.6.2","2.6.3","2.6.4","2.6.5","2.6.7","2.6.8","2.6.9","2.6.10","2.6.11","2.6.12","2.6.13","2.6.14")
for (.v in env) all_data$CrimeType <- str_replace(all_data$CrimeType, .v, "Environment")

# Gray = Other
gra <- c("2.7.2","2.7.3","3.7.3","3.7.4","3.9.1","3.9.2","3.9.3")
for (.v in gra) all_data$CrimeType <- str_replace(all_data$CrimeType, .v, "Other")

# Categorizing the Neighborhood codes and assigning them under the correct City Area. 
# This is necessary so we can combine the City Areas from the Police Data set with the City Areas in the AirBnB Dataset. 
# City Areas:
bijlmer_centrum <- c("BU03639200","BU03639201","BU03639203","BU03639204","BU03639205","BU03639202","BU03639206")
for (.v in bijlmer_centrum) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Bijlmer-Centrum")

bos_en_lommer <- c("BU03633601","BU03633600","BU03633700","BU03633702","BU03633703","BU03633704","BU03633706","BU03633705","BU03633802","BU03633803","BU03633900","BU03633901","BU03633902","BU03633903")
for (.v in bos_en_lommer) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Bos en Lommer")

buitenveldert_zuidas <- c("BU03632300","BU03632301","BU03632302","BU03632303","BU03632304","BU03635900","BU03635901","BU03639004","BU03639000","BU03639002","BU03639003","BU03639008","BU03639009","BU03639103","BU03639100","BU03639101","BU03639102")
for (.v in buitenveldert_zuidas) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Buitenveldert - Zuidas")

centrum_oost <- c("BU03630300","BU03630301","BU03630302","BU03630303","BU03630304","BU03630305","BU03630306","BU03630400","BU03630401","BU03630402","BU03630403","BU03630404","BU03630405","BU03630406","BU03630407","BU03630408","BU03630700","BU03630701","BU03630702","BU03630703","BU03630704","BU03630705","BU03630706","BU03630707","BU03630800","BU03630801","BU03630804","BU03630803","BU03630901","BU03630902","BU03630903","BU03630905","BU03630907","BU03630908","BU03630900","BU03630904")
for (.v in centrum_oost) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Centrum-Oost")

centrum_west <- c("BU03630001","BU03630003","BU03630004","BU03630000","BU03630002","BU03630100","BU03630101","BU03630102","BU03630103","BU03630104","BU03630105","BU03630106","BU03630107","BU03630200","BU03630202","BU03630203","BU03630201","BU03630501","BU03630502","BU03630503","BU03630505","BU03630506","BU03630500","BU03630600","BU03630602","BU03630603","BU03630604","BU03630605","BU03630606","BU03630607","BU03630610","BU03630611","BU03630608","BU03630609")
for (.v in centrum_west) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Centrum-West")

de_akker_nieuw_sloten <- c("BU03638400","BU03638402","BU03638401","BU03638801","BU03638802","BU03638804","BU03638805","BU03638806","BU03638807","BU03638808","BU03638809","BU03638800","BU03638803")
for (.v in de_akker_nieuw_sloten) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "De Akker - Nieuw Sloten")

de_pijp_rivierenbuurt <- c("BU03632400","BU03632401","BU03632402","BU03632403","BU03632404","BU03632503","BU03632500","BU03632501","BU03632502","BU03632600","BU03632601","BU03632602","BU03635200","BU03635201","BU03635202","BU03635203","BU03635206","BU03635207","BU03635300","BU03635301","BU03635404","BU03635400","BU03635401","BU03635402","BU03635403")
for (.v in de_pijp_rivierenbuurt) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "De Pijp - Rivierenbuurt")

gaasperdam_driemond <- c("BU03639500","BU03639501","BU03639502","BU03639600","BU03639602","BU03639603","BU03639604","BU03639605","BU03639601","BU03639606","BU03639700","BU03639701","BU03639702","BU03639703","BU03639801","BU03639800")
for (.v in gaasperdam_driemond) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Gaasperdam - Driemond")

geuzenveld_slotermeer <- c("BU03631102","BU03631104","BU03631105","BU03631107","BU03631109","BU03631100","BU03631103","BU03637600","BU03637601","BU03637703","BU03637700","BU03637701","BU03637702","BU03637705","BU03637704","BU03637800","BU03637801","BU03637802","BU03637803","BU03637804","BU03637901","BU03637900")
for (.v in geuzenveld_slotermeer) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Geuzenveld - Slotermeer")

ijburg_zeeburgereiland <- c("BU03633400","BU03633404","BU03633402","BU03633403","BU03633405","BU03633406","BU03633500","BU03633501","BU03633502","BU03633504","BU03633505","BU03635000","BU03635001","BU03635003","BU03635005","BU03635006","BU03635100","BU03635101","BU03635102")
for (.v in ijburg_zeeburgereiland) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "IJburg - Zeeburgereiland")

noord_oost <- c("BU03636805","BU03636800","BU03636801","BU03636802","BU03636803","BU03636804","BU03636900","BU03636902","BU03636909","BU03636910","BU03636911","BU03636912","BU03637302","BU03637304","BU03637307","BU03637309","BU03637300","BU03637301","BU03637303","BU03637305","BU03637306","BU03637308","BU03637400","BU03637401","BU03637402")						
for (.v in noord_oost) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Noord-Oost")

noord_west <- c("BU03636500","BU03636502","BU03636503","BU03636501","BU03636602","BU03636604","BU03636603","BU03636605","BU03636606","BU03636601","BU03636701","BU03636700","BU03637001","BU03637004","BU03637005","BU03637000","BU03637002","BU03637003")
for (.v in noord_west) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Noord-West")

oostelijk_havengebied_indische_buurt <- c("BU03633100","BU03633101","BU03633102","BU03633200","BU03633201","BU03633202","BU03633203","BU03633301","BU03633303","BU03633309","BU03633307","BU03633308","BU03633300","BU03633302","BU03633304","BU03633305","BU03633306","BU03633310")
for (.v in oostelijk_havengebied_indische_buurt) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Oostelijk Havengebied - Indische Buurt")

osdorp <- c("BU03638000","BU03638002","BU03638001","BU03638100","BU03638101","BU03638102","BU03638103","BU03638104","BU03638203","BU03638200","BU03638201","BU03638202","BU03638300","BU03638301")
for (.v in osdorp) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Osdorp")

de_baarsjes_oud_west <- c("BU03631700","BU03631800","BU03631801","BU03631900","BU03631901","BU03631902","BU03632000","BU03632001","BU03632002","BU03632100","BU03632101","BU03632201","BU03632200","BU03634000","BU03634001","BU03634002","BU03634100","BU03634101","BU03634102","BU03634103","BU03634200","BU03634201","BU03634202","BU03634203","BU03634300","BU03634301","BU03637500","BU03637501","BU03637502","BU03637503")
for (.v in de_baarsjes_oud_west) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "De Baarsjes - Oud-West")

oud_noord <- c("BU03636001","BU03636000","BU03636002","BU03636102","BU03636103","BU03636100","BU03636101","BU03636200","BU03636201","BU03636300","BU03636400","BU03636401","BU03636403","BU03636404","BU03636402","BU03637102","BU03637104","BU03637105","BU03637106","BU03637107","BU03637200","BU03637201","BU03637202")
for (.v in oud_noord) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Oud-Noord")

oud_oost <- c("BU03632702","BU03632700","BU03632701","BU03632801","BU03632800","BU03632802","BU03632803","BU03632902","BU03632900","BU03632901","BU03633000","BU03633001")
for (.v in oud_oost) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Oud-Oost")

zuid <- c("BU03634401","BU03634400","BU03634402","BU03634403","BU03634404","BU03634405","BU03634500","BU03634501","BU03634600","BU03634601","BU03634602","BU03634603","BU03634706","BU03634704","BU03634705","BU03634700","BU03634701","BU03634702","BU03634703","BU03634707","BU03634708","BU03634709","BU03634800","BU03634801","BU03634802","BU03634803","BU03634804","BU03634805","BU03634901","BU03634900","BU03634902","BU03634903","BU03634904","BU03634905")							
for (.v in zuid) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Zuid")

slotervaart <- c("BU03638500","BU03638501","BU03638502","BU03638600","BU03638601","BU03638602","BU03638603","BU03638604","BU03638605","BU03638700","BU03638701","BU03638702","BU03638703","BU03638705","BU03638704","BU03638903","BU03638900","BU03638901","BU03638902")
for (.v in slotervaart) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Slotervaart")

watergraafsmeer <- c("BU03635501","BU03635502","BU03635503","BU03635504","BU03635505","BU03635506","BU03635507","BU03635508","BU03635602","BU03635606","BU03635608","BU03635600","BU03635601","BU03635603","BU03635604","BU03635605","BU03635607","BU03635700","BU03635701","BU03635702","BU03635801","BU03635805","BU03635809","BU03635804","BU03635806","BU03635807","BU03635808")
for (.v in watergraafsmeer) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Watergraafsmeer")

westerpark <- c("BU03631201","BU03631200","BU03631300","BU03631303","BU03631302","BU03631306","BU03631301","BU03631304","BU03631305","BU03631307","BU03631400","BU03631401","BU03631402","BU03631403","BU03631404","BU03631405","BU03631500","BU03631501","BU03631503","BU03631502","BU03631600","BU03631601","BU03631602")							
for (.v in westerpark) all_data$Neighborhoods <- str_replace(all_data$Neighborhoods, .v, "Westerpark")

# Since it is not possible to create the next chunk of code in a for loop, because all the values are unique. We did hard-code it.
all_data$Periods <- str_replace(all_data$Periods, "2021MM01", "Jan2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM02", "Feb2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM03", "Mrt2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM04", "Apr2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM05", "May2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM06", "June2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM07", "July2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM08", "Aug2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM09", "Sept2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM10", "Oct2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM11", "Nov2021")
all_data$Periods <- str_replace(all_data$Periods, "2021MM12", "Dec2021")

View(all_data)

all_data_crime_summarized <- all_data %>% 
  group_by(Neighborhoods, Periods, CrimeType) %>% 
  summarise(total_crime_sum = sum(RegisteredCrimes))

View(all_data_crime_summarized)

