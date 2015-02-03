rm(list = ls(all = TRUE)) # clear the workspace

# Figure 8A approximation
eightAapprox <- aKMajorityRuleSimulation(folderName="Figure8A", 
                                   numberOfIterations=500, 
                                   groupSize=c(50,30,20),
                                   utilityDistribution=c("normal","normal","normal"), 
                                   utilityDistributionParameters=c(-.5,.2,0,.2,.1,.2), 
                                   errorDistribution=c("normal","normal","normal"), 
                                   errorDistributionParameters=c(0,.3,0,.3,0,.3), 
                                   groupPostFailingProposalMeanUiIncrease=c("-.1/r",".1/r",".1/r"),
                                   maximumNumberOfProposalsInASeries=1000, 
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

rm(eightAapprox)