Sys.setlocale(category = "LC_CTYPE", locale = "Korean_Korea.949")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700")

rate_v = NULL
doms1<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-point span")
rate <-sapply(doms1,function(x){x$getElementText()})
rate_v <- c(rate_v, unlist(rate))

category_v = NULL
doms2<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-recommend")
category <-sapply(doms2,function(x){x$getElementText()})
category_v <- c(category_v, unlist(category))

text_v = NULL
doms3<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-txt")
text <-sapply(doms3,function(x){x$getElementText()})
text_v <- c(text_v, unlist(text))


for (i in 2:10) {               
  nextCss <- paste("#contentData > div > div.movie-idv-story > nav > a:nth-child(", i, ")", sep="")                
  try(nextListLink<-remDr$findElement(using='css selector',nextCss))
  nextListLink$clickElement()
  Sys.sleep(0.5)
  
  doms1<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-point span")
  rate <-sapply(doms1,function(x){x$getElementText()})
  rate_v <- append(rate_v, unlist(rate))
  
  doms2<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-recommend")
  category <-sapply(doms2,function(x){x$getElementText()})
  category_v <- append(category_v, unlist(category))
  
  doms3<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-txt")
  text <-sapply(doms3,function(x){x$getElementText()})
  text_v <- append(text_v, unlist(text))
}
movie <- data.frame('평점'=rate_v, '주요포인트'=category_v, '감상평'=text_v)
View(movie)
write.csv(movie, 'output/movie.csv', row.names = F)


#############################################################################################################
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700")

rate_v = NULL
category_v = NULL
text_v = NULL
start <- 2
end <- 10
for (page in 1: 5){
  doms1<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-point span")
  rate <-sapply(doms1,function(x){x$getElementText()})
  rate_v <- c(rate_v, unlist(rate))
  
  doms2<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-recommend")
  category <-sapply(doms2,function(x){x$getElementText()})
  category_v <- c(category_v, unlist(category))
  
  doms3<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-txt")
  text <-sapply(doms3,function(x){x$getElementText()})
  text_v <- c(text_v, unlist(text))
  
  for (i in start:end) {               
    nextCss <- paste("#contentData > div > div.movie-idv-story > nav > a:nth-child(", i, ")", sep="")                
    try(nextListLink<-remDr$findElement(using='css selector',nextCss))
    nextListLink$clickElement()
    Sys.sleep(1)
    
    doms1<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-point span")
    rate <-sapply(doms1,function(x){x$getElementText()})
    rate_v <- append(rate_v, unlist(rate))
    
    doms2<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-recommend")
    category <-sapply(doms2,function(x){x$getElementText()})
    category_v <- append(category_v, unlist(category))
    
    doms3<-remDr$findElements(using ="css","#contentData > div > div.movie-idv-story > ul > li div.story-txt")
    text <-sapply(doms3,function(x){x$getElementText()})
    text_v <- append(text_v, unlist(text))
  }
  try(nextPageLink<-remDr$findElement(using='css selector', "a.control.next"))
  nextPageLink$clickElement()
  Sys.sleep(0.5)
  if (length(nextPageLink) == 0) break;
  start <- 4
  end <- 12
}
movie <- data.frame('평점'=rate_v, '주요포인트'=category_v, '감상평'=text_v)
View(movie)
write.csv(movie, 'output/movie2.csv', row.names = F)
