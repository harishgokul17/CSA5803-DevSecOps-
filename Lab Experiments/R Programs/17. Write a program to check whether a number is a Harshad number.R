num <- 18
temp <- num
sum <- 0

while (temp > 0) {
  digit <- temp %% 10
  sum <- sum + digit
  temp <- temp %/% 10
}

if (num %% sum == 0) {
  cat("Harshad Number")
} else {
  cat("Not a Harshad Number")
}