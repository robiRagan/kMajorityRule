rm(list = ls(all = TRUE)) # clear the workspace



# Figure 4C
fourC <- aKMajorityRuleSimulation(folderName="Figure4C", 
                                  numberOfIterations=1000, 
                                  groupSize=c(50,30,20),
                                  utilityDistribution=c("normal","normal","normal"), 
                                  utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2), 
                                  errorDistribution=c("normal","normal","normal"), 
                                  errorDistributionParameters=c(0,.3,0,.3,0,.3), 
                                  groupPostFailingProposalMeanUiIncrease=c("0","0","0"),
                                  maximumNumberOfProposalsInASeries=1, 
                                  perProposalDecisionCost=0, 
                                  outputTo=getwd(),
                                  silentSeries=TRUE,
                                  silentIterations=FALSE,
                                  writeCSV=FALSE,
                                  writeRObjects=FALSE,
                                  plotExternalCostTotalCosts=FALSE,
                                  plotExpectedUtilityTotalCosts=FALSE,
                                  plotOnlyExternalCost=TRUE,
                                  plotOnlyExpectedUtility=TRUE,
                                  plotNumberOfRounds=FALSE,
                                  plotPareto=FALSE,
                                  printOutputToScreen=TRUE)
rm(fourC)