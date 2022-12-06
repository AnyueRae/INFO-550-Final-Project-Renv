FROM rocker/r-ubuntu
RUN apt-get update
RUN apt-get install -y pandoc libcurl4-openssl-dev cmake
RUN apt-get update && apt-get install -y data.table

# set packages
RUN Rscript -e "install.packages('config')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('labelled')"
RUN Rscript -e "install.packages('gtsummary')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('car')"
RUN Rscript -e "install.packages('plyr')"
RUN Rscript -e "install.packages('reshape2')"
RUN Rscript -e "install.packages('kableExtra')"
RUN Rscript -e "install.packages('expss')"


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
RUN mkdir final_project
CMD make && mv report.html final_project