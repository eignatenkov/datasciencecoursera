
makeCacheMatrix <- function(x = matrix()) {
    ##makes special "matrix" object, that can contain matrix itself and its inversed matrix
    ##it's a a list containing functions to
    ##    1.  set the value of the matrix
    ##    2.  get the value of the matrix
    ##    3.  set the value of the inversed matrix
    ##    4.  get the value of the inversed matrix
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


##the following function computes the inversed matrix for the special "matrix"
##created with the makeCacheMatrix function However, it first checks to see if the
##inversed matrix has already been calculated. If so, it `get`s inversed matrix
##from the cache and skips the computation. Otherwise, it calculates inversed
##matrix and sets it in the cache via the `setinverse` function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
