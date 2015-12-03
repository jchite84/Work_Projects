library(zipcode)
library(stringr)
library(ggplot2)

prospects <- read.csv("C:/Users/110427052/Desktop/2015 August 28 Prospects.csv")
zips <- read.csv("L:/Advancement/Justin/Alumni/Blitz Event Mailing Lists/Blitz Zip Codes.csv")

prospects$ZIP_CODE <- clean.zipcodes(prospects$ZIP_CODE)
zips1 <- as.matrix(sapply(zips, as.character))
zips1[is.na(zips1)] <- "00000"
zips1 <- as.data.frame(zips1)
zips1$Boston <- str_pad(zips1$Boston , width = 5, side = "left", pad = "0")
zips1$NYC <- str_pad(zips1$NYC , width = 5, side = "left", pad = "0")


filenames <- names(zips1)

for (i in 1:length(filenames)){
  
  assign(filenames[i], merge(prospects, zips1[i], by.x = "ZIP_CODE", by.y = filenames[i]))

}


Atlanta <- Atlanta [,c(2:19, 1, 20:91)]
Baltimore <- Baltimore [,c(2:19, 1, 20:91)]
Boston <- Boston [,c(2:19, 1, 20:91)]
Cleveland <- Cleveland [,c(2:19, 1, 20:91)]
DC <- DC [,c(2:19, 1, 20:91)]
Dallas <- Dallas [,c(2:19, 1, 20:91)]
Denver <- Denver [,c(2:19, 1, 20:91)]
Detroit <- Detroit [,c(2:19, 1, 20:91)]
Erie <- Erie [,c(2:19, 1, 20:91)]
Fairport <- Fairport [,c(2:19, 1, 20:91)]
Greenville_SC <- Greenville_SC [,c(2:19, 1, 20:91)]
Harrisburg <- Harrisburg [,c(2:19, 1, 20:91)]
Houston <- Houston [,c(2:19, 1, 20:91)]
Indianapolis <- Indianapolis [,c(2:19, 1, 20:91)]
Louisville <- Louisville [,c(2:19, 1, 20:91)]
Myrtle_Beach <- Myrtle_Beach [,c(2:19, 1, 20:91)]
NYC <- NYC [,c(2:19, 1, 20:91)]
Philadelphia <- Philadelphia [,c(2:19, 1, 20:91)]
Raleigh <- Raleigh [,c(2:19, 1, 20:91)]
Scottsdale <- Scottsdale [,c(2:19, 1, 20:91)]


for (y in 1:20){
  write.csv (x = get(filenames[y]), sprintf("L:/Advancement/Justin/%s.csv", filenames[y]))
}



deduped <- read.csv("C:/Users/110427052/Desktop/Deduped.csv")

percentage.loss <- as.data.frame(deduped[4]/deduped[3])
deduped <- cbind(deduped, percentage.loss)

ggplot(deduped, aes(Raw.Number, Number.Mailed))
  + geom_point()
  + stat_smooth(method = "lm")

city.names <- c("Atlanta", "Baltimore", "Boston", "Chicago", "Cleveland", "Dallas", 
                "DC", "Denver", "Detroit", "Erie", "Fairport", "Greenville_SC", 
                "Harrisburg", "Houston", "Indianapolis", "Louisville", "Myrtle_Beach",
                "NYC", "Philadelphia", "Pittsburgh", "Raleigh", "Scottsdale")

for (i in 1:22){
  assign(city.names[i], read.csv(sprintf("L:/Advancement/Justin/Alumni/Blitz Event Mailing Lists/%s.csv", city.names[i])))
}

names <- as.data.frame(city.names)
id <- rbind(Atlanta [1], Baltimore[1],Boston[1],	Cleveland[1],
          	Dallas[1],DC[1],Denver[1],Detroit[1],Erie[1],	Fairport[1],
            	Greenville_SC[1],Harrisburg[1],	Houston[1],	Indianapolis[1],
            	Louisville[1],Myrtle_Beach[1],NYC[1],	Philadelphia[1],
            	Pittsburgh[1],Raleigh[1],Scottsdale[1])

call.list <- merge(id, prospects)
call.list.chicago <- merge(Chicago, prospects, by.x = "Combined.Salutation", by.y = "CombinedSalutation")
call.list <- call.list[,c(85, 17, 18, 19, 60, 61, 22)]
call.list.chicago <- call.list.chicago[,10]
call.list$ZIP_CODE <- clean.zipcodes(call.list$ZIP_CODE)
write.csv(call.list.chicago, "L:/Advancement/Justin/Alumni/Blitz Event Mailing Lists/ChicagoNumbers.csv")
write.csv(call.list, "L:/Advancement/Justin/Alumni/Blitz Event Mailing Lists/Call List.csv")