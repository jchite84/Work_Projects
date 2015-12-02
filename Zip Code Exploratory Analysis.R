library(zipcode)
library(ggplot2)
library(gtable)
library(reshape2)
library(plyr)

#import files
prospects <- read.csv("C:/Users/110427052/Desktop/2015 November 4 Prospects.csv")
zips <- read.csv ("C:/Users/110427052/Desktop/GIS Data Files/zip_codes_states population and ratio tab.csv")
#Clean Zip Codes
prospects$Zip <- clean.zipcodes(prospects$Zip)
zips$zip_code <- clean.zipcodes(zips$zip_code)

#Merge and subset files
prospects.zip <- prospects[,c(3, 14:19, 23, 28)]
prospects.zip <- merge(prospects.zip, zips, by.x = "Zip", by.y = "zip_code")
prospects.zip1 <- subset(prospects.zip, prospects.zip$Ratio != "#N/A")

#Convert Ratio and Capacity from factor to numeric
prospects.zip1$Ratio1 <- as.numeric(as.character(prospects.zip1$Ratio))
prospects.zip1$Capacity <- substring(prospects.zip1$X5.Yr.Cap, 2)
prospects.zip1$Capacity <- as.numeric(sub(",", "", as.character(prospects.zip1$Capacity)))
#Remove NA
prospects.zip1 <- prospects.zip1[complete.cases(prospects.zip1[,18]),]
#Histograms of Capacity and Ratio Distributions - Skewed Right
qplot(prospects.zip1$Ratio1)
qplot(prospects.zip1$Capacity, binwidth = 2500, xlim = c(0, 100000))
#Scatter Plot with Regression Line
ggplot(data = prospects.zip1, aes(prospects.zip1$Ratio1, prospects.zip1$Capacity))+
  geom_point()+
  stat_smooth(method = "lm")
#Scatter Plot Zoomed at 0-150,000 Capacity Range
ggplot(data = prospects.zip1, aes(prospects.zip1$Ratio1, prospects.zip1$Capacity))+
  geom_point()+
  stat_smooth(method = "lm")+
  ylim(0,150000)+
  geom_line(y = 25000)


#LM 
model <- lm(prospects.zip1$Capacity ~ prospects.zip1$Ratio1)
#Residuals
res <- resid(model)
#Plots of Residuals (Histogram, Q-QPlot)
qplot(res, xlim = c(-60000, 100000))
#Run Together
qqnorm(res)
qqline(res)
#Summary of LM
summary(model)

#Determine if the subset sample is representative of the population

population.state <- as.data.frame(table(prospects.zip$ST))
sample.state <- as.data.frame(table(prospects.zip1$ST))
compare.state <- merge(population.state, sample.state, by = "Var1")
ggplot(prospects.zip, aes(x = ST))+
  geom_bar()
ggplot(prospects.zip1, aes(x = ST))+
  geom_bar()

#Determined "Magic Number" was ~.17
#Subset Zips and Merge with Prospects
#Convert Ratio from factor to numeric on zips dataset
zips$Ratio1 <- as.numeric(as.character(zips$Ratio))
#Subset Zips
good.zips <- subset(zips, Ratio1 >= 0.17)
#Merge with Prospects to get new list
discovery.prospects <- merge(prospects, good.zips, by.x = "Zip", by.y = "zip_code")
#Export final list
write.csv(discovery.prospects, "L:/Advancement/Justin/Projects/Zip Code Ratio Prospects.csv")