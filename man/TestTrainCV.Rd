% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/TestTrainCV.R
\name{TestTrainCV}
\alias{TestTrainCV}
\title{TestTrainCV.}
\usage{
TestTrainCV(data, formula, testSize = 10)
}
\arguments{
\item{data}{a dataframe with the data you want to examine.}

\item{formula}{an R 'formula' object that shows what variables to model.}

\item{testSize}{an integer giving the number of observations to be
                subsectioned into the test group. Defaults to 10.}
}
\value{
a number that shows the mean squared prediction error produced by
        the testing/training cross validation algorithm.
}
\description{
Calculates Mean Squared Error for Testing/Training Cross Validation.
}
\details{
This function splits your data set into two groups, forms a model with
one of them, and then makes a prediction on the other. The difference
between the predicted and observed values is squared and averaged.
}

