# Two main functions were created, called 'makeCacheMatrix' and 'cacheSolve'. They show how to cache time-consuming computations, instead to performing repeated computations.
# The presented functions work with matrices (object class = matrix), calculating the inverted matrix using function 'solve'.
# Please read 'README.md' file for more information and example.

# 'makeCacheMatrix' creates an object type 'list', with variable 'inv' initially set to 'NULL', and other nested functions which will be accessed by the second main function called 'cacheSolve'.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set_mtx <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get_mtx <- function() x
    set_inv_mtx <- function(invert) inv <<- invert
    get_inv_mtx <- function() inv
    list(set_mtx = set_mtx, get_mtx = get_mtx,
         set_inv_mtx = set_inv_mtx,
         get_inv_mtx = get_inv_mtx)
}

# 'cacheSolve' calculates the inverted matrix which is input in 'makeCacheMatrix' and caches it. 
# In case the inverted matrix has already been calculated, 'cacheSolve' returns the cached value, otherwise, performs the calculation.

cacheSolve <- function(x, ...) {
    inv <- x$get_inv_mtx()
    if(!is.null(inv)) {
        message("Getting cached inverted matrix")
        return(inv)
    }
    data <- x$get_mtx()
    inv <- solve(data, ...)
    x$set_inv_mtx(inv)
    inv
}