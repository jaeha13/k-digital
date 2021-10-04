library(httr)
library(rvest)

url <- "https://comic.naver.com/genre/bestChallenge.nhn"
data <- read_html(url)

nodes1 <- html_nodes(data, "#content > div td div.challengeInfo > h6 > a")
nodes2 <- html_nodes(data, "#content > div td div > .summary")
nodes3 <- html_nodes(data, "#content > div td div .rating_type > strong")

comic.name <- html_text(nodes1, trim=T)
comic.summary <- html_text(nodes2, trim=T)
comic.grade <- html_text(nodes3, trim=T)
comics <- data.frame(comic.name, comic.summary, comic.grade)
write.csv(comics, "output/navercomic1.csv", row.names=FALSE)
