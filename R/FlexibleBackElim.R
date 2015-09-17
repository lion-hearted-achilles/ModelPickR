##'
##' Flexible Backward Elimination.
##' 
##' Backward Elimination Based on User's Evaluation Criterion.
##' 
##' This function performs backward elimination based on a user-provided
##' model fitness evaluation criterion. So this is a slightly more robust
##' version of the existing BackwardElim function.This is probably the more
##' traditional version of Backward Elimination, so it's likely going to be
##' more useful than my previous version.
##' 
##' @param data like always, it's a data frame containing your data.
##' 
##' @param response a string naming the response variable exactly as
##'                 the name appears in the header of the data.
##' 
##' @param evalType a string containing either 'Ar2', 'AIC', or 'BIC'
##'                 corresponding to the evaluation criterion you'd 
##'                 like to use when evaluating model fitness,
##'                 defaults to \code{Adjusted R^2}, 'Ar2'.
##' 
##' @param makeModels a boolean that determines whether or not this function
##'        leaves all the models it makes in your workspace or not.
##'        \code{TRUE} by default.
##'
##' @param suppressOutput a boolean that you can use to stop the program
##'        from blowin' up yo console. \code{FALSE} by default.
##'
##'
##' @return a list of linear models, all the best found while using
##'         backward elimination! Unless makeModels is equal to 
##'         \code{FALSE} then it returns nothing.
##' 
##' @author Ben Clark
##' 

FlexibleBackElim <- function(data, response, evalType = 'Ar2',
                             makeModels = TRUE, suppressOutput = FALSE) {
  
  ## First thing's first, let's make sure the input data is aight!
  stopifnot(is.data.frame(data),
            response %in% names(data),
            evalType %in% c('Ar2', 'AIC', 'BIC'))
  # Add some more checks here :/ TODO!!!
  
  
}