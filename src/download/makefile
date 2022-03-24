all: download_step_2

download_step_1:
	Rscript airbnb_listings_download.R
	
download_step_2: download_step_1
	Rscript crime_data_download.R