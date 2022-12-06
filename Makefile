report.html: report.rmd code/03_render_report.R data descript regression
	Rscript code/03_render_report.R

.PHONY: data
data:
	Rscript code/00_make_data.R
	
descript: data
	Rscript code/01_make_descript.R
	
regression: data
	Rscript code/02_make_regression.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f *.html
	
.PHONY:install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

	
PROJECTFILES = report.Rmd code/03_render_report.R data descript regression 
RENVFILES = renv.lock renv/activate.R renv/settings.dcf

AnyueRae/project_image:
	docker build -t project_image_3 . 
	
	
final_report/report.html:
	docker run -v "/$$(pwd)/final_project":/project/final_project anyuerae/project_image
