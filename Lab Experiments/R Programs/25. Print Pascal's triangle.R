n <- 5

for (i in 0:(n-1)) {
  num <- 1
  for (j in 0:i) {
    cat(num, " ")
    num <- num * (i - j) / (j + 1)
  }
  cat("\n")
}