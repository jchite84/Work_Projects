library(rvest)
library(mailR)


blimpie <- html("https://twitter.com/blimpiesubshop")%>%
  html_nodes(".TweetTextSize")%>%
  html_text()
tweet<-data.frame(blimpie)
promo<- tweet[grep("Enter code", tweet[,1]),]
write.csv(promo, "C:/Users/110427052/Dropbox/Promo.csv")

send.mail(
  from = "jchite84@gmail.com",
  to = "jhite@thiel.edu",
  subject = "Test",
  html = TRUE,
  inline = TRUE,
  body = "<html><a href = https://www.dropbox.com/s/eemv9t67zzuzq8g/Promo.csv?dl=0>Promo</href></html>",
  smtp = list(host.name = "smtp.gmail.com", port = 465, 
              user.name = "jchite84@gmail.com", passwd = "**********", ssl = TRUE),
  authenticate = TRUE,
  send = TRUE)
  
