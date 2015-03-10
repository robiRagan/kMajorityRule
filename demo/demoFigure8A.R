rm(list = ls(all = TRUE)) # clear the workspace

readline("Warning replicating this figure takes a very long time. To run an aproximation run `demo(demo8Aapprox)` \nType  <Return>\t to start :")

# Figure 8A
eightA <- aKMajorityRuleSimulation(folderName="Figure8A", 
                                   numberOfIterations=1000, 
                                   groupSize=c(50,30,20),
                                   utilityDistribution=c("normal","normal","normal"), 
                                   utilityDistributionParameters=c(-.5,.2,0,.2,.1,.2), 
                                   errorDistribution=c("normal","normal","normal"), 
                                   errorDistributionParameters=c(0,.3,0,.3,0,.3), 
                                   groupPostFailingProposalMeanUiIncrease=c("-.1/r",".1/r",".1/r"),
                                   maximumNumberOfProposalsInASeries=10000, 
                                   perProposalDecisionCost=.01, 
                                   outputTo=getwd(),
                                   silentSeries=TRUE,
                                   silentIterations=FALSE,
                                   writeCSV=FALSE,
                                   writeRObjects=FALSE,
                                   plotExternalCostTotalCosts=FALSE,
                                   plotExpectedUtilityDecCostTotalUtil=TRUE,
                                   plotOnlyExternalCost=FALSE,
                                   plotOnlyExpectedUtility=FALSE,
                                   plotNumberOfRounds=FALSE,
                                   plotPareto=FALSE,
                                   printOutputToScreen=TRUE)
rm(eightA)
