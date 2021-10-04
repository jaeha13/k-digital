setwd('/jha/Rexam')
Sys.setlocale(category = 'LC_CTYPE', locale = 'Korean_Korea.949')
library(showtext)
showtext.auto()
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# 문제 1
log <- read.table('data/product_click.log')
product <- log[,2]
prod <- table(product)
#png(filename="output/clicklog1.png", height=400, width=700, bg="white")
barplot(prod, main='세로바 그래프 실습', col.main='red', cex.main=2, ylab='클릭수', 
        col=terrain.colors(10), 
        family='dog', cex.names=1) 
dev.copy(png, 'output/clicklog1.png')
dev.off()


# 문제 2
time <- log[,1]
time <- substr(time, start=9, stop=10)
time_tb <- table(time)
names(time_tb) <- c('0-1', '1-2', '2-3', '3-4', '4-5', '5-6', '8-9', '9-10', '10-11', '11-12', '12-13', '13-14', '14-15', '15-16', '16-17', '17-18', '18-19')
#names(time_tb) <- c(paste0(as.numeric(names(time_tb)), '-', as.numeric(names(time_tb)) + 1))
#png(filename="output/clicklog2.png", height=700, width=700, bg="white")
pie(time_tb, main='파이그래프 실습', col.main='blue', cex.main=2,
    col=rainbow(17), radius=1.3,
    family='maple')
dev.copy(png, 'output/clicklog2.png')
dev.off()

# 문제 3
par(xpd=T, mar = c(5, 5, 5, 8))
grade <- read.table("data/성적.txt", header=TRUE, encoding='UTF-8')
grade <- grade[3:5]
pcol <- c('orange', 'skyblue', 'pink')
xname <- c('길동', '둘리', '또치', '도우너', '희동', '듀크', '턱시', '토토로', '올라프', '우디')
#png(filename="output/clicklog3.png", height=500, width=700, bg="white")
barplot(t(as.matrix(grade)), main='학생별 점수', col.main='magenta', cex.main=2, family='dog',
        col = pcol, cex.axis=0.8,
        names.arg=xname, cex=0.7)
legend(11, 30, names(grade), fill=pcol, cex=0.6);
dev.copy(png, 'output/clicklog3.png')
dev.off()
