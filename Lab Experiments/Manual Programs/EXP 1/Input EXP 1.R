# EX 01: DevSecOps R Environment Setup
library(DiagrammeR)
library(ggplot2)
library(igraph)

message("--- R Packages Loaded Successfully ---")

# Verify Git and Docker
tryCatch({
  system("git --version")
  system("docker --version")
}, warning = function(w) {
  message("Note: Git/Docker not found in R PATH, but R environment is ready.")
})

message("Environment is ready for DevSecOps experiments.")
