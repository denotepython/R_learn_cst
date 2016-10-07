getwd()

a = 1
b = 2
c = 3
ls()
rm(a)
rm(list = ls())

save(a, b, c, file = "object.Rdata")
rm(list = ls())
load("object.Rdata")

source("new.R")


c("a",1,2,3)
c(1,2,3,4) + c(1,1,2,2)
c(1,2,3,4) + c(1,2,3)
1:6
6:1

c(1,2,3,4) > c(1,1,2,2)



exp(1 : 4)
log(exp(1:4))
x = log(1:4)
x[1]
x[2]
x[3]
x[4]



x[2:3]
x[c(2,3)]
x[-c(1,4)]
x[1:3]
x[-4]
x[x<1.2]
x[c(T, T, T, F)]
x[c(T, F, T, F)]
# x[c(T, F)]

a = array(1:12, dim=c(3,4))
print(x)

x[,2][2]
x[2,][2]

x[-3,c(1,2)]

# dataframe
city  <- c('beijing','shanghai','chengdu','shanghai','beijing')
age <- c(23,43,51,32,60)
sex <- c('F','M','F','F','M')
people <- data.frame(city,age,sex)
print(people)
View(people)

people$city
people$age
people$sex

people[, 1]
people[,c(T,F,F,F)]

#list
people.list = list(age = age,
                   sex = sex,
                   city = city)

people.list$array <- a
people.list$dataframe <- people




model <- lm(formula=dist ~ speed, data=cars)

1 : 10 + 2
2 + 1 : 10
1 : (10 + 2)

rep(1, 10)
rep(c(1,2,3), each = 3)



rep(1:3, each =3)
rep(1:3,3)
c(1,2,3,3,4,5,5,6,7)


n =50000
h = pi/n
x= seq(0,pi,length.out = n)
reck = sin(x)*h
sum(reck)


vec_logic <- c(TRUE,TRUE,TRUE,FALSE)
vec_string <- c('A','B','C','D') 
vec_random1 <- runif(5)
vec_random2 <- sample(c('A','B'),size=10,replace=TRUE)
vector1 <- numeric(10)


class(vec_string)
class(vec_random2)
class(vector1)

vector <- rnorm(10)
vec_max <- max(vector)
vec_min <- min(vector)
vector_trimmed <- vector[vector<vec_max & vector>vec_min]
vec_mean <- sum(vector_trimmed)/length(vector_trimmed)


# matrix
matrix(1:12, nrow=3, ncol=4)
mat = matrix(1:12, nrow=3, ncol=4, byrow = T)
class(mat)
dim(mat)

vector = 1:12
dim(vector)
length(vector)
dim(vector)  = c(3,4)


vector1 <- vector2 <- vector3 <- rnorm(3)
my_matrix <- cbind(vector1,vector2,vector3)
#rbind
ifelse(my_matrix>0,1,0)

my_mat = matrix(c(8,3,4,1,5,9,6,7,2),ncol=3)
print(my_mat)

my_matrix = matrix(1:9,3,3)
colSums(my_matrix)
rowSums(my_matrix)
diag(my_matrix)

class(my_matrix[1,])
class(my_matrix[1,,drop=F])


A <- matrix(c(3,1,5,2),2,2)
b <- matrix(c(4,1),ncol=1)
x <- solve(A,b)

sum(A[1,] * x[,1])
sum(A[2,] * x[,1])
A %*% x

10 %% 3
10 %/% 3
9 %% 2
9 %/% 2

T + 2
F * T

people
people$age
people[,2]

people[,c(F,T,F)]
people[,'age']

people[[2]]
people[['age']]

city <- c('A','B','C','D')
temp = c(27,29,23,14)
data <- data.frame(city,temp)
data$city
data <- data.frame(city,temp, stringsAsFactors = F)
data$city

ave = mean(data$temp)
data[data$temp<ave, ]

summary(data)
str(data)
head(iris)
tail(iris,n = 2)
dim(data)
dim(iris)

