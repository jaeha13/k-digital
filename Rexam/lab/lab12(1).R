# 문제 1
v1 <- c('Happy', 'Birthday', 'to', 'You')
length(v1);nchar(v1); sum(nchar(v1));

# 문제 2
text1 <- paste(v1[1], v1[2], v1[3], v1[4])
length(text1);nchar(text1);

# 문제 3
paste(LETTERS[1:10], c(1:10))
paste0(LETTERS[1:10], c(1:10))

# 문제 4
c <- unlist(strsplit("Good Morning", " "))
list(c[1], c[2])

# 문제 5
text2 <-c("Yesterday is history, tomorrow is a mystery, today is a gift!", 
  "That's why we call it the present – from kung fu Panda")
text2 <- gsub("[,–]", "", text2)
text2 <- gsub("  ", " ", text2)
unlist(strsplit(text2, " "))

# 문제 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."

r1 <- gsub("[가-힣]", "", s1)
r2 <- gsub("[@^!.]", "", s1)
r3 <- gsub("[가-힣]|[@^!.]", "", s1)
r4 <- gsub("100", "백", s1)
r1;r2;r3;r4

# 문제 7
# 제외

# 문제 8
weekdays(as.POSIXlt("2021-10-01"))
weekdays(as.Date("2021-10-01"))
weekdays(as.POSIXct("2021-10-01"))

# 문제 9
log <- readLines("data/product_click.log")
date <- substr(log, 1, 8)
date <- as.Date(date,format='%Y%m%d')
weekdays <- weekdays(as.POSIXlt(date))
weekdays <- table(weekdays)
kr_weekdays <- c("금", "월", "토", "목", "화", "수")
cat("클릭수가 가장 많은 요일은 ", kr_weekdays[which.max(weekdays)], "요일 입니다", sep="")
cat("클릭수가 가장 많은 요일은 ", names(sort(weekdays, decreasing = T)[1]), "입니다", sep="")
