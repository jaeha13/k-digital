Sys.setlocale(category = "LC_CTYPE", locale = "Korean_Korea.949")
library(tm)
library(proxy)
fruit <- NULL
fruit <- c("사과 포도 망고",
           "포도 자몽 자두",
           "복숭아 사과 포도",
           "오렌지 바나나 복숭아",
           "포도 바나나 망고",
           "포도 귤 오렌지"
)

cps <- VCorpus(VectorSource(fruit))
dtm <- DocumentTermMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
m <- as.matrix(dtm)
rownames(m) <- c('듀크', '둘리', '또치', '도우너', '길동', '희동')

# 유사한 친구
com <- m %*% t(m)
com
(dist1 <- as.matrix(dist(com, method="Euclidean")))
index_1 = which.min(dist1)
dist2 = dist1[index_1,]
dist2 = dist2[which(dist2 > 0)]
index_2 = which.min(dist2)
cat(rownames(dist1)[index_1], ',', names(which(dist2 == min(dist2))))

# 가장 많이 선택된 과일
fruit_sum <- colSums(m)
fruit_1 <- sort(fruit_sum, decreasing = T)
names(fruit_1[1])

# 가장 적게 선택된 과일
names(which(fruit_sum == min(fruit_sum)))

# 추가
library(qgraph)

qgraph(com, labels=rownames(com), diag=F,
       layout='spring', edge.color='blue',
       vsize=log(diag(com)*800))
