# 문제 1
v <- sample(1:26, 10)
ntoa <- function(...){
  return(LETTERS[...])
}
sapply(v, ntoa)
