##'
##' Forward Selection.
##'
##' Just a quick and dirty forward selection algorithm.
##'
##' This function just whips through your provided data and builds a series
##' of linear models selecting each new model from the previous using
##' forward selection. Nothing fancy.
##'
##' @param data a dataframe including the data you want to model.
##'
##' @param response a string denoting which variable is the response.
##'                 note: this must EXACTLY match the column's header.
##' 
##' @param evalType a string containing either 'Ar2', 'AIC', or 'BIC'
##'                 corresponding to the evaluation criterion you'd 
##'                 like to use when evaluating model fitness,
##'                 defaults to \code{Adjusted R^2}.
##'
##' @param makeModels a boolean that decides whether or to return all the
##'                   models in a list. \code{TRUE} by default.
##'
##' @param suppressOutput another boolean that decides whether or not
##'                       this function will blow up your console with
##'                       knowledge... \code{FALSE} by default.
##'
##' @return a list of 'lm' objects, or nothing, depending on the value
##'         passed to the argument makeModels.
##'
##' @author Ben Clark
##'

ForwardSelect <- function(data, response, evalType = 'Ar2',
                          makeModels = TRUE, suppressOutput = FALSE) {

  ## Just a few little pre-checks here...
  stopifnot(is.data.frame(data),
            response %in% names(data),
            evalType %in% c('Ar2', 'AIC', 'BIC'))   # TODO !!! Add to this...

  

}
