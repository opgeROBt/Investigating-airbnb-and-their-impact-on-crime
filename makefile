all: markdown

install_packages:
	make -C src/tools

download: install_packages
	make -C src/download
	
derived: download
	make -C src/derived
	
markdown: derived
	Rscript -e "rmarkdown::render('src/data-analysis/analysis.Rmd', output_file='../../gen')"