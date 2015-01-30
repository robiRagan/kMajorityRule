#-----------------------------------------------------------------------------------------------------------
#' drawNormalValues
#' Draws ui or ei values from N(groupMean, groupStandardDeviation).
#' @param sizeOfDraw The number of elements that need to be drawn.
#' @param groupMean The mean of the normal distribution used to draw ui or ei for a group.
#' @param groupStandardDeviation The standard deviation of the normal distributuion used to draw ui or ei for a group.

drawNormalValues <- function(sizeOfDraw,groupMean,groupStandardDeviation){
  if (groupStandardDeviation < 0){stop("The standard deviation provided for the NORMAL distribution is: ",groupStandardDeviation,".\n  The standard deviation must be >= 0")}
  #  set.seed(100) # Keep off except for testing
  oneGroupValues <-rnorm(sizeOfDraw,groupMean,groupStandardDeviation) # Takes the random sample from a normal.
} # ends the function