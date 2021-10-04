Sys.setlocale(category="LC_CTYPE", locale="Korean_Korea.949")

library(httr)
library(rvest)
url <- 'http://media.daum.net/ranking/popular/'
text <- read_html(url)

nodes1 <- html_nodes(text, "#mArticle .tit_thumb > a")
nodes2 <- html_nodes(text, "#mArticle .tit_thumb > span")
title <- gsub("[\"]", "", html_text(nodes1, trim=T))
info <- html_text(nodes2)

news <- data.frame(newstitle=title, newspapername=info)
write.csv(news, "output/daumnews.csv")#, row.names=FALSE)
