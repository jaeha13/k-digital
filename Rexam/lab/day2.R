day <- read.csv('miniproject/osan.csv')[2:3]
day[1] <- sapply(day[1], function(x){gsub('-', '', x)})

s_day <- sapply(day[1], function(x){weekdays(as.Date(x, format='%Y%m%d'))})
s_time <- sapply(as.data.frame(day[2]), function(x){gsub(":.{2}", "", x)})

day_df <- as.data.frame(cbind(s_day, s_time))
View(day_df)

day_time <- table(day_df)[, 13:19]
rownames(day_time) <- c('금요일', '월요일', '토요일', '일요일', '목요일', '화요일', '수요일')

kr_weekdays <- c(5, 1, 6, 7, 4, 2, 3)
day_time[order(kr_weekdays),]
