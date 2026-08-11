# EX 03: Comparative Analysis using Synthetic Data
set.seed(42)
n <- 30

# Generate data
devops <- data.frame(
  Model = "DevOps",
  deployment_freq = rnorm(n, 8, 1.5),
  vulnerabilities = rpois(n, 6),
  mttr_hrs = rnorm(n, 5, 1)
)

devsecops <- data.frame(
  Model = "DevSecOps",
  deployment_freq = rnorm(n, 7, 1.2),
  vulnerabilities = rpois(n, 2),
  mttr_hrs = rnorm(n, 2.5, 0.7)
)

# Calculate means
data <- rbind(devops, devsecops)
summary_stats <- aggregate(. ~ Model, data, mean)

print(summary_stats, digits = 3)

# Plot charts
par(mfrow = c(1, 3)) 
barplot(summary_stats$deployment_freq, names.arg = summary_stats$Model, 
        col = c("coral", "steelblue"), main = "Deployments/Week")
barplot(summary_stats$vulnerabilities, names.arg = summary_stats$Model, 
        col = c("coral", "steelblue"), main = "Vulnerabilities Found")
barplot(summary_stats$mttr_hrs, names.arg = summary_stats$Model, 
        col = c("coral", "steelblue"), main = "MTTR (Hours)")
par(mfrow = c(1, 1))