num <- 7
flag <- 1

for (i in 2:(num-1)) {
  if (num %% i == 0) {
    flag <- 0
    break
  }
}

if (flag == 1 && num > 1) {
  cat("Prime Number")
} else {
  cat("Not a Prime Number")
}