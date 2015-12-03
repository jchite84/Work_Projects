library(ggplot2)

Summary <- read.csv("L:/Advancement/Justin/Call Officers/Al Gesler - Director of Major Gifts/2015 February 18 Proposed Visit Schedule Descriptives.csv")
  View(`2015.February.18.Proposed.Visit.Schedule.Descriptives`)

Summary$Last.Gift.5.Years <- Summary$Months.Since.Last.Gift/12

qplot(x = Last.Gift.5.Years, data = Summary, binwidth = 5)+
  scale_x_continuous(breaks = seq(0, 120, 5))

qplot(x = Last.Gift.Amount , data = Summary, binwidth = 25)+
  scale_x_continuous(limits = c(0,500), breaks = seq(0, 500, 50))
  
  

summary(Summary$Last.Gift.Amount)