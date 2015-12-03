#Visits Only For Date Range Summary
#!!May not need to reimport reshape!!
library(reshape2)
library(lubridate)

#Director's Numbers - Needs Imported with No Changes
DN <- read.csv("L:/Advancement/Justin/General/Director's Numbers for R Script.csv")

#STOP!!Import Range Actions File - Filename Needs Updated!!
Range.Actions.Ind <- read.csv("L:/Advancement/Justin/General/August Reports/2015 September 18 All Visits Since July 2014 I.csv", header = TRUE)
Range.Actions.Orgs <- read.csv("L:/Advancement/Justin/General/August Reports/2015 September 18 All Visits Since July 2014 O.csv", header = TRUE)
colnames(Range.Actions.Orgs)<- c("SOLICITOR_CODE", "PEOPLE_CODE_ID", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "CITY",
                                 "STATE", "ACTION_ID", "SCHEDULED_DATE", "EXECUTION_DATE", "COMPLETED_BY", "PRIORITY", "NOTE")
Range.Actions <- rbind(Range.Actions.Ind, Range.Actions.Orgs)


#Adds Solicitor Information to Report
Range.Actions <- merge(Range.Actions, DN)
#Adds MONTH_YEAR Column
Range.Actions$EXECUTION_DATE <- substring(Range.Actions$EXECUTION_DATE, 1, 16)
Range.Actions.Date <- strptime(x = as.character(Range.Actions$EXECUTION_DATE), format = "%m/%d/%Y %H:%M")
Range.Actions <- cbind(Range.Actions, paste(month(Range.Actions.Date), "/", year(Range.Actions.Date)))
colnames(Range.Actions)[16] <- "MONTH_YEAR"
rm(Range.Actions.Date)
#Subset Range to Only Include Actios
Range.Actions <- subset(Range.Actions, ACTION_ID == "CAFC2FC")
#Pivot Table
Range.Summary <- dcast(Range.Actions, TITLE~MONTH_YEAR, value.var = "ACTION_ID", length, margins = TRUE) 

#STOP! Reorder Columns - MODIFY AS NEEDED
names <- as.data.frame(names(Range.Summary))
Range.Summary <- Range.Summary[,c(1, 11,13,15,3:5,2,6:10,12,14,16)]

#CHANGE OUTPUT FILE NAME BEFORE EXPORT
write.csv(Range.Summary, file = "L:/Advancement/Justin/General/August Reports/2015 September 18 All Visits Since July 2014 Summary.csv")
write.csv(Range.Actions, file = "L:/Advancement/Justin/General/August Reports/2015 September 18 All Visits Since July 2014 Detail.csv")

#Troy's Report
library(stringr)
Other <- str_extract(Range.Actions$Notes, "Terri"|"Roberta"|"Kraig"|"Leta"|"Mario")
Troy.Range.Actions <- cbind(Range.Actions, Other)
Troy.Range.Actions <- Troy.Range.Actions[#]

