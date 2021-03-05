pdf( "diffusion-accuracy.pdf" )
d <- read.table("o.txt")

# For a given concentration y, resolution k, and simulation duration t, compare
# simulated output with the analytical solution.
# Its outputs are twofold: it (1) prints a plot of the analytical solution + simulated 
# solution for a given resolution (k pixels/unit length), and (2) returns the RMSE
# of the simulation vs analytical solution
plt <- function( y, k, t, add=FALSE ){

	# For the analytical solution, compute the function at many points
	# along the interval 0,1
	xa <- seq(.001,.999,length.out=1000)
	ya <-  exp(-t*pi^2)*sin(pi*xa)
	if( add ){
		lines( xa, ya, col=2 ) 
	} else {
		plot( xa, ya, type="l",
			xlim=c(0,1), ylim=c(min(y[y!=0]),1), col=2, log="y", bty="l",
			xlab="x", ylab="y(x,t)", main = paste0( k, " pixels / unit length" ) )
	}
	
	# Now add the simulated data as points on top
	x <- seq(0,1,length.out=k+1)
	points( x, y, pch=19 )
	text( 0.5, max(ya), paste0("t=",t), adj=c(0.5,-.4) )
	
	# function returns RMSE (root mean squared error of the differences between 
	# the simulated and analytical solutions)
	sqrt( mean( (y - exp(-t*pi^2)*sin(pi*x))^2 ) )
}

par( mfrow=c(2,2) )

# This dataframe will contain RMSE value 'e' for each combination of resolution k and 
# total simulation length t
mse <- data.frame( k=numeric( 0 ), t=numeric(0), e=numeric(0) ) 

# Loop over the data to extract RMSE for combinations of k and t; 
# this automatically also produces the plot of simulated vs analytical data
for( k in unique( d$V1 ) ){
	first.t <- TRUE
	for( t in sort( unique( d$V2[d$V1==k] ), decreasing=TRUE ) ){
		mse <- rbind( 	mse, 
						data.frame( k=k, 
									t=t,
									e=plt( d$V3[d$V1==k & d$V2==t], k, t, add=!first.t ) 
						) 
				)
		first.t <- FALSE
	}
}

# Finally, plot the RMSE
plot( NA, 
	xlim=c(min(mse$k),max(mse$k)), 
	ylim=c(min(mse$e),max(mse$e) ), 
	log="y", 
	bty="l", 
	xlab="k", 
	ylab="RMSE" 
)

for( t in unique( d$V2 ) ){
	lines( mse[mse$t==t,c("k","e")], type="b", pch=19 )
	text( max(mse$k), min(mse$e[mse$t==t]), paste0("t=",t), adj=c(1,-.4) )

}
dev.off()
