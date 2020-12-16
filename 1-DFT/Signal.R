require(xts)

file <- read.csv('TehranHistoricalDailyTemp.csv' , header = FALSE )

file <- file[10000:17496,]

temp <- xts(file$V2,  order.by = as.POSIXct(file$V1, format = '%Y-%m-%d'))

plot(temp)

x <- temp['2018']

f <- fft(coredata(x))
p <- sqrt(Re(f)^2+Im(f)^2)
plot(p)
f[ p < 150 ] <- 0

plot( Re(fft( f , inverse = TRUE ) / length(x)) , type = 'l' )
lines( coredata(temp['2019']) , col = "dark red")
