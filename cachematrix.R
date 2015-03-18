## Put comments here that give an overall description of what your
## functions do

## This function creates a list of four functions:
## 1. set- puts into cache a matrix passed to it
## 2. get- simply returns the cached matrix
## 3. setinverse- caches a matrix passed to it, intended to cache the inverse
## 4. getinverse- simply returns a matrix, inteded to return the inverse

makeCacheMatrix <- function(m = matrix()) {
  x <- NULL
  set <- function(y) {
    m <<- y
    x <<- NULL
  }
  get <- function() m
  setinverse <- function(solved) x <<- solved
  getinverse <- function() x
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Write a short comment describing this function
## Calls the four functions in the list created by makeCacheMatrix
## Pulls from the cache whatever was stored by makeCacheMatrix into m
## Checks to see if there is anything actually stored in m
## If there is something in m, then it returns it and ends the program
## If there is nothing, then it uses the get function to return whatever is stored in cache from makeCacheMatrix
## It then calculates the inverse of the get function and stores it in caches using setinverse
## Finally, it returns the inverse matrix

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
