report.html: report.Rmd code/03_render_report.R data descript regression
	Rscript code/03_render_report.R

data:
	Rscript code/00_make_data.R
	
descript:
	Rscript code/01_make_descript.R
	
regression:
	Rscript code/02_make_regression.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f *.html
	
.PHONY:install
install:
	Rscript -e "renv::restore(prompt=FALSE)"