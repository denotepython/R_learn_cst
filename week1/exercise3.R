# •	第k个月，Xk只成年兔子，Yk只未成年兔子,num(k) = Xk + Yk
# •	第k+1个月，Xk+Yk只成年兔子，Xk*n只未成年兔子 num(k+1) = Xk + Yk +Xk*n
# •	第k+2个月，Xk+Yk+Xk*n只成年兔子，(Xk +Yk)*n只未成年兔子 
# 			num(k+2) = Xk + Yk +Xk*n + (Xk +Yk)*n = num(k+1) + num(k) * n

num <- rep(c(0), 1000)
count <- function(x, y, n, m){
	num[1] <- x + y
	num[2] <- num[1] + x * n
	for(i in 3:m+1){
		num[i] <- num[i-1] + num[i-2] * n
	}
	print(num[m+1])
}

count(1,1,3,5)