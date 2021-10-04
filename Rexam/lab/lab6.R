# 문제 1
exam1 <- function(){
  return(paste0(LETTERS, letters))
}

exam1()

# 문제 2
exam2 <- function(n){
  sum <- 0
  for (i in 1:n)
    sum <- sum + i
  return(sum)
}

cat("함수 호출 결과 :", exam2(3))

# 문제 3
exam3 <- function(n1, n2){
  return(abs(n1 - n2))
}

print(paste("함수 호출 결과 :", exam3(10, 20)))
print(paste("함수 호출 결과 :", exam3(20, 5)))
print(paste("함수 호출 결과 :", exam3(5, 30)))
print(paste("함수 호출 결과 :", exam3(6, 3)))
print(paste("함수 호출 결과 :", exam3(3, 3)))

# 문제 4
exam4 <- function(n1, op, n2){
  if (op %in% c("+", "-", "*", "%/%", "%%")){
    if (op == "%/%" || op == "%%"){
      if (n1 == 0){
        return ("오류1")
      } else if (n2 == 0){
        return ("오류2")
      } else{
        switch(EXPR=op, "%/%"=n1%/%n2, "%%"=n1%%n2)
      }
    }else{
      return (switch(EXPR=op, "+"=n1+n2, "-"=n1-n2, "*"=n1*n2))
    }
  }else{
  return ("규격의 연산자만 전달하세요")
  }
}

print(exam4(2, "&", 4))
print(exam4(1, "+", 3))
print(exam4(1, "-", 3))
print(exam4(1, "*", 3))
print(exam4(1, "%/%", 3))
print(exam4(1, "%%", 3))
print(exam4(0, "%%", 3))
print(exam4(1, "%/%", 0))

# 문제 5
exam5 <- function(n, ch="#"){
  if (n > 0){
    for (i in 1:n)
      cat(ch)
      cat("\n")
  }
  return ()
}

exam5(-3)
exam5(3)
exam5(5, "$")

# 문제 6
exam6 <- function(vec){
  for (i in vec){
    if (is.na(i)){
      cat("NA는 처리 불가\n")
    }else if (i >= 85){
      cat(i, "점은 상등급입니다.\n")
    }else if (i >= 70){
      cat(i, "점은 중등급입니다.\n")
    }else{
      cat(i, "점은 하등급입니다.\n")
    }
  }
  return ()
}

exam6(c(80, 50, 70, 66, NA, 35))
