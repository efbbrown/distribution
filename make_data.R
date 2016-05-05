# Load necessary packages
pacman::p_load(data.table, magrittr, EnvStats)
pacman::p_load_gh("efbbrown/make")

# Return three columns relating to each variable type
var_gen <- function(r_gen, d_gen, n, dist_name, ...) {
  
  x <- r_gen(n, ...) %>% sort
  
  y <- d_gen(x, ...)
  
  y_d <- runif(n, min = 0, max = y)
  
  res <- data.table(x, y, y_d)
  
  cols <- paste(c("x", "y", "y_d"), dist_name, sep = "_")
  
  setnames(res, cols)
  
  return(res)
  
}

# If file already exits load it, otherwise run the function to create it
data <- make_once("data/data", function() {
  # The number of each variable to create, the number of rows in data
  n <- 500
  
  set.seed(100)
  
  # The discrete distributions
  poisson <- var_gen(rpois, dpois, n, "poisson", lambda = 10)
  
  binoms <- var_gen(rbinom, dbinom, n, "binom", size = 60, prob = 0.5)
  
  # The continuous distributions
  normals <- var_gen(rnorm, dnorm, n, "normal")
  
  exps <- var_gen(rexp, dexp, n, "exp")
  
  gammas <- var_gen(rgamma, dgamma, n, "gamma", shape = 2)
  
  lognormals <- var_gen(rlnorm, dlnorm, n, "lognormal")
  
  cauchys <- var_gen(rcauchy, dcauchy, n, "cauchy", scale = 0.1)
  
  logis <- var_gen(rlogis, dlogis, n, "logis")
  
  data <- cbind(normals, binoms, poisson, exps, gammas, lognormals, logis,
                poisson)
  
  data <- round(data, digits = 4)
  
  data$fall_order <- sample(1:n, n)
  
  return(data)
  
})

# write.csv(data, "www/data/data.csv", row.names = F)