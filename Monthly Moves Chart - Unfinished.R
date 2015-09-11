#Monthly Moves Chart
library(ggplot2)

moves.month <- read.csv("L:/Advancement/Justin/...")
moves.all <- read.csv("L:/Advancement/Justin/...")

moves <- subset(moves, Solicitation_Code != "")

solicitor.moves <- ggplot(..., color = "Solicitation_Code")+
  facet_wrap(Solicitor)
all.moves <- ggplot(..., color = "Solicitation_Code")+
  facet_wrap(Month)
  
write.csv(moves.all, "L:/Advancement/Justin/...", append = TRUE)