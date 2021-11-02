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

