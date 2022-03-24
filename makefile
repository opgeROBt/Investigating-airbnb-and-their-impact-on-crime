all: markdown

download:
	make -C src/download
	
derived: download
	make -C src/derived
	
markdown: derived
	Rscript -e "rmarkdown::render('src/data-analysis/analysis.Rmd', output='../../gen')"