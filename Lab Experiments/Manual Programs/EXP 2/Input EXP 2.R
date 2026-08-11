# EX 02: Visualization of the DevSecOps Lifecycle
library(DiagrammeR)

# Generate the directed graph
grViz("
digraph devsecops {
  graph [rankdir = LR]
  node [shape = box, style = filled, fillcolor = lightblue, fontname = Helvetica]

  Plan [label = 'Plan\\n[Threat Modelling]']
  Code [label = 'Code\\n[SAST]']
  Build [label = 'Build\\n[SCA]']
  Test [label = 'Test\\n[DAST]']
  Release [label = 'Release\\n[Image Scan]']
  Deploy [label = 'Deploy\\n[IaC Scan]']
  Operate [label = 'Operate\\n[Runtime Protection]']
  Monitor [label = 'Monitor\\n[Continuous Auditing]']

  Plan -> Code -> Build -> Test -> Release -> Deploy -> Operate -> Monitor
  Monitor -> Plan [label = 'Feedback Loop', style = dashed]
}
")