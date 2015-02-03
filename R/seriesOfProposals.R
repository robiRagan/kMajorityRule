#' seriesOfProposals()
#' 
#' Runs a series of votes/multiple alternatives following a follows a ???successive??? voting procedure. Stores all of the input parameters, generated values and output for further analysis.
#' In a successive procedure, the initial status quo q1 is paired against a proposal x1 in round 1. If x1 passes, voting ends. If x1 fails, q1 is paired against x2 in round 2, and so on for a total of R rounds (see Figure 5 in the paper). In a standard successive procedure, voting continues until the proposal passes or a speciific round R is reached and the proposal either passes or fails. In our study, voting continues until the proposal eventually passes, which we assure by improving the popularity of proposals in successive rounds. We also examine a few cases where some individuals are made better off and others are made worse off as the series proceeds. Continually improving proposals can be modeled in several ways. We assume that the expected utility of a group increases by an increment, groupPostFailingProposalMeanUiIncrease (alpha_gr in the paper), each round a proposal does not pass. The fnal round, R may result from a limitation in the number of proposals or a time limit, etc. To keep the analysis of decision costs simple, we assume each round imposes the same decision costs on all members of the assembly, c > 0. Voting rules which require many rounds to pass a proposal will generate more decision costs than voting rules which require few rounds.
#' @param oneIterationsVoters A dataframe created by genVoterLevelDataFrame(). Each row represents a voter and the columns are groupID, ui, ei.
#' @param oneIterationsGroups A dataframe created by genGroupLevelDataFrame. Each row represents a group and the columns are groupID, ui and ei.
#' @param maximumNumberOfProposalsInASeries An integer or FALSE. If an integer, it represents the maximum possible number of proposals considered by a group of voters. Note though, that even if if maximumNumberOfProposalsInASeries is set to an integer, that voting will still stop if a proposal passes for all k-majority rules being considerd. To allow the series of proposals to anly stop once all k-majority Rules have passes a proposal, set maximumNumberOfProposalsInASeries=FALSE. 
#' @param silentSeries FALSE prints notifications to the console as each series finishes. TRUE silences the notifications.
#' @param iterationNumber the current iteration number taken from iterations().
#' @return A list of objects: votersValuesFromEachRound, yeasEachRound, passesForWhichKMajorityEachRound, roundTheProposalPassed, numberOfProposalsConsidered, typicalVotersExternalCostOut, bestOffGroupsMeanExternalCostOut, worstOffGroupsMeanExternalCostOut)
#' @export

