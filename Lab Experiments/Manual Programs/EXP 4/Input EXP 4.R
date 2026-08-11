# EX 04: Security Risk Assessment and Risk Matrix Simulation
library(ggplot2)

# Define risks
risks <- data.frame(
  risk = c("SQL Injection", "Weak Password", "Unpatched OS", "S3 Bucket", "Phishing", "Insecure API"),
  likelihood = c(4, 5, 3, 2, 4, 3),
  impact = c(5, 3, 5, 4, 4, 3)
)

# Calculate scores
risks$score <- risks$likelihood * risks$impact
risks$category <- ifelse(risks$score >= 20, "Critical",
                         ifelse(risks$score >= 12, "High",
                                ifelse(risks$score >= 6, "Medium", "Low")))

print(risks[order(-risks$score), ], row.names = FALSE)

# Build Heatmap
heatmap_data <- as.data.frame(table(factor(risks$impact, levels=1:5),
                                    factor(risks$likelihood, levels=1:5)))
colnames(heatmap_data) <- c("Impact", "Likelihood", "Count")
heatmap_data$Impact <- as.numeric(as.character(heatmap_data$Impact))
heatmap_data$Likelihood <- as.numeric(as.character(heatmap_data$Likelihood))

ggplot(heatmap_data, aes(x = Likelihood, y = Impact, fill = Count)) +
  geom_tile(color = "white", linewidth = 0.5) +
  scale_fill_gradient(low = "white", high = "firebrick") +
  theme_minimal() +
  labs(title = "Risk Matrix Heatmap", x = "Likelihood (1-5)", y = "Impact (1-5)")