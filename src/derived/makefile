all: derived_step_3

derived_step_1:
	Rscript airbnb_listings_modification.R
	
derived_step_2: derived_step_1
	Rscript crime_data_modification.R
	
derived_step_3: derived_step_2
	Rscript dataset_join.R