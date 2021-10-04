Sys.setlocale(category = 'LC_CTYPE', locale = 'Korean_Korea.949')
setwd('/jha/Rexam/miniproject')
library(ggmap)
library(dplyr)
library(rvest)
library(XML)
library(leaflet)
library(htmlwidgets)
library(webshot)

# install.packages('webshot')
# install_phantomjs()

# 오산시 불법주정차 장소 데이터 정제
illegal_data <- read.csv('data/osan.csv', header=T)
df_place <- as.data.frame(illegal_data$위반장소)
names(df_place)[1]<- c("place")
place1 <- gsub("앱)|부근.*|앞|뒤|맞은편|인도.*|코.*", "", df_place$place)
place2 <- gsub("병워", "병원", place1)
place2 <- paste('오산시', place2)
place3 <- data.frame(place2)
# hour 데이터만 분리
s_time <- sapply(as.data.frame(illegal_data[3]), function(x){gsub(":.{2}", "", x)})

# ##### Write 부분 #####
# # 불법주정차 주소 위/경도 추출
# tb_place <- as.data.frame(table(place3), stringsAsFactors = F)
# register_google(key='AIzaSyDy81EbO46BRSnX1DOgg_F84bhsdbku2z4')
# il_addr <- tb_place$place3
# gc <- geocode(enc2utf8(il_addr))
# il_place <- cbind(tb_place, gc)
# 
# # "더샾" 데이터 na상태 처리 및 csv파일 데이터 저장
# na_addr <- '오산시 외삼미동 서동탄역 더 샾'
# gc1 <- geocode(enc2utf8(na_addr))
# il_place$lon[is.na(il_place$lon)] <- gc1$lon
# il_place$lat[is.na(il_place$lat)] <- gc1$lat
# write.csv(il_place, 'data/place_lonlat.csv')
# 
#
# # 오산시 공영주차장 위지 추출
# url <- 'https://www.osansisul.or.kr/cms/content/view/203'
# site <- read_html(url)
# 
# PbPL_info <- NULL
# node <- html_node(site, '#print > div > div > div > div:nth-child(1) > div > table > tbody > tr:nth-child(1) > td:nth-child(3)')
# PbPL_info <- rbind(PbPL_info, html_text(node))
# 
# for (i in 2:14){
#   node <- html_node(site, paste0('#print > div > div > div > div:nth-child(1) > div > table > tbody > tr:nth-child(', i, ') > td:nth-child(2)'))
#   PbPL_info <- rbind(PbPL_info, html_text(node))
# }
# PbPL_info <- paste('오산시', PbPL_info)
# PbPL_info[13] <- '오산시 원동 772-16'
# PbPL_df <- as.data.frame(PbPL_info)
# 
# PbPL_names<- NULL
# for (i in 1:14){
#   if(i ==1 | i==13){
#     if(i == 1){
#       fir = 1
#     }else{
#       fir = 13
#     }
#     sec = 2
#   }else{
#     fir = i
#     sec = 1
#   }
#   node <- html_node(site, paste0('#print > div > div > div > div:nth-child(1) > div > table > tbody > tr:nth-child(', fir, ') > td:nth-child(', sec,')'))
#   PbPL_names <- rbind(PbPL_names, html_text(node))
# }
# tb_PbPL<- cbind(PbPL_names, PbPL_df);
# 
# Pb_addr <- tb_PbPL$PbPL_info
# gc2 <- geocode(enc2utf8(Pb_addr))
# PbPL <- cbind(tb_PbPL, gc2)
# 
# write.csv(PbPL, 'data/public_parking_lot.csv')
#
#
# # 불법 주정차 데이터 각 위치의 건수 합 저장
# il_park_data<- read.csv("data/place_lonlat.csv")[2:5]
# il_park_data<- il_park_data[order(il_park_data$lon),]
# 
# i = 1
# while (i <= nrow(il_park_data)){
#   count = il_park_data[i,]['Freq']
#   j = i + 1
#   while (j <= nrow(il_park_data)){
#     if (il_park_data[i,]['lon'] == il_park_data[j,]['lon'] & il_park_data[i,]['lat'] == il_park_data[j,]['lat']){
#       count = count + il_park_data[j,]['Freq']
#       il_park_data = il_park_data[-j,]
#     }else{
#       break
#     }
#   }
#   il_park_data[i,]['Freq'] = count
#   i = i + 1
# }
# 
# ILPD <- il_park_data[order(il_park_data$lon),]
# rownames(ILPD) <- NULL
# write.csv(ILPD, 'data/illegal_parking_data.csv')
#
#
# # 시간대 14-20 별 지도 그리기 위한 데이터 추출
# peak_time<- cbind(s_time, place3) %>% filter(위반시간 >=14 & 위반시간<=20) %>% count(위반시간, place2)
# 
# register_google(key='AIzaSyDy81EbO46BRSnX1DOgg_F84bhsdbku2z4')
# peak_time_addr <- peak_time$place2
# gc3 <- geocode(enc2utf8(peak_time_addr))
# peak_lonlat <- cbind(peak_time, gc3)
# 
# na_addr = '오산시 외삼미동 서동탄역 더 샾'
# gc1 = geocode(enc2utf8(na_addr))
# peak_lonlat$lon[is.na(peak_lonlat$lon)] <- gc1$lon
# peak_lonlat$lat[is.na(peak_lonlat$lat)] <- gc1$lat
# rownames(peak_lonlat) <- NULL
# write.csv(peak_lonlat, 'data/p_time.csv')
# ##### WRITE 종료 #####

