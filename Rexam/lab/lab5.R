# 문제 1
grade <- as.character(sample(1:6, 1))
switch(EXPR=grade, "1"=,"2"=,"3"=print(paste(grade, "학년은 저학년입니다.")),
       "4"=,"5"=,"6"=print(paste(grade, "학년은 고학년입니다.")))

# if (grade >= 4){
#   cat(grade, " 학년은 고학년입니다.", "\n")
#} else{
#   cat(grade, " 학년은 저학년입니다.", "\n")
#}


# 문제 2
choice <- as.character(sample(1:5, 1))
cat("결과값:", switch(EXPR=choice, "1"=(300 + 50), "2"=(200 - 50), "3"=300*50, "4"=300/50, "5"=300%%50), sep="")

# 문제 3
count <- sample(3:10, 1)
deco <- as.character(sample(1:3, 1))
i <- 1
while (i <= count){
  cat(switch(EXPR=deco, "1"="*", "2"="$", "3"="#"), sep="")
  i <- i + 1
}

# 문제 4
score <- sample(0:100, 1)
score1 <- as.character(score%/%10)
level = switch(EXPR=score1, "9"=,"10"="A", "8"="B", "7"="C", "6"="D", "F")
cat(score, "점은 ", level, "등급입니다.\n")

# 문제 5
i <- 1
while (i <= length(LETTERS)){
  alpha[i] = paste(LETTERS[i], letters[i], sep="")
  i <- i + 1
}
alpha

# (alpha <- paste0(LETTERS, letters))
