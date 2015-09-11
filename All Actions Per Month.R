library(reshape2)

#Director's Numbers - Needs Imported with No Changes
DN <- read.csv("L:/Advancement/Justin/General/Director's Numbers for R Script.csv")

#STOP!!Import Actions File - Filename Needs Updated!!
Month.Actions.Ind <- read.csv("L:/Advancement/Justin/General/2015 September 8 August Actions.csv")
Month.Actions.Orgs <- read.csv("L:/Advancement/Justin/Call Officers/All Directors/2015 June 1 Range Test Orgs.csv", header = FALSE)
colnames(Month.Actions.Orgs)<- c("SOLICITOR_CODE", "PEOPLE_CODE_ID", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "CITY"
                                 "STATE", "ACTION_ID", "SCHEDULED_DATE", "EXECUTION_DATE", "COMPLETED_BY","PRIORITY","NOTE")
Month.Actions <- rbind(Month.Actions.Ind, Month.Actions.Orgs)
#Adds Solicitor Information to Report
Month.Actions <- merge(Month.Actions, DN)
#Pivot Table
Month.Summary <- dcast(Month.Actions, TITLE~ACTION_ID, value.var = "EXECUTION_DATE", length, margins = TRUE)

#CHANGE OUTPUT FILE NAME BEFORE EXPORT
write.csv(Month.Summary, file = "L:/Advancement/Justin/General/2015 September 8 August Actions Summary.csv")
write.csv(Month.Actions, file = "L:/Advancement/Justin/General/2015 September 8 August Actions.csv")