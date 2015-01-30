rm(list = ls(all = TRUE)) # clear the workspace



# Figure 7A
        aKMajorityRuleSimulation(folderName="Figure7A", 
                                 numberOfIterations=1000, 
                                 groupSize=c(35,30,35),
                                 utilityDistribution=c("normal","normal","normal"), 
                                 utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2), 
                                 errorDistribution=c("normal","normal","normal"), 
                                 errorDistributionParameters=c(0,.3,0,.3,0,.3), 
                                 groupPostFailingProposalMeanUiIncrease=c(".1",".1",".1"),
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
