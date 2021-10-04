Sys.setlocale(category = "LC_CTYPE", locale = "Korean_Korea.949")
library(httr)
library(rvest)

comics = NULL
for (i in 1: 50){
  url <- paste0("https://comic.naver.com/genre/bestChallenge?&page=", i)
  data <- read_html(url)

  nodes1 <- html_nodes(data, "#content > div td div.challengeInfo > h6 > a")
  nodes2 <- html_nodes(data, "#content > div td div > .summary")
  nodes3 <- html_nodes(data, "#content > div td div .rating_type > strong")
  
  comic.name = NULL
  comic.summary = NULL
  comic.grade = NULL
  
  comic.name <- html_text(nodes1, trim=T)
  comic.summary <- html_text(nodes2, trim=T)
  comic.grade <- html_text(nodes3, trim=T)
  
  comics_page <- data.frame(comic.name, comic.summary, comic.grade)
  comics <- rbind(comics, comics_page)
}
write.csv(comics, "output/navercomic2.csv", row.names=FALSE)
