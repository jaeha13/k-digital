# 문제 1
install.packages('fmsb')
library(fmsb)
library(dplyr)
pitcher <- read.csv('data/picher_stats_2017.csv', encoding='UTF-8')
View(pitcher)
pitcher %>% filter(선수명 == '정우람') %>% select(삼진.9, 볼넷.9, 홈런.9) -> score
max.score <- c(max(pitcher$삼진.9), max(pitcher$볼넷.9), max(pitcher$홈런.9))
min.score <- c(min(pitcher$삼진.9), min(pitcher$볼넷.9), min(pitcher$홈런.9))
selected <- rbind(max.score, min.score, score)
colnames(selected) <- c('삼진', '볼넷', '홈런')
radarchart(selected,
           pcol='red',
           pfcol=rgb(0.8, 0.4, 0.8, 0.2),
           plwd=2,                    
           cglcol='grey',
           cglty=1,
           cglwd=1,
           axistype=1,
           seg=4,                         
           axislabcol='grey',
           caxislabels=seq(0, 100, 25),
           title = '정우람 선수의 성적'
)
dev.copy(png, 'output/lab19.png')
dev.off()


# 문제 2
library(leaflet)
library(dplyr)
library(ggmap)

register_google(key='AIzaSyDy81EbO46BRSnX1DOgg_F84bhsdbku2z4')
mk <- geocode("서울시 성동구 매봉길 50", source = "google")

map <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='red', popup = "우리 집" )
map


# 문제 3
data(iris)
# (1)
mean(iris$Sepal.Width)
sd(iris$Sepal.Width)
quantile(iris$Sepal.Width)[4]

# (2)
hist(iris$Sepal.Width)

# (3)
boxplot(iris$Sepal.Width ~ iris$Species)  # setosa

# (4)
s <- subset(iris$Sepal.Width, iris$Species == 'setosa')
v <- subset(iris$Sepal.Width, iris$Species == 'versicolor')

# (5)
shapiro.test(s) # 정규분포를 따른다(p-value: 0.2715)
shapiro.test(v) # 정규분포를 따른다(p-value: 0.338)

# (6)
t.test(s, v)  # 평균은 다르다(p-value: 2.484e-15)

# (7)
test <- subset(iris[,1:4], iris$Species == 'virginica')

# (8)
cor(test) # Sepal.Length와 Petal.Length
