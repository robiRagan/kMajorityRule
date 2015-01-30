#' Replicates all figures from DER with new Package
#' - Version: 01.25.15
#'  
#############################################################################################################################

rm(list = ls(all = TRUE)) # clear the workspace



# #Figure 4A
# FourA <- aKMajorityRuleSimulation(folderName="DERsFigure4A",
#                                        numberOfIterations=500,
#                                        groupSize=c(35,30,35),
#                                        utilityDistribution=c("normal","normal","normal"),
#                                        utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2),
#                                        errorDistribution=c("normal","normal","normal"),
#                                        errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                        groupPostFailingProposalMeanUiIncrease=c("0","0","0"),
#                                        maximumNumberOfProposalsInASeries=1,
#                                        perProposalDecisionCost=0,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(FourA)


#
#
#
# #Figure 4B
# FourB <- aKMajorityRuleSimulation(folderName="DERsFigure4B",
#                                        numberOfIterations=500,
#                                        groupSize=c(20,30,50),
#                                        utilityDistribution=c("normal","normal","normal"),
#                                        utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2),
#                                        errorDistribution=c("normal","normal","normal"),
#                                        errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                        groupPostFailingProposalMeanUiIncrease=c("0","0","0"),
#                                        maximumNumberOfProposalsInASeries=1,
#                                        perProposalDecisionCost=0,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(FourB)
#
#
# # Figure 4C
#  FourC <- aKMajorityRuleSimulation(folderName="DERsFigure4C",
#                                         numberOfIterations=500,
#                                         groupSize=c(50,30,20),
#                                         utilityDistribution=c("normal","normal","normal"),
#                                         utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2),
#                                         errorDistribution=c("normal","normal","normal"),
#                                         errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                         groupPostFailingProposalMeanUiIncrease=c("0","0","0"),
#                                         maximumNumberOfProposalsInASeries=1,
#                                         perProposalDecisionCost=0,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(FourC)
#
#
# # Figure 4D
# FourD <- aKMajorityRuleSimulation(folderName="DERsFigure4D",
#                                        numberOfIterations=500,
#                                        groupSize=c(35,30,35),
#                                        utilityDistribution=c("normal","normal","normal"),
#                                        utilityDistributionParameters=c(-.5,.2,0,.2,.1,.2),
#                                        errorDistribution=c("normal","normal","normal"),
#                                        errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                        groupPostFailingProposalMeanUiIncrease=c("0","0","0"),
#                                        maximumNumberOfProposalsInASeries=1,
#                                        perProposalDecisionCost=0,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(FourD)


# Figure 6A
#  SixA <- aKMajorityRuleSimulation(folderName="DERsFigure6A", 
#                                        numberOfIterations=500, 
#                                        groupSize=c(35,30,35),
#                                        utilityDistribution=c("normal","normal","normal"), 
#                                        utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2), 
#                                        errorDistribution=c("normal","normal","normal"), 
#                                        errorDistributionParameters=c(0,.3,0,.3,0,.3), 
#                                        groupPostFailingProposalMeanUiIncrease=c(".1",".1",".1"),
#                                        maximumNumberOfProposalsInASeries=FALSE, 
#                                        perProposalDecisionCost=.01, 
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=TRUE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=FALSE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(SixA)
# 

# # Figure 6B
# SixB <- aKMajorityRuleSimulation(folderName="DERsFigure6B",
#                                        numberOfIterations=500,
#                                        groupSize=c(35,30,35),
#                                        utilityDistribution=c("normal","normal","normal"),
#                                        utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2),
#                                        errorDistribution=c("normal","normal","normal"),
#                                        errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                        groupPostFailingProposalMeanUiIncrease=c(".1/r",".1/r",".1/r"),
#                                        maximumNumberOfProposalsInASeries=FALSE,
#                                        perProposalDecisionCost=.01,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(SixB)
#
#
# # Figure 7A
# SevenA <- aKMajorityRuleSimulation(folderName="DERsFigure7A",
#                                         numberOfIterations=500,
#                                         groupSize=c(35,30,35),
#                                         utilityDistribution=c("normal","normal","normal"),
#                                         utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2),
#                                         errorDistribution=c("normal","normal","normal"),
#                                         errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                         groupPostFailingProposalMeanUiIncrease=c(".1",".1",".1"),
#                                         maximumNumberOfProposalsInASeries=FALSE,
#                                         perProposalDecisionCost=.1,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(SevenA)
#
#
# # Figure 7B
#  SevenB <- aKMajorityRuleSimulation(folderName="DERsFigure7B",
#                                          numberOfIterations=1000,
#                                          groupSize=c(35,30,35),
#                                          utilityDistribution=c("normal","normal","normal"),
#                                          utilityDistributionParameters=c(-.3,.2,0,.2,.3,.2),
#                                          errorDistribution=c("normal","normal","normal"),
#                                          errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                          groupPostFailingProposalMeanUiIncrease=c(".1/r",".1/r",".1/r"),
#                                          maximumNumberOfProposalsInASeries=FALSE,
#                                          perProposalDecisionCost=.1,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(SevenB)
#
#
# # Figure 8A
#  EightA <- aKMajorityRuleSimulation(folderName="DERsFigure8A",
#                                          numberOfIterations=500,
#                                          groupSize=c(50,30,20),
#                                          utilityDistribution=c("normal","normal","normal"),
#                                          utilityDistributionParameters=c(-.5,.2,0,.2,.1,.2),
#                                          errorDistribution=c("normal","normal","normal"),
#                                          errorDistributionParameters=c(0,.3,0,.3,0,.3),
#                                          groupPostFailingProposalMeanUiIncrease=c("-.1/r",".1/r",".1/r"),
#                                          maximumNumberOfProposalsInASeries=10000,
#                                          perProposalDecisionCost=.01,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(EightA)
#
#
#
#
# #Figure 8B
# EightB <- aKMajorityRuleSimulation(folderName="DERsFigure8B",
#                                         numberOfIterations=500,
#                                         groupSize=c(50,30,20),
#                                         utilityDistribution=c("normal","normal","normal"),
#                                         utilityDistributionParameters=c(-.5,.2,0,.2,.1,.2),
#                                         errorDistribution=c("normal","normal","normal"),
#                                         errorDistributionParameters=c(-.1,.2,0,.2,0,.2),
#                                         groupPostFailingProposalMeanUiIncrease=c(".001",".01",".01"),
#                                         maximumNumberOfProposalsInASeries=10000,
#                                         perProposalDecisionCost=.01,
#                                        outputTo=getwd(),
#                                        silentSeries=TRUE,
#                                        silentIterations=FALSE,
#                                        writeCSV=FALSE,
#                                        writeRObjects=FALSE,
#                                        plotExternalCostTotalCosts=FALSE,
#                                        plotExpectedUtilityTotalCosts=FALSE,
#                                        plotOnlyExternalCost=TRUE,
#                                        plotOnlyExpectedUtility=FALSE,
#                                        plotNumberOfRounds=FALSE,
#                                        plotPareto=FALSE,
#                                        printOutputToScreen=TRUE)
# rm(EightB)

