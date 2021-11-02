# Use R version 4.1.0
FROM r-base:4.1.0
MAINTAINER "Nathaniel Haines" <nathaniel.b.haines@gmail.com>

# Copy example cmdstanr file to working directory
COPY cmdstanr-example.R /usr/local/src/cmdstanr/cmdstanr-example.R
WORKDIR /usr/local/src/cmdstanr

# Install cmdstanr and cmdstan
RUN Rscript -e 'install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))'
RUN Rscript -e 'cmdstanr::install_cmdstan()'

# Default to bash terminal when running docker image
CMD ["bash"]

