library(ggplot2)

p <- ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, fill = Species))

p + stat_density2d(aes(alpha = ..level..), geom ="polygon") + #添加透明度水平
    theme(panel.grid.minor = element_blank())+ #去掉次网格线
    theme_bw()+ #修改背景颜色
    geom_rug(aes(color = Species), position = "jitter", size = 0.2)+ #增加边际毛毯
    guides(color = FALSE) #删除图例


