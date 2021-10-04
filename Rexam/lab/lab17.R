Sys.setlocale(category = 'LC_CTYPE', locale = 'Korean_Korea.949')
emp <- read.csv('data/emp.csv')

library(dplyr)
# 문제 1
emp %>% filter(job == 'MANAGER')
# 문제 2
emp %>% select(empno, ename, sal)
# 문제 3
emp %>% select(-empno)
# 문제 4
emp %>% select(ename, sal)
# 문제 5
emp %>% 
  group_by(job) %>% 
  count

emp %>% count(job)
# 문제 6
emp %>% 
  filter(sal >= 1000 & sal <= 3000) %>%
  select(ename, sal, deptno)
# 문제 7
emp %>%
  filter(job != 'ANALYST') %>% 
  select(ename, job, sal)
# 문제 8
emp %>% 
  filter(job == 'SALESMAN' | job == 'ANALYST') %>% 
  select(ename, job)
# 문제 9
emp %>% 
  group_by(deptno) %>% 
  summarise(sal.sum = sum(sal))
# 문제 10
emp %>% arrange(sal)
# 문제 11
emp %>% 
  arrange(desc(sal)) %>% 
  head(1)
# 문제 12
emp %>% rename(salary = sal, 
               commrate = comm) -> empnew
str(empnew)
# 문제 13
emp %>% 
  count(deptno) %>% 
  arrange(desc(n)) %>%
  head(1) %>% 
  select(deptno)

emp %>% 
  count(deptno) %>% 
  arrange %>% 
  tail(1) %>% 
  summarise(deptno)
# 문제 14 **summarise : 집계할 때 사용! **select : column 뽑기
emp %>% 
  mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength) %>% 
  select(ename, enamelength)
# 문제 15
emp %>% 
  filter(!is.na(comm)) %>% 
  count

# 문제 16
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
# 1
mpg %>% str
# 2
mpg %>% dim
# 3
mpg %>% head(10)
# 4
mpg %>% tail(10)
# 5
mpg %>% View
# 6
mpg %>% summary
# 7
mpg %>% 
  count(manufacturer)
# 8 **group_by 해서 count 하면 tibble 형식으로 **count만 하면 데이터프레임으로
mpg %>% 
  count(manufacturer, model)

# 문제 17
# 1
mpg %>% rename(city=cty,
               highway=hwy) -> mpg.rename
# 2
mpg.rename %>% head

# 문제 18
# 1
mpg %>% 
  filter(displ <= 4 | displ >= 5) %>%
  mutate(displ.group = ifelse(displ <= 4, 'displ4-', 'displ5+')) %>% 
  group_by(displ.group) %>% 
  summarise(hwy.mean = mean(hwy))
# 2
mpg %>% 
  filter(manufacturer %in% c('audi', 'toyota')) %>% 
  group_by(manufacturer) %>% 
  summarise(cty.mean = mean(cty))
# 3
mpg %>% 
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>% 
  summarise(hwy.mean = mean(hwy))

# 문제 19
# 1
mpg %>% select(class, cty) -> mpg3
head(mpg3)
# 2
mpg3 %>% 
  filter(class %in% c('suv', 'compact')) %>% 
  group_by(class) %>% 
  summarise(cty.mean = mean(cty))

# 문제 20
mpg %>% 
  filter(manufacturer == 'audi') %>% 
  arrange(desc(hwy)) %>% 
  head(5)
