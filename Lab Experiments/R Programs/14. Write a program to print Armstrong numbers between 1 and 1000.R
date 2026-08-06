cat("Armstrong numbers from 1 to 1000:\n")

for (num in 1:1000) {
  temp <- num
  sum <- 0
  
  while (temp > 0) {
    digit <- temp %% 10
    sum <- sum + digit^3
    temp <- temp %/% 10
  }
  
  if (sum == num) {
    cat(num, " ")
  }
}