
rm(list = ls(all = TRUE)) # clear the workspace




# Figure 4D
          aKMajorityRuleSimulation(folderName="Figure4D", 
                                  numberOfIterations=1000, 
                                  groupSize=c(35,30,35),
                                  utilityDistribution=c("normal","normal","normal"), 
                                  utilityDistributionParameters=c(-.5,.2,0,.2,.1,.2), 
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


