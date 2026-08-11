# EX 05: Threat Propagation and Attack Surface Analysis
library(igraph)
set.seed(1)

# Build network
g <- erdos.renyi.game(n = 15, p.or.m = 0.2, type = "gnp")
V(g)$name <- paste0("Host-", 1:15)

# Find most exposed host
deg_centrality <- degree(g, mode="all", normalized=TRUE)
most_exposed <- which.max(deg_centrality)
cat(sprintf("Most Exposed Host: %s\n", V(g)$name[most_exposed]))

# Simulate threat propagation
infected <- most_exposed
for (round_num in 1:5) {
  new_infections <- c()
  for (node in infected) {
    for (neighbor in neighbors(g, node)) {
      if (!(neighbor %in% infected) && runif(1) < 0.4) {
        new_infections <- c(new_infections, as.numeric(neighbor))
      }
    }
  }
  infected <- unique(c(infected, new_infections))
  cat(sprintf("Round %d: Infected Hosts = %d\n", round_num, length(infected)))
}

# Visualize
V(g)$color <- ifelse(1:vcount(g) %in% infected, "tomato", "lightgreen")
plot(g, main = "Threat Propagation Result (Red = Infected)", vertex.size = 20)