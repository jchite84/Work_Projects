#Event Briefing Merge

prospects <- read.csv("C:/Users/110427052/Desktop/2015 October 22 Prospects.csv")
interests <- read.csv("C:/Users/110427052/Desktop/Volunteer Interest.csv")
sanFran <- subset(interests, START_DATE1 == "10/27/2015")
seattle <- subset(interests, START_DATE1 == "10/28/2015")

sanFran <- merge(prospects, sanFran, by.x = "ID", by.y = "PEOPLE_ID")
sanFran <- sanFran[,1:91]
seattle <- merge(prospects, seattle, by.x = "ID", by.y = "PEOPLE_ID")
seattle <- seattle[,1:91]

write.csv(sanFran, "L:/Advancement/Justin/Alumni/Event Briefings/2015 October 27 SanFran.csv")
write.csv(seattle, "L:/Advancement/Justin/Alumni/Event Briefings/2015 Octover 28 Seattle.csv")


