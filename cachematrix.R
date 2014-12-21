## First Function creates a LIST that will contain getter setter for the Input MATRIX and Output InverseMatrix
## Second Function will take the LIST from First function as input. Will try to get inverse of matrix from cache first.
##if not found then will compute

## Will take matrix as argument. Return a list containing getter setter methods

makeCacheMatrix  <- function(matrixX = matrix()) {

  	inverseOfMatrix <- NULL		#computedValue

  	set<-function(matrixY){
  		matrixX <<- matrixY
  		inverseOfMatrix <<- NULL
	}

	get<-function() matrixX 

	setInverseMatrix <- function(solve) inverseOfMatrix <<- solve

	getInverseMatrix<-function() inverseOfMatrix 

	list(	set=set, 
		get=get,
		setInverseMatrix = setInverseMatrix,
   		getInverseMatrix = getInverseMatrix)
}


## Return a matrix that is the inverse of 'x'. It will try to get from cache first

cacheSolve  <- function(x,...){

	inverseOfMatrix  <- x$getInverseMatrix()
	if(!is.null(inverseOfMatrix)){
		message("getting cached data")
            return(inverseOfMatrix)
	}
	
	data <- x$get()
	inverseOfMatrix <- solve(data,...)
	x$setInverseMatrix(inverseOfMatrix)
	
}