n <- 5

for (i in 1:n) {
  for (j in 1:(n-i)) {
    cat(" ")
  }
  for (k in 1:(2*i-1)) {
    cat("*")
  }
  cat("\n")
}