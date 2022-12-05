FROM rocker/r-ubuntu
RUN apt-get update && apt-get install -y pandoc
ENV RENV_VERSION 0.16.0
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
RUN mkdir /project
WORKDIR /project
COPY Makefile .
COPY .gitignore . 
COPY renv.lock .
COPY README.md .
RUN mkdir code
RUN mkdir output 
RUN mkdir data
COPY data data 
COPY code code 
COPY report.rmd .
RUN mkdir -p renv
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.dcf renv/settings.dcf
RUN Rscript -e "renv::restore(prompt = FALSE)"
RUN mkdir final_project
CMD make && mv report.html final_report