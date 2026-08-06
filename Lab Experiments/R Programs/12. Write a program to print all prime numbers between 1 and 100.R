cat("Prime numbers from 1 to 100:\n")

for (num in 1:100) {
  flag <- 1
  
  if (num <= 1) flag <- 0
  
  for (i in 2:(num-1)) {
    if (num %% i == 0) {
      flag <- 0
      break
    }
  }
  
  if (flag == 1) {
    cat(num, " ")
  }
}