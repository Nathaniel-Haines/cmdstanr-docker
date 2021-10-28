FROM debian:buster
MAINTAINER Nathaniel Haines <nathaniel.b.haines@gmail.com>

WORKDIR /cmdstanr

From r-base:4.1.0
RUN apt-get update && apt-get install --no-install-recommends -qq wget ca-certificates make g++ 

ENV R_BASE_VERSION 4.1.0
RUN Rscript -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))'
RUN Rscript -e 'cmdstanr::install_cmdstan()'

ENV NAME cmdstanr-docker
