
require(wavelets)
require(quantmod)
require(ggplot2)

file <- read.csv('TehranHistoricalDailyTemp.csv' , header = FALSE )

file <- file[10000:17496,]

temp <- xts(file$V2,  order.by = as.POSIXct(file$V1, format = '%Y-%m-%d'))

x <- temp['2018']

X1 <- coredata(x)



wt <- dwt(X1, n.levels=3,filter="haar")


plot(wt)

