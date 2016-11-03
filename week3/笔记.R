library(rjson)
result1 <- rjson::fromJSON(readLines("provinces.json"))

library(jsonlite)
result2 <- jsonlite::fromJSON(readLines("bmw_last.json"))
pvid_raw <- result$provinces
city_raw <- result$dealerCities
address_raw <- result$branches
service_raw <- result$branchTypes

pvid = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$pv
    for(j in c(1: length(pvid_raw))){
        if(temp == pvid_raw[[j]]$id){
            ans <- pvid_raw[[j]]$nz
            break
        }
    }
    pvid <- c(pvid, ans)
}

city = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$ct
    for(j in c(1: length(city_raw))){
        if(temp == city_raw[[j]]$id){
            ans <- city_raw[[j]]$nz
            break
        }
    }
    city <- c(city, ans)
}

ws = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$ws

    ws <- c(ws, temp)
}

nz = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$nz
    if(is.null(temp)){
        temp = NA
    }
    nz <- c(nz, temp)
}

az = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$az
    if(is.null(temp)){
        temp = NA
    }
    az <- c(az, temp)
}

lnb = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$lnb
    if(is.null(temp)){
        temp = NA
    }
    lnb <- c(lnb, temp)
}

ltb = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$ltb
    if(is.null(temp)){
        temp = NA
    }
    ltb <- c(ltb, temp)
}

dnz = c()
for (i in c(1:length(address_raw))) {
    temp <- address_raw[[i]]$dnz
    if(is.null(temp)){
        temp = NA
    }
    dnz <- c(dnz, temp)
}

output = data.frame(city = city, pvid = pvid, shortName = dnz, fullName = nz, address = az,
                    url = ws, lon = lnb, lat = ltb)
write.csv(output, "output.csv")

# 获得州名 
states = rownames(USArrests)

# 方法一：substr()
substr(x = states, start = 1, stop = 4)

# 方法二：abbreviate()

abbreviate(states,minlength = 5)

tolower()

state_chars <- nchar(states)

# hist
hist(nchar(states),main = "Histogram",
     xlab = "number of charaters in US State names")


# longest state's name
states[which(state_chars == max(state_chars))]

which.max(state_chars) #只会返回一个

url <- 'https://movie.douban.com/top250'
web <- readLines(url, encoding = "UTF-8")
name <- str_extract_all(string = web, pattern = '<span class="title">.+</span>')
movie_name <- unlist(name)
movie_names <- str_extract(string = movie_name, pattern = ">[^&].+<")

library(ggplot2)
ggplot(data = iris, mapping = aes(x = Sepal.Length, 
                                  y = Sepal.Width,
                                  color = Species)) + geom_point(size = 5)

p <- ggplot(data = iris, aes(x = Sepal.Length)) + 
    geom_histogram(binwidth = 0.1,
                   fill = "skyblue", 
                   color = "black") +
    stat_density(geom = 'line', color = "black",
                 linetype = 2, adjust = 2)

p -< ggplot(iris, aes(x = Sepal.Length, fill - Species))+
    geom_density()

ggplot(mpg, aes(x = class)) + geom_bar(color = 'blue')

ggplot(mpg, aes(x = factor(1), fill = 'black')) + geom_bar(width = 1)+
    coord_polar(theta = "y")

library(corrplot)
data(mtcars)
M = cor(mtcars)
corrplot(M, order = "hclust")

library(openair)
data(mydata)


world <- world_map("world")

set.seed(1)
x = seq(1, 5, length.out = 100)
noise = rnorm(n = 100, mean = 0, sd = 1)#增大n或者减小sd
beta1 = 1
beta2 = 2
y = beta1 + beta2 * x + noise
plot(x, y)
model = lm(y~x) #线性模型
summary(model)  #Residuals残差
abline(model)

qplot(x, y) + stat_smooth(method = 'lm')


x1 = seq(1, 5, length.out = 100)
noise = rnorm(n = 100, mean = 0, sd = 10)#增大n或者减小sd
beta1 = 1
beta2 = 2
y1 = beta1 + beta2 * x1 + noise
cor(x1,y1)
summary(lm(x1~y1))

x2 = seq(1, 5, length.out = 100)
noise = rnorm(n = 100, mean = 0, sd = 1)#增大n或者减小sd
beta1 = 1
beta2 = 2
y2 = beta1 + beta2 * x2 + noise
cor(x2, y2)
summary(lm(x2~y2))
#线性回归不需要标准化，量纲对统计量没影响

x = seq(1, 5, length.out = 100)
noise = rnorm(n = 100, mean = 0, sd = 1)#增大n或者减小sd
beta1 = 1
beta2 = 2
y = beta1 + beta2 * x + noise
plot(x, y)
model = lm(y~x+0) #+0去掉截距项
summary(model)  #Residuals残差
abline(model)
library(ggplot2)
qplot(x, y) + stat_smooth(method = 'lm')

x = x = seq(1, 5, length.out = 100)
y2 = x^2 + rnorm(100)
fit = lm(y2~x)
plot(fit)

z = x^2
fit1 = lm(y2~z)
plot(fit1)

vif()#
AIC(model1, model2)
BIC(model1, model2)

set.seed(123)
index = sample(1:150, 120)
train = iris[index,]
test = iris[-index,]

model = lm(data = train, Sepal.Length ~ .)

summary(model)

pred = predict(model, test[, 2:5])
true = test[,1]
sum((true - pred)^2/30) #RMSE参数
library(ggplot2)
plotdata = data.frame(x = 1:30, y1 = pred, y2 = true)
ggplot(plotdata) + geom_point(aes(x = x, y = y1))

ggplot(plotdata,
       aes(x = x, ymax = y1, ymin = y2))+
    geom_linerange(color = 'grey20', size = 0.5)+
    geom_point(aes(y = pred),
               color = 'red')

library(rpart)

set.seed(123)
index = sample(1:150, 120)
train = iris[index,]
test = iris[-index,]

model = rpart(data = train, Sepal.Length ~ .)

summary(model)

pred = predict(model, test[, 2:5])
true = test[,1]
sum((true - pred)^2/30)
library(ggplot2)
plotdata = data.frame(x = 1:30, y1 = pred, y2 = true)
ggplot(plotdata) + geom_point(aes(x = x, y = y1))

ggplot(plotdata,
       aes(x = x, ymax = y1, ymin = y2))+
    geom_linerange(color = 'grey20', size = 0.5)+
    geom_point(aes(y = pred),
               color = 'red')



library(randomForest)
set.seed(123)
index = sample(1:150, 120)
train = iris[index,]
test = iris[-index,]

model = randomForest(data = train, Sepal.Length ~ .)


pred = predict(model, test[, 2:5])
true = test[,1]
sum((true - pred)^2/30)
library(ggplot2)
plotdata = data.frame(x = 1:30, y1 = pred, y2 = true)
ggplot(plotdata) + geom_point(aes(x = x, y = y1))

ggplot(plotdata,
       aes(x = x, ymax = y1, ymin = y2))+
    geom_linerange(color = 'grey20', size = 0.5)+
    geom_point(aes(y = pred),
               color = 'red')



