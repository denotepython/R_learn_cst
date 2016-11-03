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
sum((true - pred)^2/30)
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
