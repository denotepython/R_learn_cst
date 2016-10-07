swirl 1、Basic Building Blocks
1、赋值符号 <-
2、通过c()生成vector, c()也可以'拼接'几个序列
3、向上的箭头可以快速寻找之前写过的代码

swirl 2: Workspace and Files
1、getwd()得到当前工作mul
2、ls()列出当前工作环境下所有对象
3、list.files()/dir() 列出当前工作目录下所有文件名
4、args() 列出函数的参数
5、dir.create("文件名") 当前目录下创建新的文件夹或者文件（加后缀）
6、setwd("") 设定工作目录
7、file.exists("") 检查某个文件是否存在于当前目录
8、file.info("")  查看文件信息：文件大小、创建时间
9、file.rename("","") 重命名,需要两个参数，分别是原文件名和新文件名
10、file.copy("","") 复制文件
11、file.path("") 找出相对路径
12、dir.create(file.path("testdir2","testdir3"), recursive = TRUE) 
	创建一个文件夹包含一个子文件夹

swirl 3: sequences and numbers
1、使用a:b获得一个序列，默认增量为正负1 可整数可实数，a>b 或者a<b均可以
2、使用seq(a,b,by = c，length = n)可以控制步长或者数量 by和length两个参数不能同时存在
3、rep(vector, times = a, each = b) times重复整个向量，each重复每个元素
	> rep(c(1:3),times = 2)
	[1] 1 2 3 1 2 3
	> rep(c(1:3),each = 2)
	[1] 1 1 2 2 3 3

swirl 4: vectors
1、atomic vectors单一类型  、list包含多种类型
2、paste(vector, ,sep = " ", collapse = " ") 可以将分隔开来的字符连在一起成为一个字符串
	>my_char <- c("My", "name", "is")
	[1] "My"   "name" "is"  
	> paste(my_char, sep = " ")
	[1] "My"   "name" "is"

	>paste(my_char, collapse = " ")
	[1] "My name is"
	> paste(my_char, sep = " ", collapse = " ")
	[1] "My name is"

	> paste(1:3,c("X","Y","Z"))
	[1] "1 X" "2 Y" "3 Z"  不带参数默认每一一对应连接且有一个空格
	> paste(1:3,c("X","Y","Z"),  sep = "")
	[1] "1X" "2Y" "3Z" sep 参数一一对应连接
	> paste(1:3,c("X","Y","Z"), collapse = "")
	[1] "1 X2 Y3 Z" collapse参数先一一对应连接并整体连接
	> paste(1:3,c("X","Y","Z"), collapse = "", sep = "")
	[1] "1X2Y3Z"
	若两个序列长度不等，同样的采用循环的方式
	> paste(1:3,c("X","Y"), sep = "")
	[1] "1X" "2Y" "3X"

swirl 5: missing values
1、NA 意味着'not available' or 'missing'
2、rnorm(n, mean = , sd = ) 生成均值为a,标准差为b的n个正态分布随机数
	dnorm给出'概率密度函数'的值  density
		> dnorm(0)
		[1] 0.3989423 
	pnorm给出'分布函数'的值  probability
		> pnorm(0)
		[1] 0.5
	qnorm给出'分位数'对应的值，如标准正态分布的四分之一分位数为-0.67
		> qnorm(0.25)
		[1] -0.6744898

		quantile(x, ...)直接找出序列X的某分位数，X不用服从什么分布
	是分布函数的逆函数，定义域-1，1，值域正负无穷
	rnorm产生正态分布的随机数

	?Distributions 查看常用分布
"均匀分布的均值也是正态分布"	
3、sample(x, n, replace = FALSE, prob(a,b)) 从序列X中随机抽取n个数，
	replace = FALSE 表示无放回，无放回时要满足 length(x) >= n
	a,b不必和为1，会自动转化
4、sum()求和函数
5、NaN not a number

swirl 6: subsetting vectors 获得子序列
R中使用下标从1开始的索引
1、通过逻辑表达式的条件来获取
	如y[y>0]、 y[!is.na(y)]
2、使用序列 一次查询多个总记得要从c()表示成一个向量作为参数整体传入
	如y[1:10]、y[c(1,3,5)]
3、使用负数来表示排除
	如y[-c(1,3,5)] 输出除了 1，3，5下标的其他所有数
4、添加名称之后用名称索引
	添加名称的方法：创建之初就建立好名称 test <- c(a = 1, b = 2, c = 3)
					给已经存在的向量添加名称 names(test) <- c("a", 'b', "c")
						如果名称数量小于对应向量长度，会填充NA
						> names(test) <- c("a", "b")
						> test
						   a    b <NA> 
						   1    2    3 
	查询的办法是直接查询名称 test["a"] 必须加引号