PbPL_data <- read.csv("data/public_parking_lot.csv")[2:5]
boundary<- read.csv("data/Osan_Boundary.csv")[2:3]
ILPD <- read.csv("data/illegal_parking_data.csv")
View()


leaflet(ILPD) %>% 
  addTiles() %>%
  setView(lng = 127.05074340714724, lat = 37.16249734350079, zoom = 13) %>% 
  addProviderTiles('CartoDB.Positron') %>% 
  addPolygons(lat= ~boundary$lat,lng=~boundary$lon, 
              color="teal", fill=F) %>%
  addCircles(lng = ~lon, lat = ~lat, weight = 1,
             radius = ~sqrt(Freq) * 30, popup = ~place3, col="red") %>% 
  addMarkers(lng = ~PbPL_data$lon, 
             lat = ~PbPL_data$lat, 
             popup = ~PbPL_data$PbPL_names) -> total_view
saveWidget(total_view, "data/timemap_total.html")
Sys.sleep(1)
webshot("data/timemap_total.html", "data/timemap_total.png")
Sys.sleep(1)

leaflet(ILPD) %>% 
  addTiles() %>%
  setView(lng = 127.05074340714724, lat = 37.16249734350079, zoom = 13) %>% 
  addProviderTiles('CartoDB.Positron') %>% 
  addPolygons(lat= ~boundary$lat,lng=~boundary$lon, 
              color="teal", fill=F) %>%
  addCircles(lng = ~lon, lat = ~lat, weight = 1,
             radius = ~sqrt(Freq) * 30, popup = ~place3, col="red") -> withoutM
saveWidget(withoutM, "data/timemap_wtM.html")
Sys.sleep(1)
webshot("data/timemap_wtM.html", "data/timemap_wtM.png")
Sys.sleep(1)

## 시간별
# 불법주정차 시간
df_time <- as.data.frame(s_time)
df <- cbind(df_time, place3)

# 전체 시간대
tb_time<- table(s_time)
barplot(tb_time, col=terrain.colors(20))
# dev.copy(png, 'data/전체시간대.png')
# dev.off()

days <- unlist(lapply(illegal_data$적발일자, function(x){gsub('-', '', x)}))
s_day<-unlist(lapply(days, function(x){weekdays(as.Date(x, format='%Y%m%d'))}))

