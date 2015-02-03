rm(list = ls(all = TRUE)) # clear the workspace

# Figure 8B
eightB <- aKMajorityRuleSimulation(folderName="Figure8B", 
                                   numberOfIterations=1000, 
                                   groupSize=c(3,10),
                                   utilityDistribution=c("normal","normal"), 
                                   utilityDistributionParameters=c(-.8,.2,.7,.2), 
                                   errorDistribution=c("normal","normal"), 
                                   errorDistributionParameters=c(0,.3,0,.3), 
                                   groupPostFailingProposalMeanUiIncrease=c(".05","-.01"),
                                   maximumNumberOfProposalsInASeries=10000, 
                                   perProposalDecisionCost=.01, 
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

rm(eightB)