5、identical(a,b) 判断a,b是否完全相同

swirl 7: matrices and data frames 矩阵同一类型，数据框可以包含不同类型
1、dim(x) 查看x的维度分布情况，x只能是矩阵或者数据框，向量会返回NA
	dim(x) <- value 此时x可以为向量，相当于将其重组为制定维度的矩阵
2、matrix(data = x, nrow = a, ncol = b, byrow = FALSE)
	byrow控制按行填充（TRUE)还是按列填充（FALSE 默认)
3、cbind(matrix1, matrix2) 按列组合 ，注意两个矩阵要是同一类型
4、data.frame()创建数据框
5、colnames(data_frame) <- cnames 给数据框的列添加列名

swirl 8: logic
1、> < == != !
2、& 与 && 即&可以和一个vector进行迭代与操作
	> TRUE & c(TRUE, FALSE, FALSE)
	[1]  TRUE FALSE FALSE
	> TRUE && c(TRUE, FALSE, FALSE)
	[1] TRUE
   | 与 ||同理
3、isTRUE()
4、xor(a,b) 异或 一真一假才为真
5、which(x) x是一个逻辑表达式向量 ，返回满足条件的元素组成的向量
6、any() 有一真则返回TRUE
7、all() 全真返回TRUE

swirl 9: functions
1、Sys.Date() 返回当前日期
2、输入函数名 不要括号和参数，查看函数源代码
3、all arguments after an ellipses must have default values
4、可以自定义运算符 %what%

swirl 10: lapply and sapply 循环函数
1、head(x, n) 返回对象的头n行
2、lapply(x,func) 函数 对每一个元素施加一次函数，最后返回一个列表。但是是离散的
				  func只要函数名，不要括号和参数
3、as.character() 强制类型转化
4、sapply() 帮助lapply函数简化，相当于格式化一下看起来更整洁
			In general, if the result is a list where every element is of length one, thensapply() returns a vector. 
			If the result is a list where every element is avector of the same length (> 1), sapply() returns a matrix. 
 			If sapply() can notfigure things out, then it just returns a list, no different from what lapply()
5、unique(x) 去重

swirl 11 : vapply and tapply
1、vapply() 需要指定格式而不是让R自己去猜
2、tapply() 分割数据成组，非常有用！！！

swirl 12 : Looking at Data 
1、read.table()
2、read.csv()
3、nrow() 看数据库或者矩阵行数 ncol 看列数
4、object.size() 查看对象所占用的空间大小
5、names(x) 会返回列名的一个vector
6、tail(x,n) 查看x的后n行元素 head 查看头几行元素
7、summary() 提供每个变量的各种统计值
8、str() 更加简洁的一种查看数据的方法

swirl 13: Simulation 模拟
1、sample(x, n, replace = FALSE， prob = NULL) 从序列X中随机抽取n个数，
	replace = FALSE 表示无放回，无放回时要满足 length(x) >= n
	当n不指明时，默认为x的长度
	prob 可以控制x中每个元素的权重 如果权重加起来不为1 ，会自动重新折算为和为1的新比例
	sample(c(0,1),100,replace = TRUE, prob = c(0.3,0.6)) ，那么1出现的概率不是0.6，二是2/3
	
	'例子'：
	 a <- function(x)sum(sample(x,100,replace = TRUE, prob = c(0.3,0.6)))
	 ans <- replicat(100,a(0:1)) 重复100次
	 mean(ans) / 100

	 得到的值就应该在2/3附近


2、 LETTERS 存储了26个英文大写字母 letters 存储了26个英文小写字母
3、Each probability distribution in R has an r*** function (for "random"), 
								a d*** function (for "density")
								a p*** (for "probability")
								a q*** (for"quantile")
	比如之前的rnorm、dnorm等是正态分布的各种
	二项分布dbinom(x, size, prob, log = FALSE)
			 pbinom(q, size, prob, lower.tail = TRUE, log.p = FALSE)
			 qbinom(p, size, prob, lower.tail = TRUE, log.p = FALSE)
			 rbinom(n, size, prob) 
	泊松分布
		dpois(x, lambda, log = FALSE) lanmda为均值向量
		ppois(q, lambda, lower.tail = TRUE, log.p = FALSE)
		qpois(p, lambda, lower.tail = TRUE, log.p = FALSE)
		rpois(n, lambda)
4、colMeans() 返回每一列的均值
5、hist() 画出直方图

swirl 15 : basic graphics
1、plot(x = , y = ) 指明哪个参数是x轴，哪个是Y轴
2、pch 形状、 col 颜色、 bg 背景、lwd 线宽
3、boxplot() 传入整个数据框作为参数

cov、var协方差，cor相关系数































































