setwd("G:/graduate-student/研究生/课件/R/kaggle")
train <- read.csv("train.csv", stringsAsFactors = FALSE)
test <- read.csv("test.csv", stringsAsFactors = FALSE)

train_num <- train[,2, drop = FALSE]
for (i in c(3:79)) {
    if(class(train[2, i]) == "integer"){
        train_num <- cbind(train_num, train[, i, drop = FALSE])
    }
}
View(train_num)
train_cat <- train[,3, drop = FALSE]
for (i in c(4:79)) {
    if(class(train[2, i]) == "character"){
        train_cat <- cbind(train_cat, train[, i, drop = FALSE])
    }
}
View(train_cat)

train_num[is.na(train_num)] <- -1
train_num <- cbind(train_num, train[, 81, drop = FALSE])

train_cat[is.na(train_cat)] <- "*MISSING*"
train_cat <- cbind(train_cat, train[, 81, drop = FALSE])

saleprice <- train[, 81, drop = FALSE]
saleprice_log <- log(saleprice)
View(saleprice_log)
library(ggplot2)
ggplot(saleprice) +
    geom_bar()

library(corrplot)
mcor <- cor(train_num)
corrplot(mcor)
mcor <- as.data.frame(mcor)
index1 <- c()
for (i in c(1:36)) {
    if(mcor$SalePrice[i] > 0.4){
        index1 <- c(index1, i)
    }
}

last1 <- train_num[,index1[1], drop = FALSE]
View(last1)
for (i in c(2:12)) {
    last1 <- cbind(last1, train_num[,index1[i], drop = FALSE])
}

library(rpart)
r2 <- c()
index2 <- c()
for (i in c(1:42)) {
    model = lm(data = train_cat, SalePrice ~train_cat[,i])
    a <- summary(model)
    r2 <- c(r2, a$r.squared)
    if(a$r.squared > 0.15){
        index2 <- c(index2, i)
    }
}
length(index2)
last2 <- train_cat[,index2[1], drop = FALSE]
for (i in c(2:13)) {
    last2 <- cbind(last2, train_cat[,index2[i], drop = FALSE])
}

last <- cbind(last1, last2)
last <- cbind(last, saleprice_log[,1, drop = FALSE])
View(last)
library(rpart)
model <- rpart(data = last, SalePrice~.)
summary(model)
pred = predict(model, test)
pred <- as.data.frame(pred)
pred <- exp(pred)
View(pred)
ans <- cbind(test$Id, pred)
names(ans) <- c("Id", "SalePrice")
write.csv(ans, "sample_submission.csv")

library(ggplot2)
ggplot(saleprice, aes(x=SalePrice)) +
    geom_histogram(fill = "skyblue", color = "black")
ggplot(saleprice, aes(x = 1, y = SalePrice))+
    geom_boxplot()+
    scale_x_continuous(breaks=NULL)+
    theme(axis.title.x = element_blank())

ggplot(saleprice_log, aes(y=SalePrice)) +
    geom_histogram()
