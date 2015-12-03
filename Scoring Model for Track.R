# Track Project Scoring Model #
#=============================================================
# Simple scoring model to discover potential track prospects
# Weights are as follows:
# Was Student Athlete = 3
# Was Track Athlete = 5
# Recent Event Attendance = .25 per event since 2009
# Lifetime Giving (25K+ = 5, 10-24K = 3, 5-10K = 1)
# Capacity (25K+ = 2, 15-25K = 1, 10-15K = .5)
#=============================================================

#=============================================================
# Import necessary libraries and data sets
#=============================================================

library(reshape2)
prospects <- read.csv("C:/Users/110427052/Desktop/2015 December 1 Prospects.csv")
all.athletes <- read.csv("L:/Advancement/Justin/Projects/Track Scoring Model/2015 December 2 All Athletes.csv")
events <- read.csv("L:/Advancement/Justin/Projects/Track Scoring Model/Test Events.csv")

#Removes extraneous columns from prospects data set

prospects.reduced <- prospects [, c(3, 1, 4, 5, 8, 10, 14:19, 21, 22, 25, 28, 36, 87:91)]

#=================================================================
# Calculate the Event Score
# Uses dcast to calculate the number of events attended each year
# and sums the results.
# merge with "all.x = TRUE" does an outside join to the main table
#==================================================================

events.attendance <- dcast(events, PEOPLE_CODE_ID~YEAR, margins = TRUE )
events.attendance <- events.attendance[,c(1, 11)]
events.attendance$EVENT_SCORE <- events.attendance[,2]*.25
events.attendance$PEOPLE_CODE_ID <- as.integer(substr(events.attendance$PEOPLE_CODE_ID, 2, 10))
prospects.reduced <- merge(prospects.reduced, events.attendance, by.x = "ID", by.y = "PEOPLE_CODE_ID", all.x = TRUE)
prospects.reduced <- prospects.reduced[,c(1:22, 24)]

#==================================================================
# Atletics Counts
# Creates subset of all track and field denominations, then dedupes
# Creates a column for the Track Score (5)
# Dedupes athletes and creates an Athlete Score column (3)
# Cleans the PEOPLE_CODE_ID (removes the P Prefix used in PowerCampus)
# Merges scores to main table
#====================================================================

track <- subset(all.athletes, ASSOCIATION == "CRCTYW"|ASSOCIATION == "CRSCTY"|ASSOCIATION == "TRKFIE"|ASSOCIATION == "TRKIND"|
                  ASSOCIATION == "TRKINW"|ASSOCIATION == "TRKOTW"|ASSOCIATION == "TRKOUT")
track <- unique(track[c("PEOPLE_CODE_ID")])
track$TRACK_SCORE <- matrix(5, ncol = 1, nrow = 761)
track$PEOPLE_CODE_ID <- as.integer(substr(track$PEOPLE_CODE_ID, 2, 10))
athletes <- unique(all.athletes[c("PEOPLE_CODE_ID")])
athletes$ATHLETE_SCORE <- matrix(3, ncol = 1, nrow = 3747)
athletes$PEOPLE_CODE_ID <- as.integer(substr(athletes$PEOPLE_CODE_ID, 2, 10))

prospects.reduced <- merge(prospects.reduced, athletes, by.x = "ID", by.y = "PEOPLE_CODE_ID", all.x = TRUE)
prospects.reduced <- merge(prospects.reduced, track, by.x = "ID", by.y = "PEOPLE_CODE_ID", all.x = TRUE)

#=====================================================================
# Converts money "factor" fields to integers for capacity and giving
# Valuable code snippet for other projects
# Relace NA values with 0 before running the scoring loops
#=====================================================================

prospects.reduced[,15] <- substring(prospects.reduced[,15], 2)
prospects.reduced[,15] <- sub(x = prospects.reduced[,15], ",", "")
prospects.reduced[,15] <- as.numeric(prospects.reduced[,15])

prospects.reduced[,16] <- substring(prospects.reduced[,16], 2)
prospects.reduced[,16] <- sub(x = prospects.reduced[,16], ",", "")
prospects.reduced[,16] <- as.numeric(prospects.reduced[,16])

prospects.reduced[is.na(prospects.reduced)]<- 0 

#=======================================================================
# Scoring loops
# Creates blank matrices that populate with values from the for loop
# Cbinds columns to main table
#=======================================================================

GIVING_SCORE <- matrix(nrow = 23750)

CAPACITY_SCORE <- matrix(nrow = 23750)

for (i in 1:nrow(prospects.reduced)){
    if (prospects.reduced[i, 15] >= 25000){
        GIVING_SCORE[i,] = 5}
    else if(prospects.reduced[i,15] < 25000 & prospects.reduced[i,15] > 10000){
        GIVING_SCORE[i,] = 3}
    else if(prospects.reduced[i,15] < 10000 & prospects.reduced[i,15] > 5000){
        GIVING_SCORE[i,] = 1}
    else {
        GIVING_SCORE[i,] = 0}
}

for (j in 1:nrow(prospects.reduced)){
    if (prospects.reduced[j, 16] >= 25000){
        CAPACITY_SCORE[j,] = 2}
    else if(prospects.reduced[j, 16] < 25000 & prospects.reduced[j, 16] > 15000){
        CAPACITY_SCORE[j,] = 1}
    else if(prospects.reduced[j, 16] < 15000 & prospects.reduced[j, 16] > 10000){
        CAPACITY_SCORE[j,] = .5}
    else{
        CAPACITY_SCORE[j,] = 0}
}

prospects.reduced <- cbind(prospects.reduced, GIVING_SCORE, CAPACITY_SCORE)

#=============================================================================
# Runs script to replace NA values with 0 again. Probably not necessary
# Sums score columns (Athlete, Track, Capacity, Giving)into a composite score
# Uses scale() to calculate population z-score
# Removes intermediate data frames
# Writes CSV to file
#==============================================================================

prospects.reduced[is.na(prospects.reduced)]<- 0 
prospects.reduced$SCORE <- rowSums(prospects.reduced[,23:27])
prospects.reduced$Z_SCORE <- scale(results$SCORE, center = TRUE, scale = TRUE)
rm(GIVING_SCORE, CAPACITY_SCORE, all.athletes, athletes, board, events2, events.attendance2, prospects, track, i, j)
write.csv(prospects.reduced, "L:/Advancement/Justin/Projects/Track Scoring Model/2015 December 2 Results.csv")

  