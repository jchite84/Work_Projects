#Monthly Moves Chart
library(ggplot2)
library(stringr)
library(gridExtra)
library(reshape2)
library(tidyr)
library(dplyr)

#Imports Moves File
moves.all <- read.csv("L:/Advancement/Justin/General/December Reports/2016 January 7 December Moves.csv")
#Subset by prospects with code - works
moves.all <- subset(moves.all, Solicitation.Code != "")

#Cleans Solicitation Code Text and Converts Back to Factor
moves.all$Solicitation.Code <- str_trim(moves.all$Solicitation.Code, side = "both")
moves.all$Solicitation.Code <- substr(moves.all$Solicitation.Code, 1, 5)
moves.all$Solicitation.Code <- str_to_upper(moves.all$Solicitation.Code)
moves.all$Solicitation.Code <- as.factor(moves.all$Solicitation.Code)
moves.all$Solicitation.Code <- factor(moves.all$Solicitation.Code, levels = c("DISCO", "CULTI", "READY", "SOLIC", "STEWA"))

#Subset Assigned Moves
moves.assigned <- subset(moves.all, Solicitor != ""& Solicitation.Code != "NA")
moves.unassigned <- subset(moves.all, Solicitation.Code != "NA")
#Plot per month - works - will need to save each month to append. Need to add summary table at bottom
#Summary Chart of Moves
moves.chart <- dcast(moves.assigned, Solicitor~Solicitation.Code, margins = TRUE)
#Converts table to GROB
moves.grob <- tableGrob(moves.chart)
#Plots Summary
moves.plot <- ggplot(data = moves.assigned, aes(Solicitor))+
  geom_histogram(aes(fill = moves.assigned$Solicitation.Code))
all.plot <- ggplot(data= moves.unassigned, aes(Solicitor))+
  geom_histogram(aes(fill = moves.unassigned$Solicitation.Code))
#Plots Graph and Chart Together
grid.arrange(moves.plot, moves.grob)

#Summary Chart of Moves.All
#all.moves <- ggplot(..., color = "Solicitation_Code")+
#  facet_wrap(Month)

#write.csv(moves.all, "L:/Advancement/Justin/...", append = TRUE)

#Write Monthly Moves Summary 
write.csv(moves.chart, "L:/Advancement/Justin/General/December Reports/January 7 2016 December Moves Summary.csv")