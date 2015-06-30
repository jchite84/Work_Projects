cap <- function(income, real){
  wealth <- income/0.185
  if (real < 75000){
  realwealth <- real/.48
  } else { 
    realwealth <- real/.42
  }
  IncomeBased <- wealth * .05
  AssetBased <- realwealth * .05
  capacity1 <- list(IncomeBased, AssetBased)
  capacity2 <- as.numeric(capacity1)
  meancap <- mean(capacity2)
  returncap <- list(capacity2, meancap)
  return(returncap)
}


