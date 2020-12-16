
# final time for boundary value problem
TIME <- 3
# number of euler steps
STEPS <- 5000
h <- 3/STEPS

# sequence of different s values
S <- seq(-12,-7,0.01)

error <- array()
j <- 1

for( s in S ){

  z1 <- array()
  z2 <- array()
  
  z1[1] <- 1
  z2[1] <- s
  
  
  
  for( i in 1:(STEPS) ){
    
    z1[i+1] <- z1[i] + h*z2[i]
    z2[i+1] <- z2[i] + h*100*z1[i]
  
  }
  
  # plot one trajectory
  #plot( seq(0,TIME,h) , z1 , type = 'l')
  # print end point
  #print(z1[STEPS])
  
  e <- exp(-30) - z1[STEPS]
  #print(e)
  error[j] <- e
  j <- j+1

}

# Plot S vs. Error

plot( S , error , type = 'l')

# Choose best parameter S

best_s <- which.min(abs(error))
S[best_s]
