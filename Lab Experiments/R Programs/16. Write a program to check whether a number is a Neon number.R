num <- 9
square <- num^2
sum <- 0

while (square > 0) {
  digit <- square %% 10
  sum <- sum + digit
  square <- square %/% 10
}

if (sum == num) {
  cat("Neon Number")
} else {
  cat("Not a Neon Number")
}