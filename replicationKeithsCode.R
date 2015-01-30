#' Replicating Keith Graphs from initial Draft of 
#' - Version: 01.25.15


rm(list = ls(all = TRUE)) # clear the workspace





# Figure 4A
  aKMajorityRuleSimulation(folderName="Figure4A", 
                                       numberOfIterations=1000, 
                                       groupSize=c(35,30,35),
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









# Figure 4B
 aKMajorityRuleSimulation(folderName="Figure4B", 
                                  numberOfIterations=1000, 
                                  groupSize=c(20,30,50),
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






# Figure 4C
          aKMajorityRuleSimulation(folderName="Figure4C", 
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
# rm(fourC)


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



# Figure 6A
          aKMajorityRuleSimulation(folderName="Figure6A", 
                                  numberOfIterations=1000, 
                                  groupSize=c(35,30,35),
                                  utilityDistribution=c("normal","normal","normal"), 
                                  utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2), 
                                  errorDistribution=c("normal","normal","normal"), 
                                  errorDistributionParameters=c(0,.3,0,.3,0,.3), 
                                  groupPostFailingProposalMeanUiIncrease=c(".1",".1",".1"),
                                  maximumNumberOfProposalsInASeries=FALSE, 
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
# rm(sixA)

# Figure 6B
sixB <- aKMajorityRuleSimulation(folderName="Figure6B", 
                                 numberOfIterations=1000, 
                                 groupSize=c(35,30,35),
                                 utilityDistribution=c("normal","normal","normal"), 
                                 utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2), 
                                 errorDistribution=c("normal","normal","normal"), 
                                 errorDistributionParameters=c(0,.3,0,.3,0,.3), 
                                 groupPostFailingProposalMeanUiIncrease=c(".1/r",".1/r",".1/r"),
                                 maximumNumberOfProposalsInASeries=FALSE, 
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
rm(sixB)


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
rm(sevenA)


# Figure 7B
           aKMajorityRuleSimulation(folderName="Figure7B", 
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


# Figure 8A
           aKMajorityRuleSimulation(folderName="Figure8A", 
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
                                   plotExpectedUtilityTotalCosts=TRUE,
                                   plotOnlyExternalCost=FALSE,
                                   plotOnlyExpectedUtility=FALSE,
                                   plotNumberOfRounds=FALSE,
                                   plotPareto=FALSE,
                                   printOutputToScreen=TRUE)



# Figure 8B
           aKMajorityRuleSimulation(folderName="Figure8B", 
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


