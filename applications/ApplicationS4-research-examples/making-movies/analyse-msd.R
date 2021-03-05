
# Reading the tracks depends on the number of dimensions (2 or 3 pos.columns?)
# The torus.fieldsize argument, if not null, indicates that a correction for a torus 
# should be implemented with the specified fieldsize in x,y(,z) dimensions.
readTracks <- function( trackfile, torus.fieldsize = NULL ){
	suppressMessages( require( celltrackR, quietly=TRUE  ) )
	# x and y coordinates in columns 4-5
	tracks <- read.tracks.csv( trackfile, id.column=2, time.column=1, pos.columns=4:5 )
	if( !is.null(torus.fieldsize) ){
		tracks <- correctTorus( tracks, fieldsize = torus.fieldsize )
	}
	
	return( tracks )

}

# Correct tracks when cells move in a torus
correctTorus <- function( tracks, fieldsize = c(200,200) ){

	# Loop over separate tracks in the tracks object (can be just one)
	for( t in 1:length(tracks) ){

		# Loop over the dimensions x,y(,z) (first column is time)
		coordlastcol <- ncol( tracks[[t]] )
		for( d in 2:coordlastcol ){
		
			# do the correction only if the fieldsize in that dimension is not NA
			# (which indicates that there is no torus to be corrected for)
			if( !is.na( fieldsize[d-1] ) ){
			
				# distance traveled in that direction
				dc <- c( 0, diff( tracks[[t]][,d] ) )

				# if absolute distance is more than half the gridsize,
				# the cell has crossed the torus border.
				# if the distance is negative, all subsequent points
				# should be shifted with + fieldsize, if positive,
				# with -fieldsize.
				corr <- 0
				corr[ dc < (-fieldsize[d-1]/2) ] <- fieldsize[d-1]
				corr[ dc > (fieldsize[d-1]/2) ] <- -fieldsize[d-1]
				corr.points <- which( corr != 0 )

				# apply the correction: shift all subsequent points with the
				# correction factor determined above.
				totrows <- nrow( tracks[[t]] )
				for( row in corr.points ){
					tracks[[t]][ (row:totrows), d ] <- tracks[[t]][ (row:totrows), d ] + corr[row]
				}
			
			}
			
		}

	}

	# return corrected tracks
	return( tracks )

}

# Read in data with the given field size
t <- readTracks( "data.txt", c(200,200) )

msd <- aggregate( t, squareDisplacement, FUN = "mean.se" )
msd <- msd[ msd$i <= 200, ]

pdf( "mean-squared-displacement.pdf", width = 10, height = 5 )

par( mfrow=c(1,2) )
plot(t, main = "Cell track" )
plot( msd$i, msd$mean, xlab = "dt", ylab = "MSD", type = "l", main = "MSD curve" )
lines( msd$i, msd$lower, col = 2, lty = 2 )
lines( msd$i, msd$upper, col = 2, lty = 2  )

dev.off()