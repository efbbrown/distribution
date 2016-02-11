pacman::p_load(data.table, magrittr, EnvStats)

pacman::p_load_gh("efbbrown/make")

data <- make("data/data", function() {
  
  n <- 700
  
  set.seed(100)
  
  var_gen <- function(r_gen, d_gen, n, dist_name, ...) {
    
    x <- r_gen(n, ...)
    
    y <- d_gen(x, ...)
    
    y_d <- runif(n, min = 0, max = y)
    
    res <- data.table(x, y, y_d)
    
    cols <- paste(c("x", "y", "y_d"), dist_name, sep = "_")
    
    setnames(res, cols)
    
    return(res)
    
  }
  
  normals <- var_gen(rnorm, dnorm, n, "normal")
  
  exps <- var_gen(rexp, dexp, n, "exp")
  
  gammas <- var_gen(rgamma, dgamma, n, "gamma", shape = 2)
  
  lognormals <- var_gen(rlnorm, dlnorm, n, "lognormal")
  
  cauchys <- var_gen(rcauchy, dcauchy, n, "cauchy", scale = 0.1)
  
  logis <- var_gen(rlogis, dlogis, n, "logis")
  
  tris <- var_gen(rtri, dtri, n, "tri")
  
  data <- cbind(normals, exps, gammas, lognormals, logis, tris)
  
  data <- round(data, digits = 4)
  
  return(data)
  
}, max.age = as.difftime(10, units = "secs"))

write.csv(data, "www/data/data.csv", row.names = F)