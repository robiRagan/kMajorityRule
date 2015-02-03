#' iterations
#' 
#' Runs numberOfIterations of seriesOfProposals() with the same set of initial parameters. Stores all of the input parameters, generated values and output for further analysis.
#' @template param_genGroupLevelDataframe
#' @template param_iterations
#' @return A list of objects expectedUtility, expectedCosts, rounds, allGroups, allVoters, allYeas, allPassesForWhich, theInputParameters.
#'  @export

iterations <- function( numberOfIterations,          
                        groupSize,                 
                        utilityDistribution,    
                        utilityDistributionParameters,
                        errorDistribution,
                        errorDistributionParameters,
                        groupPostFailingProposalMeanUiIncrease,
                        maximumNumberOfProposalsInASeries,
                        perProposalDecisionCost,
                        silentSeries,
                        silentIterations){
  
  numberOfVoters <- sum(groupSize)
  # The iterations storage containers that will store the user input, generated values and the output.
  inputParameters <- list(numberOfIterations=numberOfIterations,groupSize=groupSize,utilityDistribution=utilityDistribution,utilityDistributionParameters=utilityDistributionParameters,errorDistribution=errorDistribution,errorDistributionParameters=errorDistributionParameters,groupPostFailingProposalMeanUiIncrease=groupPostFailingProposalMeanUiIncrease, maximumNumberOfProposalsInASeries=maximumNumberOfProposalsInASeries,perProposalDecisionCost=perProposalDecisionCost)
  
  votersFromEachIteration <- vector(mode="list", length=numberOfIterations)
  groupsFromEachIteration <- vector(mode="list", length=numberOfIterations)
  yeasEachRoundEachIteration <-  list()
  passesForWhichKMajorityEachIteration <- list()
  kMajorityFailedToPassParetoPrefByRoundEachIteration <- list()
  numberOfProposalsConsideredEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  roundProposalPassedEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  
  typicalVotersExternalCostEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  bestOffGroupsMeanExternalCostEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  worstOffGroupsMeanExternalCostEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  
  typicalVotersExpectedUtilityEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  bestOffGroupsMeanExpectedUtilityEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  worstOffGroupsMeanExpectedUtilityEachIteration <- matrix(NA,numberOfIterations,numberOfVoters)
  
  for (j in 1:numberOfIterations){ # Begins the iterations loop
    # STEP 1: Create the groups for the voters to be a part of.
    oneIterationsGroups <- genGroupLevelDataFrame(groupSize=groupSize,utilityDistribution=utilityDistribution,utilityDistributionParameters=utilityDistributionParameters,errorDistribution=errorDistribution,errorDistributionParameters=errorDistributionParameters,groupPostFailingProposalMeanUiIncrease=groupPostFailingProposalMeanUiIncrease)
    # STEP 2: Generate the voters with ui and ei
    oneIterationsVoters <- genVoterLevelDataFrame(groupDataFrame=oneIterationsGroups)
    # STEP 3: Run the series of votes (multiple rounds of voting)
    seriesOutput <- seriesOfProposals(oneIterationsVoters=oneIterationsVoters,oneIterationsGroups=oneIterationsGroups,maximumNumberOfProposalsInASeries=maximumNumberOfProposalsInASeries,silentSeries=silentSeries,iterationNumber=j)
    
    # STEP 4: Store the output from the jth iteration.
    votersFromEachIteration[[j]] <- oneIterationsVoters                 # Store the voters dataframe.
    
    groupsFromEachIteration[[j]] <- oneIterationsGroups                 # Store the groups dataframe.
    
    yeasEachRoundEachIteration[[j]] <- seriesOutput$yeasEachRound                                  # Store the number of yeas.
    passesForWhichKMajorityEachIteration[[j]] <- seriesOutput$passesForWhichKMajorityEachRound       # Store which kMajority the proposal passes for in this iteration.
    kMajorityFailedToPassParetoPrefByRoundEachIteration[[j]] <- seriesOutput$kMajoritiesThatFailedToPassParetoPrefEachRound
    roundProposalPassedEachIteration[j,] <- seriesOutput$roundTheProposalPassed # Store the rounds that the proposals passed for an iteration.
    numberOfProposalsConsideredEachIteration[j,] <- seriesOutput$numberOfProposalsConsidered # Store the rounds that the proposals passed for an iteration.

    typicalVotersExternalCostEachIteration[j,] <- seriesOutput$typicalVotersExternalCostOut            # Store the mean voter's external cost
    bestOffGroupsMeanExternalCostEachIteration[j,] <- seriesOutput$bestOffGroupsMeanExternalCostOut    # Store the highest group mean.
    worstOffGroupsMeanExternalCostEachIteration[j,] <- seriesOutput$worstOffGroupsMeanExternalCostOut  # Store the lowest group mean.
    
    typicalVotersExpectedUtilityEachIteration[j,] <- seriesOutput$typicalVotersExpectedUtilityOut          # Store the mean voter's Expected Utility
    bestOffGroupsMeanExpectedUtilityEachIteration[j,] <- seriesOutput$bestOffGroupsMeanExpectedUtilityOut  # Store the highest group mean.
    worstOffGroupsMeanExpectedUtilityEachIteration[j,] <- seriesOutput$worstOffGroupsMeanExpectedUtilityOut # Store the lowest group mean.
    
    if (silentIterations==FALSE){    
      cat("\n============================\n iteration ",j, " is complete. \n============================\n\n", sep = "")
    }   
  } # Ends the iterations loop
  
  
  # Calculate Summaries of the iterations.
  meanRoundProposalPassedEachIteration <- apply(roundProposalPassedEachIteration,2,mean)
  meanNumberOfProposalsConsideredEachIteration <- apply(numberOfProposalsConsideredEachIteration,2,mean)
  sumOfProposalsConsideredAcrossAllIterations <- colSums(numberOfProposalsConsideredEachIteration)
  
  numberOfRoundsAkMajoritiesFailedToPassParetoAllIterations <- t(sapply(kMajorityFailedToPassParetoPrefByRoundEachIteration,colSums))
  sumOfRoundsAkMajoritiesFailedToPassParetoAcrossAllIterations <- colSums(numberOfRoundsAkMajoritiesFailedToPassParetoAllIterations)
  proportionOfRoundsParetoPrefFailedAllIterations <- sumOfRoundsAkMajoritiesFailedToPassParetoAcrossAllIterations/sumOfProposalsConsideredAcrossAllIterations
  
  meanOfMeanVotersExternalCostEachIteration <- colMeans(typicalVotersExternalCostEachIteration)
  meanOfbestOffGroupsMeanExternalCostEachIteration <- colMeans(bestOffGroupsMeanExternalCostEachIteration)
  meanOfworstOffGroupsMeanExternalCostEachIteration <- colMeans(worstOffGroupsMeanExternalCostEachIteration)
  
  externalCostOutput <- data.frame(meanOfMeanVotersExternalCostEachIteration, meanOfbestOffGroupsMeanExternalCostEachIteration, meanOfworstOffGroupsMeanExternalCostEachIteration)
  
  
  
  meanOfMeanVotersExpectedUtilityEachIteration <- colMeans(typicalVotersExpectedUtilityEachIteration)
  meanOfbestOffGroupsMeanExpectedUtilityEachIteration <- colMeans(bestOffGroupsMeanExpectedUtilityEachIteration)
  meanOfworstOffGroupsMeanExpectedUtilityEachIteration <- colMeans(worstOffGroupsMeanExpectedUtilityEachIteration)
  
  expectedUtilityOutput <- data.frame(meanOfMeanVotersExpectedUtilityEachIteration, meanOfbestOffGroupsMeanExpectedUtilityEachIteration, meanOfworstOffGroupsMeanExpectedUtilityEachIteration)
  
  
  roundsOutput <- data.frame(meanRoundProposalPassedEachIteration=meanRoundProposalPassedEachIteration, meanNumberOfProposalsConsideredEachIteration=meanNumberOfProposalsConsideredEachIteration)
  
  list(expectedUtility = expectedUtilityOutput, externalCost = externalCostOutput, rounds = roundsOutput, allGroups=groupsFromEachIteration, allVoters=votersFromEachIteration, allYeas=yeasEachRoundEachIteration, allPassesForWhich=passesForWhichKMajorityEachIteration, theInputParameters=inputParameters, proportionParetoFailures=proportionOfRoundsParetoPrefFailedAllIterations) # This outputs all of the stored objects as a list.
}   ######   Ends the iterations function
