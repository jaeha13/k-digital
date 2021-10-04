Sys.getlocale()
Sys.setlocale(category="LC_CTYPE", locale="Korean_Korea.949")


#[문제1]
str(iris)
summary(iris)

#[문제2]
x <- c(1, 2, 3, 4, 5)
y <- x * 2
df1 <- data.frame(x, y); df1;

#[문제3]
col1 <- c(1, 2, 3, 4, 5)
col2 <- letters[1:5]
col3 <- col1 + 5
data.frame(col1, col2, col3)

#[문제4]
df3 <- data.frame(
  제품명 = c("사과", "딸기", "수박"),
  가격 = c(1800, 1500, 3000),
  판매량 = c(24, 38, 13))


#[문제5]
mean(df3$가격)
mean(df3$판매량)


#[문제6]
df4 <- data.frame(
  name = c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben'),
  gender = factor(c("M", "F", "M", "F", "M")),
  math = c(85, 76, 99, 88, 40))
str(df4)
summary(df4)

df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score > 150, "A",
                    ifelse(df4$score >= 100, "B",
                           ifelse(df4$score >= 70, "C", "D")))

# Emp 문제
myemp <- read.csv('/jha/Rexam/data/emp.csv')

#[문제7]
str(myemp)
summary(myemp)

#[문제8]
myemp[3:5, ]

#[문제9]
subset(myemp, select=-empno)
      
#[문제10]
subset(myemp, select=ename)

#[문제11]
subset(myemp, select=c(ename, sal))

#[문제12]
myemp[myemp$job == "SALESMAN", c("ename", "sal", "job")]

#[문제13]
myemp[myemp$sal >= 1000 & myemp$sal <= 3000, c("ename", "sal", "deptno")]

#[문제14]
myemp[myemp$job != "ANALYST", c("ename", "job", "sal")]

#[문제15]
myemp[myemp$job == "SALESMAN" | myemp$job == "ANALYST", c("ename", "job")]

#[문제16]
myemp[is.na(myemp$comm), c("ename", "sal")]

#[문제17]
myemp[order(myemp$sal),]

#[문제18]
nrow(myemp);ncol(myemp);

#[문제19]
table(myemp$deptno)

#[문제20]
table(myemp$job)

