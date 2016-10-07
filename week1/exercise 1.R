div <- function(x){
	if(x %% 3 == 0 || x %% 5 == 0) return(x)
	else return(0)
} 

sum(sapply(c(1:1000), div))