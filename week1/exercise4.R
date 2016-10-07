wage <- Wage$wage
age <- Wage$age
education <- Wage$education
health <- Wage$health
health_ins <- Wage$health_ins

mean(wage) #均值
sd(wage)   #标准差
quantile(wage, 0.25)  #四分之一分位数
quantile(wage, 0.75)  #四分之三分位数

cor(age,wage) #1、wage和age之间的相关性

health.table <- with(Wage,table(education,health,health_ins)) #2
health.table  #education,health,health_ins的交互频数表

tapply(wage,education,mean) # education作为索引相当于group by
tapply(wage,education,length)  #3、不同education的wage均值以及相应人数

wage_edu <- tapply(wage,education,table) 
wage_edu  #4、不同education和wage的联列表




