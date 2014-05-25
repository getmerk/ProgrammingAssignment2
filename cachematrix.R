# The following code is intended to write an R function which is able 
# to catch the inverse of a matrix. The advantage of this procedure is to reduce 
# Potentially time consuming computations. The following two main functions 
# are written such that we can catch the inverse of a matrix. 

# The first function, makeCacheMatrix, creates a special matrix
# object that can cache its inverse. 

makeCacheMatrix <- function (x = matrix ()){ # a function with an argument x. 
        m <<- NULL # an internal variable m which is set NULL
        set <- function(y) { # subfunction "set" with an argument y. 
                x <<- y # it takes the vector and stores it a variable named x. 
                m <<- NULL # "<<-" allows the subfunction to alter the m variable
                # in the parent environment.
        }
        get <- function() x # subfunction that takes vector stored in x and returns it.
        setsolve <- function(solve) m <<- solve # this takes a matrix and passed into it and stores 
        #the inverse of a matrix in m, which is the cache.
        getsolve <- function() m # this gets the cache
        list(set = set, get = get, 
             setsolve = setsolve,
             getsolve = getsolve)
        
}

# The second function, cacheSolve, computes the inverse of the special matrix 
# returned by makeCacheMatrix function. 

cacheSolve <- function(x, ...) { # a function with an argument x.
        m <- x$getsolve () # returns the contents of the cache; and we place it into a local variable m.
        if(!is.null(m)) { # this checkes if the returned cache has anything in it..
                message("getting cached data") # we print the "getting cached data". 
                return(m) # return the cached inversed matrix.
        }
        data <- x$get() # Here we use get() subfunction to get the the matrix, 
        # and place it in a local variable "data".
        m <- solve (data, ...) # We next get the inverse of a matrix of the matrix in data 
        # and put it into local variable m. 
        x$setsolve(m) # We store the matrix inverse into cache.
        m # We return the matrix inverse.
}
