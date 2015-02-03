rm(list = ls(all = TRUE)) # clear the workspace


# Figure 7B
sevenB <- aKMajorityRuleSimulation(folderName="Figure7B", 
                                   numberOfIterations=1000, 
                                   groupSize=c(35,30,35),
                                   utilityDistribution=c("normal","normal","normal"), 
                                   utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2), 
                                   errorDistribution=c("normal","normal","normal"), 
                                   errorDistributionParameters=c(0,.3,0,.3,0,.3), 
                                   groupPostFailingProposalMeanUiIncrease=c(".1/r",".1/r",".1/r"),
                                   maximumNumberOfProposalsInASeries=FALSE, 
                                   perProposalDecisionCost=.1, 
                                   outputTo=getwd(),
                                   silentSeries=TRUE,
                                   silentIterations=FALSE,
                                   writeCSV=FALSE,
                                   writeRObjects=FALSE,
                                   plotExternalCostTotalCosts=FALSE,
                                   plotExpectedUtilityTotalCosts=TRUE,
                                   plotOnlyExternalCost=FALSE,
                                   plotOnlyExpectedUtility=FALSE,
                                   plotNumberOfRounds=FALSE,
                                   plotPareto=FALSE,
                                   printOutputToScreen=TRUE)
rm(sevenB)