data$temp
sort(data$temp)
order(data$temp)
data$temp[order(data$temp)]
data[order(data$temp),]

people.list
people.list$age

people.list[1]
people.list[[1]]

class(people.list[1])
class(people.list[[1]])
names(people.list)
length(people.list)
names(people.list)[1] = "age1"

temp_new = c(data$temp, NA)
mean(temp_new, na.rm = T)
length(temp_new)

temp <- c(27, 29, 23, 14, NULL)

myfun = function(r = 1){
  pi*r^2
}

myfun(1)
myfun()



num <- sample(20:70,20,replace=T)
res <- ifelse(num>50,'老年',ifelse(num<30,'青年', '中年'))

judge = function(x){
  if(x %% 2==0){
    out = T
  }else{
    out = F
  }
  return(out)
}

sapply(1:5, judge)

new_judge = Vectorize(judge)
judge(1:5)
new_judge(1:5)


iris[,1:4]
sapply(iris[,1:4], sd)
sapply(iris[,1:4], mean)

sapply(iris[,1:4], sd)/sapply(iris[,1:4], mean)

my_list = as.list(iris[,1:4])
sapply(my_list, var)

lapply(my_list, function(x) c(mean(x),sd(x)))
result= lapply(my_list, function(x) c(mean(x),sd(x)))

do.call(rbind, result)
do.call(cbind, result)

my_mat = iris[1:3,1:3]

# select avg(Sepal.Length)
# from iris
# group by Species
vec1 <- vec2 <- 1:9
para <- expand.grid(vec1,vec2)
res <- mapply(FUN=prod,para[,1],para[,2])


simu = function(){
  x = 1:20
  sum(x == sample(x))
}

result = replicate(10000, simu())
sum(result == 0)/length(result)

dir()
for(file in dir()){
  print(file)
}


findprime  <- function(x) {
  if (x %in% c(2,3,5,7)) return(TRUE)
  if (x%%2 == 0 | x==1) return(FALSE)
  xsqrt <- round(sqrt(x))
  xseq <- seq(from=3,to=xsqrt,by=2)
  if (all(x %% xseq !=0)) return(TRUE)
  else return(FALSE)
}

system.time({
  x <- logical()
  for (i in 1:1e5) {
    y <- findprime(i)
    x <- c(x,y)
  }
})

system.time({
  x <- logical(1e5)
  for (i in 1:1e5) {
    y <- findprime(i)
    x[i] <- y
  }
})


system.time({
  x <- sapply(1:1e5,findprime)
})


i = 2
x = c(1,1)
j = x[2]
while(j<10000){
  if( x[i] + x[i-1] > 10000) break
  x[i+1] = x[i] +x[i-1]
  i = i+1
}

x <- 10
add = function(n){
  x <- 1
  return(x+n)
}

add(2)

x <- 10
add = function(n){
  x <<- 1
  return(x+n)
}

SdFunc <- function(x,type='sample') {
  stopifnot(is.numeric(x), 
            length(x) > 0,
            type %in% c('sample', 'population'))
  # x <- x[!is.na(x)]
  n <- length(x)
  m <- mean(x)
  if(type=='sample') {
    sd <- sqrt(sum((x-m)^2)/(n-1))
  } 
  if(type=='population') {
    sd <- sqrt(sum((x-m)^2)/(n))
  } 
  return(sd)
}

SdFunc(x = 1:10, type = "aaa")

set.seed(123)
rnorm(10)

set.seed(123)
rnorm(10)


table(Wage$education)
health.table <- with(Wage,table(health,health_ins))
health.m <- as.matrix(health.table)
apply(health.m,2,function(x) x/sum(x))

margin.table(health.table,1)
prop.table(health.table,1)

plot(health.table)

with(Wage,table(health,health_ins,jobclass))
with(Wage,xtabs(~health+health_ins+jobclass))
with(Wage,ftable(health~health_ins+jobclass))


