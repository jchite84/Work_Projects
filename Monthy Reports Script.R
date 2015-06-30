#1 Month Summary of All Actions

library(reshape2)

#Director's Numbers - Needs Imported with No Changes
DN <- read.csv("L:/Advancement/Justin/Call Officers/All Directors/Director's Numbers for R Script.csv")
 
#STOP!!Import Actions File - Filename Needs Updated!!
Month.Actions.Ind <- read.csv("L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 May Actions.csv")
Month.Actions.Orgs <- read.csv("L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 Range Test Orgs.csv", header = FALSE)
colnames(Month.Actions.Orgs)<- c("SOLICITOR_CODE", "PEOPLE_CODE_ID", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", 
                                 "STATE", "ACTION_ID", "SCHEDULED_DATE", "EXECUTION_DATE", "COMPLETED_BY", "NOTE")
Month.Actions <- rbind(Month.Actions.Ind, Month.Actions.Orgs)
#Adds Solicitor Information to Report
Month.Actions <- merge(Month.Actions, DN)
#Pivot Table
Month.Summary <- dcast(Month.Actions, TITLE~ACTION_ID, value.var = "EXECUTION_DATE", length, margins = TRUE)

#CHANGE OUTPUT FILE NAME BEFORE EXPORT
write.csv(Month.Summary, file = "L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 May Actions Summary.csv")
write.csv(Month.Actions, file = "L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 May Actions.csv")


#===============================================================================#
#Visits Only For Date Range Summary
#!!May not need to reimport reshape!!
library(reshape2)
library(lubridate)
#STOP!!Import Range Actions File - Filename Needs Updated!!
Range.Actions.Ind <- read.csv("L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 Range Test.csv")
Range.Actions.Orgs <- read.csv("L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 Range Test Orgs.csv", header = FALSE)
colnames(Range.Actions.Orgs)<- c("SOLICITOR_CODE", "PEOPLE_CODE_ID", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", 
                                 "STATE", "ACTION_ID", "SCHEDULED_DATE", "EXECUTION_DATE", "COMPLETED_BY", "NOTE")
Range.Actions <- rbind(Range.Actions.Ind, Range.Actions.Orgs)


#Adds Solicitor Information to Report
Range.Actions <- merge(Range.Actions, DN)
#Adds MONTH_YEAR Column
Range.Actions.Date <- strptime(x = as.character(Range.Actions$EXECUTION_DATE), format = "%m/%d/%Y %H:%M:%S")
Range.Actions <- cbind(Range.Actions, paste(month(Range.Actions.Date), "/", year(Range.Actions.Date)))
colnames(Range.Actions)[14] <- "MONTH_YEAR"
rm(Range.Actions.Date)
#Subset Range to Only Include Actios
Range.Actions <- subset(Range.Actions, ACTION_ID == "CAFC2FC")
#Pivot Table
Range.Summary <- dcast(Range.Actions, TITLE~MONTH_YEAR, value.var = "ACTION_ID", length, margins = TRUE) 

#STOP! Reorder Columns - MODIFY AS NEEDED
Range.Summary <- Range.Summary[c(1,3,4,2,5)]

#CHANGE OUTPUT FILE NAME BEFORE EXPORT
write.csv(Range.Summary, file = "L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 Visit Only Summary Test.csv")
write.csv(Range.Actions, file = "L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 Visit Only.csv")

#==============================================================================#
#Mailing List with Filters
#Need Zip Codes within Radius, Prospects by State, Cumulative Giving From Selected FY Forward

library(reshape2)
#Change File Names As Needed!!
prospects <- read.csv("L:/Advancement/Justin/Call Officers/Justin Reports/2015 June 30 OH PA WV MD.csv")
zips <- read.csv("L:/Advancement/Justin/Call Officers/Justin Reports/2015 June 30 75 Pittsburgh Test.csv")
giving <- read.csv("L:/Advancement/Justin/Call Officers/Justin Reports/2015 June 29 FY2014 2015 Giving.csv")
employees <- read.csv("L:/Advancement/Justin/Call Officers/Justin Reports/Employees.csv")

