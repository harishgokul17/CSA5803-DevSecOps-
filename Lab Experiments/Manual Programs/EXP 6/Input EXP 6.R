# EX 06: Design and Simulation of Shift-Left Security Workflow
set.seed(7)

cost_mult <- c("Code"=1, "SAST Scan"=1, "Build"=2, "SCA Scan"=2,
               "Test"=5, "DAST Scan"=5, "Security Scan"=10,
               "Release"=15, "Deploy"=30)

# Simulation logic
simulate_pipeline <- function(stage_pool) {
  cost <- 0
  for (i in 1:10) { cost <- cost + cost_mult[sample(stage_pool, 1)] }
  return(cost)
}

# Run simulations
trad_pool <- c(rep("Security Scan", 6), rep("Release", 4))
shift_pool <- c(rep("SAST Scan", 5), rep("SCA Scan", 3), rep("DAST Scan", 2))

trad_cost <- simulate_pipeline(trad_pool)
shift_cost <- simulate_pipeline(shift_pool)

cat("Traditional Pipeline Remediation Cost:", trad_cost, "units\n")
cat("Shift-Left Pipeline Remediation Cost:", shift_cost, "units\n")

cost_reduction <- ((trad_cost - shift_cost) / trad_cost) * 100
cat(sprintf("\nCost Reduction with Shift-Left Approach: %.1f%%\n", cost_reduction))