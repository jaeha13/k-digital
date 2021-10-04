Sys.getlocale()
Sys.setlocale(category="LC_CTYPE", locale="Korean_Korea.949")


# 문제 1
countEvenOdd <- function(nvec){
  even <- 0
  odd <- 0
  for (n in nvec){
    if (!is.numeric(n)){
      return()
    }else
      switch(EXPR=as.character(n%%2), "0"=(even<-even + 1), "1"=(odd <- odd + 1))
  }
  return (list(even=even, odd=odd))
}

countEvenOdd(1:10)
countEvenOdd(rep(1:3, 2))
countEvenOdd(seq(1, 10, 2))
countEvenOdd(c("a", 2, "d", 8, 10))

# 문제 2
vmSum <- function(nvec){
  if (is.vector(nvec) && !is.list(nvec)){
    sum <- 0
    for (n in nvec){
      if (!is.numeric(n)){
        cat("숫자 벡터를 전달하숑!")
        return (0)
      }
      else
        sum <- sum + n
    }
    return (sum)
  }else
    return ("벡터만 전달하숑!")
}

vmSum(1:10)
vmSum(list(1:10))
vmSum(matrix(1:10, nrow=2))
vmSum(c(LETTERS, 2, 3, 4))

# 문제 3
vmSum2 <- function(nvec){
  if (is.vector(nvec) && !is.list(nvec)){
    sum <- 0
    for (n in nvec){
      if (!is.numeric(n)){
        warning("숫자 벡터를 전달하숑!")
        return (0)
      }
      else
        sum <- sum + n
    }
    return (sum)
  }else
    stop("벡터만 전달하숑!")
}

vmSum2(1:10)
vmSum2(list(1:10))
vmSum2(matrix(1:10, nrow=2))
vmSum2(c(LETTERS, 2, 3, 4))

# 문제 4
mySum <- function(nvec){
  if (!length(nvec))
    return()
  if (any(is.na(nvec))){
    warning("NA를 최저값으로 변경하여 처리함!!")
    temp <- na.omit(nvec)
    min <- min(temp)
#    nvec[is.na(nvec)] <- min(v, na.rm=T)
  }
  if (is.vector(nvec) && !is.list(nvec)){
    oddSum <- 0
    evenSum <- 0
    for (i in 1:length(nvec)){
      if (is.na(nvec[i]))
        nvec[i] <- min
      if (i %% 2 == 0){
        evenSum <- evenSum + nvec[i]
      }else
        oddSum <- oddSum + nvec[i]
    }
    return (list(oddSum=oddSum, evenSum=evenSum))
  }else
    stop("벡터만 처리 가능!!")
}

mySum(c())
mySum(1:6)
mySum(rep(c(3, NA),5))


# 문제 5
myExpr <- function(func){
  if (!is.function(func)){
    stop("수행 안할꺼임!!")
  }else
    return (func(sample(1:45, 6)))
}

rm(sum)
myExpr(countEvenOdd)
myExpr(sum)
myExpr(mean)
myExpr(max)
myExpr(1:45)

# 문제 6
createVector1 <- function(...){
  vec <- c(...)
  if (!length(vec)){ # length(vec) == 0 이 가독성이 좋음
    return ()
  }else if (any(is.na(vec))){
    return (NA)
  }else
    return (vec)
}

createVector1()
createVector1(1, 2, NA, 4:9)
createVector1(1, 2, 3, 4:9)
createVector1(1, 2, TRUE, "a")
createVector1(1, 2, 3, list(1,2))

# 문제 7
# case 1
createVector2 <- function(...){
  lst <- list(...)
  num <- c()
  char <- c()
  logic <- c()
  if (!length(lst)){
    return()
  }else{
    for (i in lst){
      if (is.numeric(i)){
        num[length(num)+1] <- i
      }else if (is.character(i)){
        char[length(char)+1] <- i
      }else{
        logic[length(logic)+1] <- i
      }
    }
    return(list(num, char, logic))
  }
}

createVector2()
createVector2(1, 2, 3, 4, 5, "a", "b", TRUE, FALSE)
createVector2(1, 4, 5, "a", 2, "b", 3, FALSE, 7, TRUE)

# case 2
createVector2_2 <- function(...){
  lst <- list(...)
  num <- c()
  char <- c()
  logic <- c()
  if (!length(lst)){
    return()
  }else{
    for (i in lst){
      if (is.numeric(i)){
        num <- c(num, i)
      }else if (is.character(i)){
        char <- c(char, i)
      }else{
        logic <- c(logic, i)
      }
    }
    return(list(num, char, logic))
  }
}

createVector2_2()
createVector2_2(1, 2, 3, 4, 5, "a", "b", TRUE, FALSE)
createVector2_2(1, 4, 5, "a", 2, "b", 3, FALSE, 7, TRUE)

# case3
createVector2_3 <- function(...){
  lst <- list(...)
  num <- c()
  char <- c()
  logic <- c()
  if (!length(lst)){
    return()
  }else{
    for (i in lst){
      if (is.numeric(i)){
        num <- append(num, i)
      }else if (is.character(i)){
        char <- append(char, i)
      }else{
        logic <- append(logic, i)
      }
    }
    return(list(num, char, logic))
  }
}

createVector2_3()
createVector2_3(1, 2, 3, 4, 5, "a", "b", TRUE, FALSE)
createVector2_3(1, 4, 5, "a", 2, "b", 3, FALSE, 7, TRUE)
