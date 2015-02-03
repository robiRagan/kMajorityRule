#' updateVoterLevelDataFrame
#' 
#' Takes an existing voter level data frame and a group level data frame that has had it's parameters changed and outputs a new voter level data frame.
#' @param oneIterationsVoters The existing voter level data frame that will be updated.
#' @param oneIterationsGroups The updated group level data frame that provides the values used to update the voter level data frame.
#' @return oneIterationsVoters The updated voter level data frame.
#' @export

updateVoterLevelDataFrame <- function(oneIterationsVoters,oneIterationsGroups){
  groupID <- NULL # hack to pass R CMD CHK
  numberOfGroups <- nrow(oneIterationsGroups)
  for (i in 1:numberOfGroups){    # This loop draws ui values
    aGroup <- subset(oneIterationsVoters,groupID==i)                      # First subset the data frame for group 
    sizeOfAGroup <- nrow(aGroup)                                   # determine the number of voters
    aGroupUtility <- drawNormalValues(oneIterationsGroups$groupSize[i],oneIterationsGroups$utilityDistributionParam1[i],oneIterationsGroups$utilityDistributionParam2[i])    # Draw the values from the normal.
    oneIterationsVoters$ui[oneIterationsVoters$groupID==i] <- aGroupUtility # Now place these utilities in the data frame
  } # Ends the ui draw loop 
  oneIterationsVoters
}
