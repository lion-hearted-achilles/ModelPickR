##'
##' BackwardElim.
##'
##' A quick and dirty function for backward elimintation.
##'
##' This function takes a data set and creates a series of linear models
##' using backward elimination with the intention of creating the best n
##' models where n is equal to the number of predictor variables.
##'
##' @param data a dataframe to be used for modelling.
##'
##' @param response a string representing the name of the response
##'                 variable (must exactly match that column name).
##'
##' @param makeModels a boolean that determines whether or not this function
##'        leaves all the models it makes in your workspace or not.
##'        \code{TRUE} by default.
##'
##' @param suppressOutput a boolean that you can use to stop the program
##'        from blowin' up yo console... \code{FALSE} by default.
##'
##'
##' @return a list of linear models, all the best found while using
##'         backward elimination! Unless makeModels is equal to 
##'         \code{FALSE} then it returns nothing.
##' 
##' @author Ben Clark
##' 

BackwardElim <- function(data, response,
                         makeModels = TRUE, suppressOutput = FALSE) {

  ## First thing's first, let's make sure the input data is aight!
  stopifnot(is.data.frame(data),
            response %in% names(data))
      # Add some more checks here :/ TODO!!!




  ## I guess I'll do this recursively... It seems intuitive, but
  ## could probably benefit from an efficiency boost?
  recursiveEliminator <- function(subData, n, models) {

    ## First we have to build the formula for model building... UGH!
    fmla <- as.formula(
      paste(response, '~',
            paste(names(subData[,!(names(subData) %in% response)]),
                  collapse = '+'),
            sep = ' '))

    ## First we build a model with that data.
    fit <- lm(fmla, data = subData)

    ## And we'll print that if the user wants...
    if(!suppressOutput)
      print(summary(fit))

    ## Now we'll record that info
    models[[n]] <- fit

    ## Now let's see what the least significant variable is...
    ##  This line gives the least important coefficient as a string.
    coef.vec <- summary(fit)$coefficients
    kill.me <- names(which.max(coef.vec[,4]))

    ## Now to build a model without that variable... hm...
    new.data <- subData[,!(names(subData) %in% c(kill.me, "(Intercept)"))]

    ## And here's that nifty recursion stuff!
    n <- (n - 1)   # I know that looks bad, leave me alone!
    if (n > 1) {
      recursiveEliminator(new.data, n, models)
    } #endif

    else { return(models) }

  } # end of recursiveEliminator






  ## Now let's get down to it!
  ## We'll build the full model first for a baseline...

  ## n will be the number of models we're building
  ##    a.k.a. the number of predictor variables present...
  k <- length(names(data)) - 1

  ## models will be a vector containing all the models...
  mods <- list()
  length(mods) <- k

  ## Here's the base case for the recursion!
  output <- recursiveEliminator(data, k, mods)
  output <- output[-1]

  ## And we'll return all those models for now!
  if (makeModels)
    return(output)
}
