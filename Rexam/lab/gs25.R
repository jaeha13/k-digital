Sys.setlocale(category = "LC_CTYPE", locale = "Korean_Korea.949")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://gs25.gsretail.com/gscvs/ko/products/event-goods")

twotoone <- remDr$findElement('css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > ul > li:nth-child(2) > span #TWO_TO_ONE')
twotoone$clickElement()

goodsnames=NULL
goodsprices=NULL
for (page in 1: 13){
  goodsnamenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div div:nth-child(5) > ul > li > div > p.tit')
  goodsname <- sapply(goodsnamenodes, function(x) {x$getElementText()})
  goodsnames <- c(goodsnames, unlist(goodsname))
  
  goodspricenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div div:nth-child(5) > ul > li > div > p.price > span')
  goodsprice <- sapply(goodspricenodes, function(x) {x$getElementText()})
  goodsprice <- gsub(",|원", "", goodsprice)
  goodsprices <- c(goodsprices, unlist(goodsprice))
  
  if (page != 13){
    for (i in 2:10) {               
      nextListLink<-remDr$findElement(using='css selector', paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a:nth-child(", i, ")"))
      nextListLink$clickElement()
      Sys.sleep(1)
      
      goodsnamenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
      goodsname <- sapply(goodsnamenodes, function(x) {x$getElementText()})
      goodsnames <- append(goodsnames, unlist(goodsname))
      
      goodspricenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
      goodsprice <- sapply(goodspricenodes, function(x) {x$getElementText()})
      goodsprice <- gsub(",|원", "", goodsprice)
      goodsprices <- append(goodsprices, unlist(goodsprice))
    }
    try(nextPageLink<-remDr$findElement(using='css selector', "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next"))
    nextPageLink$clickElement()
    Sys.sleep(1)
  }
}
gs25_twotoone <- data.frame('goodsname' = goodsnames, 'goodsprice' = goodsprices)
View(gs25_twotoone)
write.csv(gs25_twotoone, 'output/gs25_twotoone.csv', row.names=F)

