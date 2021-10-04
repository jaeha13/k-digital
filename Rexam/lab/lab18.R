Sys.setlocale(category = 'LC_CTYPE', locale = 'Korean_Korea.949')
library(ggplot2)
# 문제1
data(mpg)
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(col='blue')
ggsave('output/result1.png')


# 문제2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv))
ggsave('output/result2.png')


# 문제3
click_log <- read.table('data/product_click.log')
ggplot(click_log, aes(x=V2)) + geom_bar(aes(fill=V2)) + labs(title='제품당 클릭수', subtitle='제품당 클릭수를 바그래프로 표현', x='상품ID', y='클릭수')
ggsave('output/result3.png')


# 문제4
library(showtext)
showtext_auto() 
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

data("GNI2014")
library(treemap)
treemap(GNI2014, vSize="population", index=c("continent", "iso3"), title = "전세계 인구 정보", fontfamily.title="maple", fontsize.title = 20, fontsize.labels = 10, border.col = "green")
dev.copy(png, 'output/result4.png')
dev.off()


# 문제5
library(tidyr)
grade <- read.csv('data/성적2.csv', header=T, encoding = "UTF-8")
boxplot(grade[3:4])
grade$수학 <- ifelse(grade$수학 > 10, round(mean(grade$수학, na.rm=T), digits=0), grade$수학)
grade <- fill(grade, 국어, 수학, .direction='updown')
ggplot(grade, aes(x=국어, y=수학, col=성명)) + geom_point(size=3)
ggsave('output/result5.png')
