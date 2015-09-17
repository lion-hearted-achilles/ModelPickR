##'
##' TestTrainCV.
##'
##' Calculates Mean Squared Error for Testing/Training Cross Validation.
##'
##' This function splits your data set into two groups, forms a model with
##' one of them, and then makes a prediction on the other. The difference
##' between the predicted and observed values is squared and averaged.
##'
##' @param data a dataframe with the data you want to examine.
##'
##' @param formula an R 'formula' object that shows what variables to model.
##'
##' @param testSize an integer giving the number of observations to be
##'                 subsectioned into the test group. Defaults to 10.
##'
##' @return a number that shows the mean squared prediction error produced by
##'         the testing/training cross validation algorithm.
##'

TestTrainCV <- function(data, formula, testSize = 10) {

  ## First we'll just run a couple a couple of tests on the input
  stopifnot(class(formula) == 'formula',
            is.data.frame(data))  #TODO !!! Add to this...

  ## We also need to know the response for future whatever...
  response <- as.character(formula[[2]])

  ## Let's see how much data we have...
  n <- as.double(length(data[,1]))

  ## Now we'll do the randomized sampling bit...
  inds <- sample(x = 1:n, size = testSize)

  ## Now to actually do the subsectioning business.
  data.tr <- data[inds,]
  data.te <- data[-inds,]

  ## Now let's build that model.
  fit <- lm(formula, data.tr)

  ## And we'll compare the predictions to the observations.
  preds <- predict(fit, data.te)
  error <- preds - data.te[,response]
  MSE <- sum(error ^ 2) / n

  ## Lastly we'll just return that value... Super easy...
  return(MSE)
}
