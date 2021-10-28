# cmdstanr-docker
This repository contains a docker image for cmdstanr version 0.4.0. It also contains R version 4.1.0

# Installation
The image is hosted on [dockerhub here](https://hub.docker.com/repository/docker/nathanielhaines/cmdstanr). Therefore, with docker already installed,you can pull the image to your local machine using the following command:

`docker pull nathanielhaines/cmdstanr`

# Running the image
Once the image is installed, you can open an R instance using the following command: 

`docker run -it nathanielhaines/cmdstanr`

## Testing the installation
Running the image will start up an R instance. There, you can run the following example code to see `cmdstanr` in action:

```
# Load cmdstanr
library(cmdstanr)

# Get the compiled stan file for this example
file <- file.path(cmdstan_path(), "examples", "bernoulli", "bernoulli.stan")
mod <- cmdstan_model(file)

# Create some fake data and fit the model
data_list <- list(N = 10, y = c(0,1,0,0,0,0,0,0,0,1))

fit <- mod$sample(
  data = data_list,
  seed = 123,
  chains = 4,
  parallel_chains = 4,
  refresh = 500
)

# Summarize the results
fit$summary()
```   
