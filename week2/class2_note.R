数据获取
格式化输出 format
写入文件 writelines()
输入 readline()
	scan()

本地文件输入： file("文件名")
				
				input()


数据表的读写
excel文件的读取
	1、xlsx包
	2、存储成CSV文件 read.csv()
	3、read.table() fill = T,会把缺失值填充成NA

读取数据库
	1、数据库保存为本地文件，然后用R处理
	2、直接连接数据库 RMySQL
web数据爬虫
xml包
library(XML)
例一、爬地震局的表格文件
url = "http://www.cea.gov.cn/publish/dizhenj/468/496/102171/index.html"
tables <- readHTMLTable(url, stringAsFactors = F, header = F, encoding = "UTF-8")
#爬取网页中的表格，最简单的爬虫
非结构化网页爬虫
htmlParse 抓取页面数据并形成树状结构
XPath
例二、爬取豆瓣电影排行榜
getmovie <- function(){
	movie <- htmlParse(url)
	nodes <- getNodeSet(movie, "//div[@class = 'hd']//span[@class = 'title'][1]")
	names <- sapply(nodes, xmlValue)
	return(names)
}

url <- "https://movie.douban.com/top250?start=100&filter="
name <- getmovie(url)
num <- seq(0,225,by = 25)
urls <- paste('https://movie.douban.com/top250')
movienames <- tapply(num,getmovie)
例三、爬取API
raw <- readlines("url") 
fromJSON(raw)
作业：爬取宝马在中国经销商的地理位置信息

POSIXct POSIXct
Sys.Date()
Sys.time()

difftime(time = , time2 = , units = ) 计算时间差
units(internal) <- "days" 更改时间差的计量方式
weekdays、months
strptime()

删除缺失值
na.rm()
na.omit() 删除有缺失的行
complete.cases()

字符串处理
nchar()  字符串长度
strsplit(x, split = '') 分隔字符串
paste(x, collapse = ) 拼接
	collapse 和 sep 区别
	> a = c('a', 'b', 'c')
	> paste(a, 1)
	[1] "a 1" "b 1" "c 1"
	> paste(a, 1, sep = '-')
	[1] "a-1" "b-1" "c-1"
	> paste(a, 1, collapse  = '-')
	[1] "a 1-b 1-c 1"
	> paste(a, 1, collapse  = '-', sep = '-')
	[1] "a-1-b-1-c-1"
substr()
gsub() 全部替换
grep() 匹配

编码规范
1、不要使用attach函数 ——把一个数据框的全部变量名放入变量空间可以直接引入
函数报错用stop
2、文件名
3、变量名
	不要使用下划线或者-或者.
	使用驼峰式命名
4、前后空格
5、单行长度80

数据预处理
探索数据：统计值、缺失值、探索值
集中程度和离散程度
离群值：根据业务或者统计区间
	  用一个模型或者一系列统计量
	  用聚类的方法把数据分割成较小的子集
缺失值：忽略/用0或者NA代替
  提取缺失值 用na.omit()或者!complete.cases()
  用VIM包插入缺失值

数据导入
Rcurl 网络爬虫包的接口
ROOBC 数据库接口
foreign 提供各类数据接口

数据处理
dplyr 
tbl_df 数据类型 自动调整数据显示 更智能的“数据框”
filter 数据筛选  通过准则选择行
select 子集选择  通过名字选择列 
	starts_with
	ends_with
	contains
	matches
	num_range
	everything
	select会做变量的删减，rename不会删减变量
arrange 数据排序
mutate 数据扩展
summarise 数据汇总
	min max mean sum sd median IQR n n_distinct first last

'只想用某一个包的某个函数可以用 包名::函数名'

数据集的连接join
Group-wise 汇总数据
group_by 

下下次作业
kaggle
House Prices: Advanced Regression Techniques






