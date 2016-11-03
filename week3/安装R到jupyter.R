install.packages("devtools")  

## 调用RCurl，可通过github下载有关文件
install.packages('RCurl')
library(devtools)
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec() #重装R后重修输入这一句