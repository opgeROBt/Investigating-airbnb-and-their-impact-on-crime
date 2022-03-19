all: join

download:
	Rscript src/download/airbnb_listings_download.R
	Rscript src/download/crime_data_download.R
	
derived: download
	Rscript src/derived/airbnb_listings_modification.R
	Rscript src/derived/crime_data_modification.R

join: derived
	Rscript src/derived/dataset_join.R