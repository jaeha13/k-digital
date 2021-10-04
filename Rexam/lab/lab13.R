# 문제 7
Sys.setlocale(category = 'LC_CTYPE', locale = 'Korean_Korea.949')
library(KoNLP)

movie <- read.csv('output/movie_reviews3.csv')
movie <- movie$vreview
movie <- gsub("[[:punct:][:cntrl:]]", "", movie)
movie <- gsub("[a-zA-Z]|[0-9]|[ㄱ-ㅎ]|[ㅏ-ㅣ]", "", movie)
movie1 <- extractNoun(movie)
movie2 <- unlist(movie1)
movie2 <- Filter(function(x) {nchar(x) >= 2}, movie2)
word_table <- table(movie2)
final <- sort(word_table, decreasing=T)
final <- data.frame(head(final, 10))
colnames(final) <- c('wname', 'wcount')
View(final)
write.csv(final, 'output/movie_top_word.csv', row.names = F)


# 워드클라우드
library(wordcloud2)
yes24 <- readLines('output/yes24.txt')
yes24 <- gsub("[^가-힣]", " ", yes24)
noun <- extractNoun(yes24)
word <- unlist(noun)
word1 <- Filter(function(x) {nchar(x) >= 2 && nchar(x) <= 4}, word)
word2 <- table(word1)
final2 <- sort(word2, decreasing=T)
final2 <- data.frame(final2)
View(final2)
result <- wordcloud2(final2, fontFamily = "THE개이득")
htmltools::save_html(result,"output/yes24.html")