seriesOfProposals <- function(oneIterationsVoters, oneIterationsGroups, maximumNumberOfProposalsInASeries, silentSeries, iterationNumber){
  numberOfVoters <- nrow(oneIterationsVoters)
  # The series storage containers that will store the user input, generated values and the output.
  votersValuesFromEachRound <- list()
  yeasEachRound <- list()
  passesForWhichKMajorityEachRound <- list()
  typicalVotersTotalWelfareEachRound <- list()
  typicalVotersExpectedUtilityEachRound <- list()
  bestOffGroupsMeanExpectedUtilityEachRound <- list()
  worstOffGroupsMeanExpectedUtilityEachRound <- list()
  typicalVotersExternalCostEachRound <- list()
  bestOffGroupsMeanExternalCostEachRound <- list()
  worstOffGroupsMeanExternalCostEachRound <- list()
  proposalParetoPreferedEachRound <- list()
  proposalFailsForWhichKMajorityEachRound <- list()
  kMajoritiesThatFailedToPassParetoPrefEachRound <- list()
  passesForWhichKMaj <- rep(0,numberOfVoters)
  passedBeforeThisRoundForThisK <- rep(0,numberOfVoters)
  
  r <- 0 # round counter
  while(min(passesForWhichKMaj)==0 & (maximumNumberOfProposalsInASeries==FALSE | r<maximumNumberOfProposalsInASeries)){ # Begins the series of proposals loop
    r <- r+1
    # STEP 1: Calculate the utility plus error for each voter, externalCost, and expectedUtility and store in the dataframe.
    oneIterationsVoters$utilityWithError <- rowSums(cbind(oneIterationsVoters$ui,oneIterationsVoters$ei))
    oneIterationsVoters$externalCost <- ifelse(oneIterationsVoters$ui > 0,0,-oneIterationsVoters$ui)
    oneIterationsVoters$expectedUtility <- oneIterationsVoters$ui 
    # STEP 2: Probability of Voting: The probability a voter votes yes is recorded as 1 if their utility with error is > 0. It is recorded as zero if utility with error is <= to 0.  This proabability is recorded in the data frame for each set of voters.
    oneIterationsVoters$probabilityVoteYea <- ifelse(oneIterationsVoters$utilityWithError>0,1,0)
    # STEP 3: Sum up the probabilities.
    numberYeasThisRound <- sum(oneIterationsVoters$probabilityVoteYea)
    # STEP 4: Determine if there is a simple majority for each k-majority this round, or that a proposal passed before this round.
    passesForWhichKMaj <- ifelse(((numberYeasThisRound >= c(1:nrow(oneIterationsVoters))) | passedBeforeThisRoundForThisK==1),1,0)
    # STEP 5: Find the mean of each group's external cost and expected utility.
    # tapply() runs the mean() function on the ui, for each groupID. 
    # unlist() simply turns the list returned by tapply() into a simple vector.
    groupExternalCostMeans <- unlist(tapply(oneIterationsVoters$externalCost, oneIterationsVoters$groupID, mean, simplify=FALSE))
    groupExpectedUtilityMeans <- unlist(tapply(oneIterationsVoters$expectedUtility, oneIterationsVoters$groupID, mean, simplify=FALSE))
    
    # STEP 6: Calculate the relavent external cost measures for each k-majority: 
    # The external cost of each voter is calculated in the following way.
    # If a proposal passes at the kMajority:
    #   - Voters with a positive u_i have no loss.
    #   - Voters with a negative u_i, recieve a loss equal |u_i|.
    # If a proposal fails at the kMajority:
    #   - Yea voters have no loss.
    #   - Nay voters recieve have no loss.
    # The expected cost is calculated and stored for each of the following voters.
    #   - typical voter (mean of all ui)
    #   - highest group mean's mean.
    #   - lowest group mean's mean.
    meanVoterExternalCost <- ifelse(passesForWhichKMaj==1, mean(oneIterationsVoters$externalCost),0) # the mean voter's utility.
    bestOffGroupsMeanExternalCost <- ifelse(passesForWhichKMaj==1, min(groupExternalCostMeans),0) # For k-majority Rules that passed a proposal, store the mean EC for the best off group.
    worstOffGroupsMeanExternalCost <- ifelse(passesForWhichKMaj==1, max(groupExternalCostMeans),0) # For k-majority Rules that passed a proposal, store the mean EC for the worst off group.
    
    # STEP 7: Calculate the relavent expected utility measures for each k-majority: 
    # The expected utility of each voter is calculated in the following way.
    # If a proposal passes at the kMajority:
    #   - Voters recieve utility equal to thier u_i.
    # If a proposal fails at the kMajority:
    #   - Yea voters have no gain or loss.
    #   - Nay voters recieve have no gain or loss.
    # The expected utility is calculated and stored for each of the following voters.
    #   - typical voter (mean of all ui)
    #   - highest group mean's mean.
    #   - lowest group mean's mean.
    meanVoterExpectedUtility <- ifelse(passesForWhichKMaj==1, mean(oneIterationsVoters$expectedUtility),0) # the mean voter's utility.
    bestOffGroupsMeanExpectedUtility <- ifelse(passesForWhichKMaj==1, max(groupExpectedUtilityMeans),0) # For k-majority Rules that passed a proposal, store the mean EU for the best off group.
    worstOffGroupsMeanExpectedUtility <- ifelse(passesForWhichKMaj==1, min(groupExpectedUtilityMeans),0) # For k-majority Rules that passed a proposal, store the mean EU for the worst off group.
    
    
    # STEP 8
    # Record the number of rounds in which a Pareto prefered proposal was defeated.
    # determine if preferences indicate the proposal is Pareto prefered in each round.
    proposalParetoPrefered <-ifelse(sum(oneIterationsVoters$ui>0)==numberOfVoters,1,0) # Check if everyone has positive utility. If so the proposal is Pareto Preffered to the SQ
    # determine if the proposal failed
    proposalFailsForWhichKMajority <- ifelse(passesForWhichKMaj==0, 1, 0)
    # determine if proposal failed for a k-majority and was Pareto preferred.
    paretoPreferedFailedThisKMaj <- ifelse(proposalParetoPrefered==1 & passesForWhichKMaj==0,1,0)
    
    
    # STEP 9: Store the output from the rth round in the series.
    votersValuesFromEachRound[[r]] <- oneIterationsVoters
    yeasEachRound[[r]] <- numberYeasThisRound                                  # Store the number of yeas this round.
    passesForWhichKMajorityEachRound[[r]] <- passesForWhichKMaj      # Store which kMajority the proposal passes for in this iteration.
    proposalFailsForWhichKMajorityEachRound[[r]] <- proposalFailsForWhichKMajority
    proposalParetoPreferedEachRound[[r]] <- proposalParetoPrefered
    
    typicalVotersExternalCostEachRound[[r]] <- meanVoterExternalCost              # Store the mean voter's external cost. .
    bestOffGroupsMeanExternalCostEachRound[[r]] <- bestOffGroupsMeanExternalCost # Store the highest group mean.
    worstOffGroupsMeanExternalCostEachRound[[r]] <- worstOffGroupsMeanExternalCost  # Store the lowest group mean.
    
    typicalVotersExpectedUtilityEachRound[[r]] <- meanVoterExpectedUtility              # Store the mean voter's expected utility
    bestOffGroupsMeanExpectedUtilityEachRound[[r]] <- bestOffGroupsMeanExpectedUtility # Store the highest group mean.
    worstOffGroupsMeanExpectedUtilityEachRound[[r]] <- worstOffGroupsMeanExpectedUtility  # Store the lowest group mean.
    kMajoritiesThatFailedToPassParetoPrefEachRound[[r]] <- paretoPreferedFailedThisKMaj # Store which kMajorities failed to pass pareto prefered proposals.
    
    if (silentSeries==FALSE){
      cat("   [Iteration ",iterationNumber,"]  (The vote on the proposal in round ",r, " is complete. kMajorities that passed proposal: ",sum(passesForWhichKMaj),")\n", sep = "") # A counter that prints to the console.
    }
    
    
    # STEP 11 add the groupPostFailingProposalMeanUiIncrease to the mean used to draw the voters in the previous round.
    for(g in 1:nrow(oneIterationsGroups)){
      aGroupsIncrease <- as.vector(oneIterationsGroups$groupPostFailingProposalMeanUiIncrease[g])
      oneIterationsGroups$utilityDistributionParam1[g] <- oneIterationsGroups$utilityDistributionParam1[g] + eval(parse(text=aGroupsIncrease))
    }
    
    
    # STEP 12
    # Update the voters data frame with new utility values based on the increased group means
    oneIterationsVoters <- updateVoterLevelDataFrame(oneIterationsVoters,oneIterationsGroups)
    
    
    
    
    # STEP 13
    # Update the passedBeforeThisRoundForThisK indicator vector for use in the next round/loop.
    passedBeforeThisRoundForThisK <- ifelse(passesForWhichKMaj==1 | passedBeforeThisRoundForThisK==1,1,0)
    
  } # Ends the series of proposals loop ###
  
  
  
  # Reshape some of the lists entries into the most simple object possible.
  yeasEachRoundOut <- as.vector(unlist(yeasEachRound))              
  
  passesForWhichKMajorityEachRoundOut <- matrix(unlist(passesForWhichKMajorityEachRound),r,numberOfVoters,byrow=TRUE)
  typicalVotersExternalCostEachRoundAll <- matrix(unlist(typicalVotersExternalCostEachRound),r,numberOfVoters,byrow=TRUE)            
  bestOffGroupsMeanExternalCostEachRoundAll <-  matrix(unlist(bestOffGroupsMeanExternalCostEachRound),r,numberOfVoters,byrow=TRUE) 
  worstOffGroupsMeanExternalCostEachRoundAll <-  matrix(unlist(worstOffGroupsMeanExternalCostEachRound),r,numberOfVoters,byrow=TRUE)
  
  typicalVotersExpectedUtilityEachRoundAll <- matrix(unlist(typicalVotersExpectedUtilityEachRound),r,numberOfVoters,byrow=TRUE)            
  bestOffGroupsMeanExpectedUtilityEachRoundAll <-  matrix(unlist(bestOffGroupsMeanExpectedUtilityEachRound),r,numberOfVoters,byrow=TRUE) 
  worstOffGroupsMeanExpectedUtilityEachRoundAll <-  matrix(unlist(worstOffGroupsMeanExpectedUtilityEachRound),r,numberOfVoters,byrow=TRUE)
  
  kMajoritiesThatFailedToPassParetoPrefEachRoundOut <-  matrix(unlist(kMajoritiesThatFailedToPassParetoPrefEachRound),r,numberOfVoters,byrow=TRUE)
  # Find the first round a proposal passed for each k-majority rule
  roundTheProposalPassed <- (nrow(passesForWhichKMajorityEachRoundOut)+1)-colSums(passesForWhichKMajorityEachRoundOut)
  # Correct roundTheProposalPassed for kMajorities that did not pass a proposal
  roundTheProposalPassed <- ifelse(roundTheProposalPassed>nrow(passesForWhichKMajorityEachRoundOut),0,roundTheProposalPassed)
  # Calculate the number of proposals considered.
  numberOfProposalsConsidered <- (nrow(passesForWhichKMajorityEachRoundOut)+1)-colSums(passesForWhichKMajorityEachRoundOut)
  # Correct for k-majorities that did not pass a proposal.
  numberOfProposalsConsidered <- ifelse(numberOfProposalsConsidered > r, r, numberOfProposalsConsidered)
  
  # Now pull out the external cost measures when the proposal passed for each k-majority
  typicalVotersExternalCostOut <- rep(NA,numberOfVoters)
  for (w in 1:numberOfVoters){
    if(roundTheProposalPassed[w]==0){
      typicalVotersExternalCostOut[w] <- 0
    } else {
      typicalVotersExternalCostOut[w] <- typicalVotersExternalCostEachRoundAll[roundTheProposalPassed[w],w]
    }
  }
  
  bestOffGroupsMeanExternalCostOut <- rep(NA,numberOfVoters)
  for (w in 1:numberOfVoters){
    if(roundTheProposalPassed[w]==0){
      bestOffGroupsMeanExternalCostOut[w] <- 0
    } else {
      bestOffGroupsMeanExternalCostOut[w] <- bestOffGroupsMeanExternalCostEachRoundAll[roundTheProposalPassed[w],w]
    }
  }
  
  worstOffGroupsMeanExternalCostOut <- rep(NA,numberOfVoters)
  for (w in 1:numberOfVoters){
    if(roundTheProposalPassed[w]==0){
      worstOffGroupsMeanExternalCostOut[w] <- 0
    } else {
      worstOffGroupsMeanExternalCostOut[w] <- worstOffGroupsMeanExternalCostEachRoundAll[roundTheProposalPassed[w],w]
    }
  }
  
  
  # Now pull out the external cost measures when the proposal passed for each k-majority
  typicalVotersExpectedUtilityOut <- rep(NA,numberOfVoters)
  for (w in 1:numberOfVoters){
    if(roundTheProposalPassed[w]==0){
      typicalVotersExpectedUtilityOut[w] <- 0
    } else {
      typicalVotersExpectedUtilityOut[w] <- typicalVotersExpectedUtilityEachRoundAll[roundTheProposalPassed[w],w]
    }
  }
  
  bestOffGroupsMeanExpectedUtilityOut <- rep(NA,numberOfVoters)
  for (w in 1:numberOfVoters){
    if(roundTheProposalPassed[w]==0){
      bestOffGroupsMeanExpectedUtilityOut[w] <- 0
    } else {
      bestOffGroupsMeanExpectedUtilityOut[w] <- bestOffGroupsMeanExpectedUtilityEachRoundAll[roundTheProposalPassed[w],w]
    }
  }
  
  worstOffGroupsMeanExpectedUtilityOut <- rep(NA,numberOfVoters)
  for (w in 1:numberOfVoters){
    if(roundTheProposalPassed[w]==0){
      worstOffGroupsMeanExpectedUtilityOut[w] <- 0
    } else {
      worstOffGroupsMeanExpectedUtilityOut[w] <- worstOffGroupsMeanExpectedUtilityEachRoundAll[roundTheProposalPassed[w],w]
    }
  }
  
  
  # Output the values  
  list(votersValuesFromEachRound=votersValuesFromEachRound, yeasEachRound=yeasEachRoundOut, passesForWhichKMajorityEachRound=passesForWhichKMajorityEachRoundOut, roundTheProposalPassed=roundTheProposalPassed, numberOfProposalsConsidered= numberOfProposalsConsidered, typicalVotersExternalCostOut=typicalVotersExternalCostOut, bestOffGroupsMeanExternalCostOut=bestOffGroupsMeanExternalCostOut, worstOffGroupsMeanExternalCostOut=worstOffGroupsMeanExternalCostOut, typicalVotersExpectedUtilityOut=typicalVotersExpectedUtilityOut, bestOffGroupsMeanExpectedUtilityOut=bestOffGroupsMeanExpectedUtilityOut, worstOffGroupsMeanExpectedUtilityOut=worstOffGroupsMeanExpectedUtilityOut, kMajoritiesThatFailedToPassParetoPrefEachRoundOut=kMajoritiesThatFailedToPassParetoPrefEachRoundOut)
  
}# Ends seriesOfProposals() Function  