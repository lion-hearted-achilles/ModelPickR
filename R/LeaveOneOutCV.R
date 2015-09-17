##'
##' Leave-One-Out Cross Validation.
##'
##' Calculate Leave-One-Out Cross Validation Mean Squared Error.
##'
##' This function just takes a data set and a linear model and calculates
##' the mean squared prediction error using the Leave-One-Out Cross Validation
##' algorithm.
##' 
##' Note to self, I used this algorithm and compared it to answers provided
##' to practice questions in my STAT406 course, and I got the same answers!
##' I think I trust this function thoroughly...
##'
##' @param data a dataframe containing the data you want to check your model.
##'             with.
##'
##' @param formula a 'formula' object that can be used to build linear models.
##'
##' @return a number (the MSE of the L.O.O. C.V.)
##' 
##' @author Ben Clark
##' 

LeaveOneOutCV <- function(data, formula) {

  ## First we'll just run a couple a couple of tests on the input
  stopifnot(class(formula) == 'formula',
                  is.data.frame(data))  #TODO !!! Add to this...

  ## We also need to know the response for future whatever...
  response <- as.character(formula[[2]])

  ## Let's see how much data we have...
  k <- as.double(length(data[,1]))


  ## Here's the real bread and butter...
  recursiveCrossValidator <- function(n, error) {

    ##Let's build a linear model!
    tempData <- data[-n,]
    tempFit <- lm(formula, data = tempData)

    ## Let's find the error
    pred <- as.double(predict(tempFit, data[n,]))
    squaredError <- (pred - data[n,response]) ^ 2

    ## Now we have to record that error
    error <- error + squaredError

    ## Now for the recursion part...
    n <- n - 1              # I know this is dorky, leave me alone!

    ## Either we'll go for another run,
    if (n > 0)
      recursiveCrossValidator(n, error)

    ## or we'll return the average
    else
      return(error / k)
  }


  ## Now we actually call the recursive stuff...
  output <- recursiveCrossValidator(k, 0)

  return(output)

}
