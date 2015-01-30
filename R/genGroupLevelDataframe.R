#' genGroupLevelDataframe
#' 
#' Creates a data.frame to hold the group level data for the simulation.
#' 
#' @template param_genGroupLevelDataframe
#' 
#' @return groupsDataFrame: A dataframe with G rows, containing the following columns: groupID, utilityDistribution, utilityDistributionParam1, utilityDistributionParam2, errorDistribution, errorDistributionParam1, errorDistributionParam2, groupPostFailingProposalMeanUiIncrease. 

genGroupLevelDataFrame <- function(groupSize,utilityDistribution,utilityDistributionParameters,errorDistribution,errorDistributionParameters,groupPostFailingProposalMeanUiIncrease){
  numberOfGroups <- length(groupSize) 
  if (numberOfGroups*2 != length(utilityDistributionParameters)){stop("The provided parameter `utilityDistributionParameters` should contain ", numberOfGroups*2," elements.\n  You provided ",length(utilityDistributionParameters)," elements.")}
  if (numberOfGroups*2 != length(errorDistributionParameters)){stop("The provided parameter `errorDistributionParameters` should contain ", numberOfGroups*2," elements.\n  You provided ",length(errorDistributionParameters)," elements.")}
  if (numberOfGroups != length(groupPostFailingProposalMeanUiIncrease)){stop("The provided parameter `groupPostFailingProposalMeanUiIncrease` should contain ", numberOfGroups," elements.\n  You provided ",length(groupPostFailingProposalMeanUiIncrease)," elements.")}
  
  utilityDistributionParam1 <- matrix(utilityDistributionParameters, nrow=numberOfGroups, ncol=2, byrow=TRUE)[,1]
  utilityDistributionParam2 <- matrix(utilityDistributionParameters, nrow=numberOfGroups, ncol=2, byrow=TRUE)[,2]
  errorDistributionParam1 <- matrix(errorDistributionParameters, nrow=numberOfGroups, ncol=2, byrow=TRUE)[,1]
  errorDistributionParam2 <- matrix(errorDistributionParameters, nrow=numberOfGroups, ncol=2, byrow=TRUE)[,2]
 
  groupDataFrame <- data.frame(groupID=seq(1:numberOfGroups),groupSize=groupSize,utilityDistribution=utilityDistribution, utilityDistributionParam1=utilityDistributionParam1, utilityDistributionParam2=utilityDistributionParam2,errorDistribution=errorDistribution, errorDistributionParam1=errorDistributionParam1, errorDistributionParam2=errorDistributionParam2,groupPostFailingProposalMeanUiIncrease=groupPostFailingProposalMeanUiIncrease)
  
  groupDataFrame
}
