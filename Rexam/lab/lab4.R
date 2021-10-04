# 문제 1
L1 <- list(
  name = "scott",
  sal = 3000)

result1 <- L1[['sal']] * 2 # (result1 <- L1$sal * 2): 가로 붙이면 대입도 하고 화면에도 내보낸다
result1

# 문제 2
L2 <- list("scott", c(100, 200, 300))
L2

# 문제 3
L3 <- list(c(3, 5, 7), c('A', 'B', 'C'))
L3[[2]][[1]] <- "Alpha"

# 문제 4
L4 <- list(alpha=0.4,beta=sqrt(1:5), gamma=log(1:5))
L4[[1]] <- L4[[1]] + 10 # L4[["alpha"]] + 10 or L4$alpha + 10
L4

ls()
# 문제 5
emp <- read.csv('/jha/Rexam/data/emp.csv')
L5 <- list(
  data1 = LETTERS,
  data2 = emp[1:3,],
  data3 = L4
)
L5[[1]][[1]]
L5[[2]][["ename"]]
L5[[3]][["gamma"]]

# 문제 6
L6 = list(
  math=list(95, 90),
  writing=list(90, 85), 
  reading=list(85, 80))
mean(unlist(L6))
