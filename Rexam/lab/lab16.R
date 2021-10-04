library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# 문제 1
log <- readLines('data/product_click.log')
date <- substr(log, 1, 8)
date <- as.Date(date,format='%Y%m%d')
wd <- weekdays(date)
twd <- table(wd)
twd <- c(twd['Monday'], twd['Tuesday'], twd['Wednesday'], twd['Thursday'], twd['Friday'], twd['Saturday'])
# twd <- twd[c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')] 
names(twd) <- c('월요일', '화요일', '수요일', '목요일', '금요일', '토요일')
png('output/clicklog4.png', width=960, height=480, bg='white')
plot.new()
par(mar=c(3, 2, 4, 0), mfrow=c(1,2))
plot(twd, type='o', pch=16, lty=1, lwd=4, col='orange',
     main='요일별 클릭수', family='cat', axes=F, cex.main=3,
     xlab=NA, ylab=NA, ylim = c(0,300))
axis(1, lab=names(twd), at=1:6, family='cat', cex.axis=0.8)
axis(2, at=c(0, 50, 100, 150, 200, 250, 300), family='cat', cex.axis=0.8)

barplot(twd, main='요일별 클릭수', family='cat', cex.main=3,
        col=topo.colors(6), ylim=c(0, 300), cex.axis=0.8)
dev.off()


# 문제 2
movie_reviews3 <- read.csv('output/movie_reviews3.csv')
vpoint <- movie_reviews3$vpoint
tb_vpoint <- as.matrix(vpoint)
png('output/clicklog5.png', width=960, height=480)
plot.new()
par(mar=c(3, 2, 4, 0), mfrow=c(1,3))
hist(t(tb_vpoint), xlab='평점', main='모가디슈 영화 평점 히스토그램(auto)', family='dog',
     col=heat.colors(10), ylab='평가자수')
hist(t(tb_vpoint), xlab='평점', main='모가디슈 영화 평점 히스토그램(1-5, 6-10)', family='dog',
     col=c('skyblue', 'pink'), ylab='평가자수', breaks=2)
hist(t(tb_vpoint), xlab='평점', main='모가디슈 영화 평점 히스토그램(1-5, 6, 7, 8, 9, 10)', col.main='red', family='dog',
     ylab='평가자수', breaks=c(1, 5, 6, 7, 8, 9, 10), freq=T, las=1)
dev.off()


# 문제 3
grade <- read.table('data/성적.txt', header=T, encoding='UTF-8')
grade <- grade[3:5]
plot.new()
par(mar=c(5, 5, 5, 5), mfrow=c(1, 1), family='maple')
boxplot(grade, main='과목별 성적 분포', col.main='orange1',
        col = c('red', 'green', 'blue'), cex.axis=0.8)
dev.copy(png, 'output/clicklog6.png')
dev.off()