day_df <- as.data.frame(cbind(s_day, s_time))
day_time <- table(day_df)[,13:19]
# 월화수목으로 정렬
# kr_weekdays <- c(4, 7, 3, 2, 1, 6, 5)
am_weekdays <- c(2, 6, 7, 5, 1, 3, 4)

day_time1 <- day_time[am_weekdays,]
barplot(t(day_time), col=terrain.colors(7),
        legend = paste0(rownames(t(day_time)), "시"),
        args.legend = list(x='topright', bty='n', inset=c(0, -0.18)))

#kr_weekdays <- c(5, 6, 1, 2, 3, 7, 4)
am_weekdays1 <- c(7, 6, 5, 4, 3, 2, 1)
day_time2 <- day_time1[am_weekdays1,]
barplot(day_time1, col=terrain.colors(7),
        legend = rownames(day_time1),
        args.legend = list(x='topright', bty='n', inset=c(-0.05, -0.18)))


day_time_df <- as.data.frame(day_time1)
boxplot(Freq~s_day, day_time_df, col=terrain.colors(7))
boxplot(Freq~위반시간, day_time_df, col=terrain.colors(7))


peak_time<- read.csv("data/p_time.csv")[2:6]
View(peak_time)
peak_time<- peak_time[order(peak_time$lon),]
rownames(peak_time) <- NULL

i = 1
while (i <= nrow(peak_time)){
  count = peak_time[i,]['n']
  j = i + 1
  while (j <= nrow(peak_time)){
    if (peak_time[i,]['lon'] == peak_time[j,]['lon'] & 
        peak_time[i,]['lat'] == peak_time[j,]['lat']){# &
    #    peak_time[i,]['위반시간'] == peak_time[j,]['위반시간']){
      count = count + peak_time[j,]['n']
      peak_time = peak_time[-j,]
    }else{
      break
    }
  }
  peak_time[i,]['n'] = count
  i = i + 1
}


# 시간대별
for(i in 14:20){
  peak_time %>% 
    filter(위반시간 == i) %>% 
    leaflet() %>% 
    addTiles() %>%
    setView(lng = 127.05074340714724, lat = 37.16249734350079, zoom = 13) %>% 
    addProviderTiles('CartoDB.Positron') %>% 
    addCircles(lng = ~lon, lat = ~lat, weight = 1,
               radius = ~sqrt(n) * 50, popup = ~place2, col="red", fillOpacity = 0.3) %>%
    addPolygons(lat= ~boundary$lat,lng=~boundary$lon, fill=F, col="teal") -> timelap
  
  saveWidget(timelap, paste(file="data/timemap", i, ".html"))
  Sys.sleep(1)
  webshot(paste("data/timemap", i, ".html"), paste("data/timemap", i, ".png"))
  Sys.sleep(1)
}

# 겹쳐그리기
leaflet(peak_time) %>% 
  addTiles() %>%
  setView(lng = 127.05074340714724, lat = 37.16249734350079, zoom = 13) %>% 
  addProviderTiles('CartoDB.Positron') %>% 
  addCircles(lng = ~lon, lat = ~lat, weight = 1,
             radius = ~sqrt(n) * 30, popup = ~place2, col="blue", fillOpacity = 0.3) %>%
  addPolygons(lat= ~boundary$lat,lng=~boundary$lon, fill=F, col='teal') -> time_l #%>% 
#  addCircles(lng = ~ILPD$lon, lat = ~ILPD$lat, weight = 1,
#             radius = ~sqrt(ILPD$Freq) * 30, 
#             popup = ~ILPD$place3, col="red", fillOpacity = 0.3) 
saveWidget(time_l, "data/timemap_time_l.html")
Sys.sleep(1)
webshot("data/timemap_time_l.html", "data/timemap_time_l.png")
Sys.sleep(1)


        