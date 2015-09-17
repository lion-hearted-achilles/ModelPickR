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
##'

ForwardSelect <- function(data, response,
                          makeModels = TRUE, suppressOutput = FALSE) {

  ## Just a few little pre-checks here...
  stopifnot(is.data.frame(data),
            response %in% names(data))   # TODO !!! Add to this...

  recursiveForwardSelector <- function(data, n, max, models) {

    ## Recursive Base Case!
    if (n > max)
      return(models)

    ## Otherwise we'll just keep trucking...


  }

}