#Filter and ReOrder All Giving 
giving <- giving[,c(1, 21, 22)]
giving$PEOPLE_ID <- giving[,1]
giving <- giving [,c(4,2,3)]
#Remove $ from giving and convert to integer
giving$TotalGivingAmount <- substring(giving$TotalGivingAmount, 2)
giving$PledgeBalanceSum <- substring(giving$PledgeBalanceSum, 2)
giving$TotalGivingAmount <- as.integer(giving$TotalGivingAmount)
giving$PledgeBalanceSum <- as.integer(giving$PledgeBalanceSum)
#Add Giving Data to prospects file
prospects <- merge(prospects, giving, by = c("PEOPLE_ID", "PEOPLE_ID"), all = TRUE)

#Remove Plus 4 from Zip Code and convert to integer
prospects$ZIP_CODE <- substring(prospects$ZIP_CODE, 1, 5)
prospects$ZIP_CODE <- as.integer(prospects$ZIP_CODE)
#Create Logical of Zips that are in Target Radius, attache to prospects, filter
zipsInRadius <- prospects$ZIP_CODE %in% zips$Zips
prospects <- cbind(prospects, zipsInRadius)
prospects <- subset(prospects, zipsInRadius == "TRUE")
rm(zipsInRadius)

#Creates Logical of Employees and Separates into new dataframe
is.employee <- prospects$PEOPLE_ID %in% employees$PEOPLE_CODE_ID
prospects <- cbind(prospects, is.employee)
employees.invite <- subset(prospects, is.employee == "TRUE")
rm(is.employee)

#All Alumni and Alumni Non Grad into Separate dataframe
alum <- subset(prospects, is.employee == "FALSE" & PEOPLE_TYPE == "ALUM"| PEOPLE_TYPE == "ALNG")
#Friends into separate dataframe
friends <- subset(prospects, is.employee == "FALSE" & PEOPLE_TYPE == "FRND" | PEOPLE_TYPE == "HONR")

#assigned friends into separate dataframe
assignedfriends <- subset(friends, ï..SOLICITOR_CODE != "")
#friends with giving or pledges
invitefriends <- subset(friends, (ï..SOLICITOR_CODE == "" & TotalGivingAmount >= 100) | (ï..SOLICITOR_CODE == "" & !(is.na(PledgeBalanceSum))))

#merge alum, assigned friends, and filtered friends
filteredlist <- rbind(alum, assignedfriends, invitefriends)
rm(alum, assignedfriends,invitefriends, friends, giving)
#Remove DNC Codes, strip extra columns
filteredlist <- subset(filteredlist, NO_MAIL != "DNC from Conversion" & NO_MAIL != "One Time Gift" & CallRules != "DNC from Conversion" & CallRules != "Deceased")
filteredlist <- filteredlist[,c(1, 85, 14, 15, 16, 17, 18, 19, 60, 61, 62)]
ICM <- employees.invite[,c(1, 85, 14, 15, 16, 17, 18, 19, 60, 61, 62)]
#creates is duplicated dataframe and removes duplicates by combined salutation
duplicates <- duplicated(filteredlist[,2])
filteredlist <- cbind(filteredlist, duplicates)
employee.duplicates <- duplicated(ICM[,2])
ICM <- cbind(ICM, employee.duplicates)
filteredlist <- subset(filteredlist, duplicates == "FALSE")
filteredlist <- filteredlist[,c(1:11)]
ICM <- subset(ICM, employee.duplicates == "FALSE")
ICM <- ICM[,c(1:11)]
rm(duplicates, employee.duplicates, employees, employees.invite)

#STOP Change File Name Before Output!
write.csv(filteredlist, "L:/Advancement/Justin/Call Officers/Justin Reports/2015 June 30 Pittsburgh Mailer Test.csv")
write.csv(ICM, "L:/Advancement/Justin/Call Officers/Justin Reports/2015 June 30 Pittsburgh ICM Test.csv")
