##'
##' K-Fold Cross Validation
##'
##' K-Fold Cross Validation for Linear Models.
##'
##' This is a really primitive funciton for calculating Mean Squared
##' Prediction Error (MSPE) for K-Fold Cross Validation of Linear
##' Models. Pretty rudimentary...
##'
##' @param data a data frame containing the observations for modelling.
##'
##' @param formula an R 'formula' object to determine the linear model
##'                to be constructed.
##'
##' @param k the number of folds to use. Defaults to 4.
##'
##' @return a number, specifically the mean squared prediction error
##'         for the cross validated sub-samples made by the K-Fold
##'         Cross Validation algorithm.
##'
##'

kFoldCV <- function(data, formula, k = 4) {

  ## Some simple input checks...
  stopifnot(is.data.frame(data),
            class(formula) == 'formula',
            is.double(k))             # TODO !!! Make this more robust!

  ## And let's find the response variable, since we'll need that.
  response <- as.character(formula[[2]])

  ## Now to do the splitting... Hm...
  n <- as.double(length(data[,1]))
  group.size <- round((n / k), digits = 0)

  ## I'll make a list of the indices of each group...? Yes?
  groups <- list()
  length(groups) <- k


  ## Here's the big splitting thing...
  for (i in 1:k) {

    ## if this is our first subset, then there's nothing to exclude!
    if (i == 1) {
      fold <- sample(x = 1:n, size = group.size)
    }

    ## Then we check for the final case... That last group is weird.
    else if (i == k) {
      used <- unlist(groups)
      total <- 1:n
      fold <- total[-used]
    }

    ## Otherwise I'll have to do some trickery...
    else {
      used <- unlist(groups)
      total <- 1:n
      sample.space <- total[-used]
      fold <- sample(x = sample.space, size = group.size)
    }

    ## Lastly, we'll add that fold to our collection
    groups[[i]] <- fold
  }



  ## Now we'll actually evaluate some Mean Squared Error.
  total.squared.error <- 0

  for (i in 1:k) {

    ## Make a model using all but this subset...
    exclude <- groups[[i]]
    data.tr <- data[-exclude,]
    data.te <- data[exclude,]
    fit <- lm(formula, data = data.tr)

    ## Now we'll calculate the total squared error...
    pred <- predict(fit, data.te)
    error <- data.te[,response] - pred
    squared.error <- sum(error ^ 2)

    ## Now we add that error to the total
    total.squared.error <- total.squared.error + squared.error
  }

  ## Now we'll just make the total into an average and voila!
  output <- total.squared.error / n
  return(output)


}
