library(rvest)

recon <- html("http://www.watchrecon.com")


model <- html("http://www.chrono24.com/en/watches/affordable-rolex-omega-breitling-and-co--48.htm")%>%
  html_nodes(".watch-headline")%>%
  html_text()
price <- html("http://www.chrono24.com/en/watches/affordable-rolex-omega-breitling-and-co--48.htm")%>%
  html_nodes(".amount")%>%
  html_text()


watches <- data.frame(cbind(price, model))

google <- html_session("http://www.google.com/shopping")
form <- "Rolex Tudor"
submit_form(google, form, submit = "btnG")

