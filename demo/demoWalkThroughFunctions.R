rm(list = ls(all = TRUE)) # clear the workspace

##################################################################################################################
##
##  WALK THRU OF ALL MAJOR FUNCTIONS AND Minor Functions Not In Two Alternative Case
##  (make sure you have run all the lines above this message before you try the 
##   walk-thru code. That way the all the functions will be available to you)
##
#################################################################################################################
##
##  You can change the parameters used in the walkthough at the top of the script on line 57
##
#################################################################################################################

## NOW LETS WALK THROUGH ALL THE FUNCTIONS ##



# FUNCTION genGroupLevelDataframe: Creates the subgroups that the voters can be a part of.
oneIterationsGroupsForWalkthrough <- genGroupLevelDataFrame(groupSize=groupSizeForWalkthrough,utilityDistribution=utilityDistributionForWalkthrough,utilityDistributionParameters=utilityDistributionParametersForWalkthrough,errorDistribution=errorDistributionForWalkthrough,errorDistributionParameters=errorDistributionParametersForWalkthrough,groupPostFailingProposalMeanUiIncrease=groupPostFailingProposalMeanUiIncreaseForWalkthrough)

# FUNCTION genVoterLevelDataframe: Creates a set of voters who have 3 parameters: ui, ei, and groupID
oneIterationsVotersForWalkthrough <- genVoterLevelDataFrame(groupDataFrame=oneIterationsGroupsForWalkthrough)

# FUNCTION seriesOfVotes(): Runs a series of votes/multiple alternatives following a follows a “successive” voting procedure. Stores all of the input parameters, generated values and output for further analysis.

oneSeriesOfVotesOutput <-seriesOfVotes(oneIterationsVoters=oneIterationsVotersForWalkthrough,oneIterationsGroups=oneIterationsGroupsForWalkthrough,maximumNumberOfProposalsInASeries=maximumNumberOfProposalsInASeriesForWalkthrough,silentSeries=silentIterationsForWalkthrough)

# FUNCTION iterations: Runs numberOfIterations of the model. Generates voters for an iteration, hands off the voters to seriesOfVotes() for calculations. Then stores and summarizes all of the input parameters, generated values and output for further analysis.

# This uses the parameters defined at the beginning of the walkthrough.
# The function returns the output as a list of all the output, here I am naming it someIterationsOutput.
someIterationsOutput <- iterations(numberOfIterations=numberOfIterationsForWalkthrough,groupSize=groupSizeForWalkthrough,utilityDistribution=utilityDistributionForWalkthrough,utilityDistributionParameters=utilityDistributionParametersForWalkthrough, errorDistribution=errorDistributionForWalkthrough, errorDistributionParameters= errorDistributionParametersForWalkthrough,groupPostFailingProposalMeanUiIncrease=groupPostFailingProposalMeanUiIncreaseForWalkthrough,maximumNumberOfProposalsInASeries=maximumNumberOfProposalsInASeriesForWalkthrough,perProposalDecisionCost=perProposalDecisionCostForWalkthrough,silentSeries=silentSeriesForWalkthrough,silentIterations=silentIterationsForWalkthrough)

# FUNCTION: plotNumberOfRounds: Plots the min, mean and max number of rounds it took for the status quo to be defeated for each kMajority rule.

# This plot use base R's plotting which is not the prettiest, (for example depending on your screen size the plot displayed may cut the legend off, or conversely make it way too small) the plots for the paper, and in the package version of kMajority Cost will use ggplot2 which gives far better looking and consistent plots. Also note that the pdfs generated automatically with the functions below will look better. 
plotNumberOfRounds(someIterationsOutput)    


# This plot use base R's plotting which is not the prettiest, (for example depending on your screen size the plot displayed may cut the legend off, or conversely make it way too small) the plots for the paper, and in the package version of kMajority Cost will use ggplot2 which gives far better looking and consistent plots. Also note that the pdfs generated automatically with the functions below will look better. 
plotDecisionCost(someIterationsOutput)


# FUNCTION: plotTotalWelfare: Plots the totalWelfare measures for each kMajority considered in the model.
# This plot use base R's plotting which is not the prettiest, (for example depending on your screen size the plot displayed may cut the legend off, or conversely make it way too small). The plots that are generated and saved in the plots directory should look better and the plots for the paper and in the package version of kMajority Cost will use ggplot2 which gives far far better looking and more consistent plots.
plotTotalWelfare(someIterationsOutput)

# FUNCTION: plotWelfareLoss: Plots the welfare loss measures for each kMajority considered in the model.
# This plot use base R's plotting which is not the prettiest, (for example depending on your screen size the plot displayed may cut the legend off, or conversely make it way too small). The plots that are generated and saved in the plots directory should look better and the plots for the paper and in the package version of kMajority Cost will use ggplot2 which gives far far better looking and more consistent plots.
plotWelfareLoss(someIterationsOutput)


# FUNCTION: aKMajorityCostMultiSimulation: Runs an entire kMajority Cost Simulation
# The function returns the output as a list of all the output, here I am naming it someIterationsOutput.
# The output is placed into a folder inside either the current R working directory or the location the user specifies in the 'outputTo=' argument in the function.
aKMajorityCostMultiSimulation(numberOfIterations=numberOfIterationsForWalkthrough,groupSize=groupSizeForWalkthrough,utilityDistribution=utilityDistributionForWalkthrough,utilityDistributionParameters=utilityDistributionParametersForWalkthrough, errorDistribution=errorDistributionForWalkthrough, errorDistributionParameters= errorDistributionParametersForWalkthrough,groupPostFailingProposalMeanUiIncrease=groupPostFailingProposalMeanUiIncreaseForWalkthrough,maximumNumberOfProposalsInASeries=maximumNumberOfProposalsInASeriesForWalkthrough,perProposalDecisionCost=perProposalDecisionCostForWalkthrough,outputTo=outputToForWalkthrough,silentSeries=silentSeriesForWalkthrough,silentIterations=silentIterationsForWalkthrough)

# Try it with the series output on silent.
aKMajorityCostMultiSimulation(numberOfIterations=numberOfIterationsForWalkthrough,groupSize=groupSizeForWalkthrough,utilityDistribution=utilityDistributionForWalkthrough,utilityDistributionParameters=utilityDistributionParametersForWalkthrough, errorDistribution=errorDistributionForWalkthrough, errorDistributionParameters= errorDistributionParametersForWalkthrough,groupPostFailingProposalMeanUiIncrease=groupPostFailingProposalMeanUiIncreaseForWalkthrough,maximumNumberOfProposalsInASeries=maximumNumberOfProposalsInASeriesForWalkthrough,perProposalDecisionCost=perProposalDecisionCostForWalkthrough,outputTo=outputToForWalkthrough,silentSeries=TRUE,silentIterations=silentIterationsForWalkthrough)



