## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
## Together makeCacheMatrix and cacheSolve take in a matrix, create and inverse matrix
## solve the inverse matrix and cache the solution for future use.


## makeCacheMatrix takes in a matrix and return 4 functions: set, get, setinv and getinv
## set: sets the value of the matrix
## get: returns the value of the matrix
## setinv: sets the value of the inverse matrix
## getinv: gets the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  
    invmat <- NULL
    
    # defines x as the matrix
    set <- function(y) {
      x <<- y
      invmat <<- NULL
    }
    
    # returns x as a matrix
    get <- function() x
    
    # calculates the inverse of x and puts it in the cache
    setinv <- function(solve) invmat <<- solve
    
    # takes the inverse value 
    getinv <- function() invmat
    
    #returns all the functions
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)

}


## this function looks to see if function is in the cache and returns it
## otherwise calculates it

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinv()
  # if the inverse is present in the cache, return it
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  # if not in cache, uses x as a matrix...
  data <- x$get()
  #...computes its inverse...
  inv <- solve(data, ...)
  #...puts it in the cache...
  x$setinv(inv)
  #...and returns it!
  inv
  
}
