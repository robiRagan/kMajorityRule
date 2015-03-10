#' aKMajorityRuleSimulation
#' 
#' Runs a series of proposals for J iterations, for all possible k-majority rules.
#' @param folderName A user provided string for the output folder. The name
#'   will be output_folderName_on_08_11_2013_at_17_30_25
#' @template param_genGroupLevelDataframe
#' @template param_iterations
#' @param outputTo The working directory where you want the output from the
#'   simulation to be stored. The default uses your current working directory.
#'   Enter the directory as a string appropriate to your operating system, like
#'   outputTo="/Users/username/Documents/Foldername/Targetfoldername" or
#'   C:/Documents and Settings/username/My Documents/x/y/z"
#' @param writeCSV TRUE writes out all of the input and output as CSV files for
#'   later use or inspection.
#' @param writeRObjects TRUE writes out all the input and output as R objects using
#'   dput() for later use or inspection. See ?dput.
#'@param plotExternalCostTotalCosts If TRUE creates two graphs. One has the
#'   decision cost, external cost and total cost for the worst groups. The other
#'   plots the same three costs, but for the mean groups. This is the main
#'   output presented in the paper.
#' @param plotExpectedUtilityDecCostTotalUtil If TRUE creates two graphs. One has the
#'   decision cost, Expected Utility, Decision Costs and Total Utility for the worst groups. The other
#'   plots the same three measures, but for the mean groups. This is the main
#'   output presented in the paper.
#' @param plotOnlyExternalCost If set to TRUE plots the external cost for the worst, mean
#'   and best groups.
#'@param plotOnlyExpectedUtility If set to TRUE plots the expected utility for the worst, mean
#'   and best groups.
#' @param plotNumberOfRounds If set to TRUE plots mean number of rounds it took for the
#'   status quo to be defeated for each k-majority rule, across all the
#'   iterations.
#' @param plotPareto If set to TRUE plots the proportion of rounds with a failed Pareto
#'   Proposal.
#' @param printOutputToScreen If set to TRUE prints a summary of the simulation output to
#'   the screen after the simulation is finished.
#' @return Will stores all model input, output and graphs in provided working
#'   directory. The user can control which elemets to store and plot with the
#'   the write_____ and plot______ fundtion parameters detailed above. 
#'   Use the printOutputToScreen=TRUE option to see summary output after the model runs.
#' @examples
#'                          aKMajorityRuleSimulation(folderName="SimulationA",
#'                                                  numberOfIterations=100,
#'                                                  groupSize=c(35,30,35),
#'                                                  utilityDistribution=c("normal","normal","normal"),
#'                                                  utilityDistributionParameters=c(-.25,.25,0,.25,.25,.25),
#'                                                  errorDistribution=c("normal","normal","normal"),
#'                                                  errorDistributionParameters=c(0,.3,0,.3,0,.3),
#'                                                  groupPostFailingProposalMeanUiIncrease=c(".1",".1",".1"),
#'                                                  maximumNumberOfProposalsInASeries=FALSE,
#'                                                  perProposalDecisionCost=.01,
#'                                                  outputTo=getwd(),
#'                                                  silentSeries=FALSE,
#'                                                  silentIterations=FALSE,
#'                                                  writeCSV=FALSE,
#'                                                  writeRObjects=FALSE,
#'                                                  plotExternalCostTotalCosts=FALSE,
#'                                                  plotExpectedUtilityDecCostTotalUtil=FALSE,
#'                                                  plotOnlyExternalCost=FALSE,
#'                                                  plotOnlyExpectedUtility=FALSE,
#'                                                  plotNumberOfRounds=FALSE,
#'                                                  plotPareto=TRUE,
#'                                                  printOutputToScreen=TRUE) 
#' @export


aKMajorityRuleSimulation <-       function(folderName,
                                           numberOfIterations,
                                           groupSize,
                                           utilityDistribution,
                                           utilityDistributionParameters,
                                           errorDistribution,
                                           errorDistributionParameters,
                                           groupPostFailingProposalMeanUiIncrease,
                                           maximumNumberOfProposalsInASeries,
                                           perProposalDecisionCost,
                                           silentSeries,
                                           silentIterations,
                                           outputTo,
                                           writeCSV,
                                           writeRObjects,
                                           plotExternalCostTotalCosts,
                                           plotExpectedUtilityDecCostTotalUtil,
                                           plotOnlyExternalCost,
                                           plotOnlyExpectedUtility,
                                           plotNumberOfRounds,
                                           plotPareto,
                                           printOutputToScreen){
  
  setwd(dir=outputTo)    
  cat("**BEGIN SIMULATION**\n")
  
  # STEP 1 Run the iterations
  iterationsOutput <- iterations(numberOfIterations,groupSize,utilityDistribution,utilityDistributionParameters,errorDistribution,errorDistributionParameters,groupPostFailingProposalMeanUiIncrease,maximumNumberOfProposalsInASeries,perProposalDecisionCost,silentSeries,silentIterations)
  
  
  
  # STEP 2: Create output directory:
  if( writeCSV | writeRObjects| plotExternalCostTotalCosts==TRUE | plotExpectedUtilityDecCostTotalUtil==TRUE | plotNumberOfRounds==TRUE | plotOnlyExternalCost==TRUE | plotExpectedUtilityDecCostTotalUtil==TRUE | plotPareto==TRUE| plotOnlyExpectedUtility==TRUE){
  sysTimeStamp <- format(Sys.time(),"on_%m_%d_%Y_at_%H_%M_%S")
  dir.create(paste("output_",folderName,"_",sysTimeStamp, sep=""), showWarnings=FALSE)
  cat("The simulation output  will be stored in \n  ",outputTo, paste("/output_",folderName,"_",sysTimeStamp,"\n\n", sep=""), sep = "")
  }
  
  # STEP 3: Plots
## Add other plots to or statement  
  if(plotExternalCostTotalCosts==TRUE | plotExpectedUtilityDecCostTotalUtil==TRUE | plotNumberOfRounds==TRUE | plotOnlyExternalCost==TRUE | plotExpectedUtilityDecCostTotalUtil==TRUE | plotPareto==TRUE| plotOnlyExpectedUtility==TRUE){
    dir.create(paste("output_",folderName,"_",sysTimeStamp,"/plots",sep=""), showWarnings=FALSE)
    cat("CREATED 'plots' folder.\n\n", sep = "") 
  }#ends the if any plots IF
  
  
  if (plotNumberOfRounds==TRUE){
    # Plot the mean number of rounds it took for the status quo to be defeated for each k-majority rule, across all the iterations.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/roundsTillPasses.pdf",sep=""), width = 7, height = 6.12)
    plotNumberOfRounds(iterationsOutput)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/roundsTillPasses.png",sep=""), width = 700, height = 612)
    plotNumberOfRounds(iterationsOutput)
    dev.off()
    
    cat("SAVED 'roundsTillPasses.pdf' and 'roundsTillPasses.png' to the 'plots' folder.\n", sep = "")
  } # ends if(plotNumberOfRounds==TRUE)
  
  ##############################################################################
  # The following plots External Cost Only
  #
  ###############################################################################  
  
  
  if (plotOnlyExternalCost==TRUE){
    # Plots only the External Cost measures for worst, best and mean groups.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/externalCost.pdf",sep=""), width = 7, height = 6.12)
    plotOnlyExternalCost(iterationsOutput)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/externalCost.png",sep=""), width = 700, height = 612)
    plotOnlyExternalCost(iterationsOutput)
    dev.off()
    
    cat("SAVED 'externalCost.pdf' and 'externalCost.png' to the 'plots' folder.\n\n", sep = "")
  } # ends if(plotOnlyExternalCost==TRUE)
  
  ##############################################################################
  # The following plots Expected Utility Only
  #
  ###############################################################################
   
  if (plotOnlyExpectedUtility==TRUE){
    # Plots only the External Cost measures for worst, best and mean groups.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/expectedUtility.pdf",sep=""), width = 7, height = 6.12)
    plotOnlyExpectedUtility(iterationsOutput)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/expectedUtility.png",sep=""), width = 700, height = 612)
    plotOnlyExpectedUtility(iterationsOutput)
    dev.off()
    
    cat("SAVED 'ExpectedUtility.pdf' and 'ExpectedUtility.png' to the 'plots' folder.\n\n", sep = "")
  } # ends if(plotOnlyExpectedUtility==TRUE)
  
  ##############################################################################
  # The following plot Total Cost as a function of Decision cost and External Cost
  #
  ###############################################################################


  if(plotExternalCostTotalCosts==TRUE){
    # Plots the External Cost and Total Cost measures for mean group.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalCostMeanGroupWithExternalCost.pdf",sep=""), width = 7, height = 6.12)
    plotExternalCostTotalCost(iterationsOutput,plotMeanEC=TRUE,plotBestEC=FALSE,plotWorstEC=FALSE)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalCostMeanGroupWithExternalCost.png",sep=""), width = 700, height = 612)
    plotExternalCostTotalCost(iterationsOutput,plotMeanEC=TRUE,plotBestEC=FALSE,plotWorstEC=FALSE)
    dev.off()
    
    cat("SAVED 'totalCostMeanGroupWithExternalCost.pdf' and 'totalCostMeanGroupWithExternalCost.png' to the 'plots' folder.\n\n", sep = "")
    
    
    # Plots the External Cost and Total Cost measures for best group.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalCostBestGroupWithExternalCost.pdf",sep=""), width = 7, height = 6.12)
    plotExternalCostTotalCost(iterationsOutput,plotMeanEC=FALSE,plotBestEC=TRUE,plotWorstEC=FALSE)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalCostBestGroupWithExternalCost.png",sep=""), width = 700, height = 612)
    plotExternalCostTotalCost(iterationsOutput,plotMeanEC=FALSE,plotBestEC=TRUE,plotWorstEC=FALSE)
    dev.off()
    
    cat("SAVED 'totalCostBestGroupWithExternalCost.pdf' and 'totalCostBestGroupWithExternalCost.png' to the 'plots' folder.\n\n", sep = "")
    
    
    
    # Plots the External Cost and Total Cost measures for worst groups.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalCostWorstGroupWithWithExternalCost.pdf",sep=""), width = 7, height = 6.12)
    plotExternalCostTotalCost(iterationsOutput,plotMeanEC=FALSE,plotBestEC=FALSE,plotWorstEC=TRUE)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalCostWorstGroupWithExternalCost.png",sep=""), width = 700, height = 612)
    plotExternalCostTotalCost(iterationsOutput,plotMeanEC=FALSE,plotBestEC=FALSE,plotWorstEC=TRUE)
    dev.off()
    
    cat("SAVED 'totalCostWorstGroupWithWithExternalCost.pdf' and 'totalCostWorstGroupWithExternalCost.png' to the 'plots' folder.\n\n", sep = "")
  } #Ends if plotExternalCostTotalCosts==TRUE
  
  
  
  
  
  ####################################################################################
  # The following plot Total Cost as a function of Decision Cost and Expected Utility
  #
  ###################################################################################
  
  
  
  
  if(plotExpectedUtilityDecCostTotalUtil==TRUE){
    # Plots the Expected Utility, Decision Costs and Total Utility measures for mean group.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/expectedUtilityDecCostTotalUtilMeanGroup.pdf",sep=""), width = 7, height = 6.12)
    plotExpectedUtilityDecCostTotalUtil(iterationsOutput,plotMeanEU=TRUE,plotBestEU=FALSE,plotWorstEU=FALSE)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/expectedUtilityDecCostTotalUtilMeanGroup.png",sep=""), width = 700, height = 612)
    plotExpectedUtilityDecCostTotalUtil(iterationsOutput,plotMeanEU=TRUE,plotBestEU=FALSE,plotWorstEU=FALSE)
    dev.off()
    
    cat("SAVED 'expectedUtilityDecCostTotalUtilMeanGroup.pdf' and 'expectedUtilityDecCostTotalUtilMeanGroup.png' to the 'plots' folder.\n\n", sep = "")
    
    
    # Plots the Expected Utility, Decision Costs and Total Utility measures for best group.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/expectedUtilityDecCostTotalUtilMeanGroupBestGroup.pdf",sep=""), width = 7, height = 6.12)
    plotExpectedUtilityDecCostTotalUtil(iterationsOutput,plotMeanEU=FALSE,plotBestEU=TRUE,plotWorstEU=FALSE)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/expectedUtilityDecCostTotalUtilMeanGroupBestGroup.png",sep=""), width = 700, height = 612)
    plotExpectedUtilityDecCostTotalUtil(iterationsOutput,plotMeanEU=FALSE,plotBestEU=TRUE,plotWorstEU=FALSE)
    dev.off()
    
    cat("SAVED 'expectedUtilityDecCostTotalUtilMeanGroupBestGroup.pdf' and 'expectedUtilityDecCostTotalUtilMeanGroupBestGroup.png' to the 'plots' folder.\n\n", sep = "")
    
    
    
    # Plots the Expected Utility, Decision Costs and Total Utility measures for worst groups.
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalUtilWorstGroupWithExpectedUtility.pdf",sep=""), width = 7, height = 6.12)
    plotExpectedUtilityDecCostTotalUtil(iterationsOutput,plotMeanEU=FALSE,plotBestEU=FALSE,plotWorstEU=TRUE)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/totalUtilWorstGroupWithExpectedUtility.png",sep=""), width = 700, height = 612)
    plotExpectedUtilityDecCostTotalUtil(iterationsOutput,plotMeanEU=FALSE,plotBestEU=FALSE,plotWorstEU=TRUE)
    dev.off()
    
    cat("SAVED 'totalUtilWorstGroupWithExpectedUtility.pdf' and 'totalUtilWorstGroupWithExpectedUtility.png' to the 'plots' folder.\n\n", sep = "")
  } #Ends if plotExpectedUtilityDecCostTotalUtil==TRUE
  
  
  
  
  
  
  if(plotPareto==TRUE){
    # Plots the Proportion of Rounds with a failed Pareto Proposal
    pdf(paste("output_",folderName,"_",sysTimeStamp,"/plots/paretoFailures.pdf",sep=""), width = 7, height = 6.12)
    plotPareto(iterationsOutput)
    dev.off()
    
    png(paste("output_",folderName,"_",sysTimeStamp,"/plots/paretoFailures.png",sep=""), width = 700, height = 612)
    plotPareto(iterationsOutput)
    dev.off()
    
    cat("SAVED 'paretoFailures.pdf' and 'paretoFailures.png' to the 'plots' folder.\n", sep = "")
  } #ends if(plotPareto==TRUE)
  
  

  
  
  if (writeRObjects==TRUE){
    # STEP 4: Store the input parameters and the output as one R object.
    dir.create(paste("output_",folderName,"_",sysTimeStamp,"/robjects",sep=""), showWarnings=FALSE)
    cat("CREATED 'robjects' folder.\n", sep = "")
    
    dput(iterationsOutput$theInputParameters, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/inputAsRobject",sep=""))
    dput(iterationsOutput$rounds, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/roundsAsRobject",sep=""))
    dput(iterationsOutput$externalCost, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/externalCostAsRobject",sep=""))
    dput(iterationsOutput$allGroups, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/allGroupsAsRobject",sep=""))
    dput(iterationsOutput$allVoters, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/allVotersAsRobject",sep=""))
    dput(iterationsOutput$allYeas, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/allYeasAsRobject",sep=""))
    dput(iterationsOutput$allPassesForWhich, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/allPassesForWhichRobject",sep=""))
    dput(iterationsOutput$allMeanVoters, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/allMeanVotersRobject",sep=""))
    dput(iterationsOutput$allHighestMeanGroup, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/allHighestMeanGroupRobject",sep=""))
    dput(iterationsOutput$allLowestMeanGroup, file = paste("output_",folderName,"_",sysTimeStamp,"/robjects/allLowestMeanGroupRobject",sep=""))
    cat("SAVED input and output as one R Object in the 'robjects' folder. \n  It can be read into R with dget(). \n  See ?dget for more information. \n", sep = "")
  } #ends if(writeRObjects==TRUE)
  
  # STEP 5: Store the objects as .csv files.
  if (writeCSV==TRUE){
    dir.create(paste("output_",folderName,"_",sysTimeStamp,"/csvs",sep=""), showWarnings=FALSE)
    cat("CREATED 'csvs' folder.\n", sep = "")      
    
    # write the input Parameters as .csv files    
    write.csv(as.matrix(iterationsOutput$theInputParameters), file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/inputParameters.csv",sep=""),row.names=TRUE)
    cat("SAVED 'inputParameters.csv' in the 'csv' folder. \n  It can be read into R with read.csv. \n  See ?read.csv. \n", sep = "")
    
    # write the rounds as .csv files   
    write.csv(as.matrix(iterationsOutput$rounds), file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/rounds.csv",sep=""),row.names=TRUE)
    cat("SAVED 'rounds.csv' in the 'csv' folder. \n  It can be read into R with read.csv. \n  See ?read.csv. \n", sep = "")
    
    # write the voters as .csv files
    for (k in 1:length(iterationsOutput$allVoters)){
      write.csv(iterationsOutput$allVoters[[k]], file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/votersIteration_",k,".csv", sep=""),row.names=FALSE)
    }
    cat("SAVED each 'votersIteration_k.csv' files in the 'csv' folder. \n  They can be read into R with read.csv. \n  See ?read.csv. \n", sep = "")
    
    # write the groups as .csv files
    for (k in 1:length(iterationsOutput$allGroups)){
      write.csv(iterationsOutput$allGroups[[k]], file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/groupsIteration_",k,".csv", sep=""),row.names=FALSE)
    }
    cat("SAVED each 'groupIteration_k.csv' files in the 'csv' folder. \n  They can be read into R with read.csv. \n  See ?read.csv. \n", sep = "")
    
    # write the yeas total for each iteration as .csv
    write.csv(as.matrix(iterationsOutput$allYeas), file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/allYeas.csv",sep=""),row.names=FALSE)
    cat("SAVED 'allYeas.csv', which contains the total number of yea voters for each kMajority rule in each iteration in the 'csv' folder. \n  It can be read into R with read.csv. \n  See ?read.csv. \n", sep = "")
    
    # write the passes for which kMajority for each iteration as .csv
    for (k in 1:length(iterationsOutput$allPassesForWhich)){
      write.csv(iterationsOutput$allPassesForWhich[[k]], file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/passesForWhich_",k,".csv", sep=""),row.names=FALSE)
    }
    cat("SAVED each 'passesForWhich_k.csv' files in the 'csv' folder. \n  They can be read into R with read.csv. \n  See ?read.csv. \n", sep = "")
    
    # Write the External Cost Loss Measures as .csv files
    write.csv(iterationsOutput$externalCost$meanOfMeanVotersExternalCostEachIteration, file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/meanOfMeanVotersExternalCostEachIteration.csv",sep=""),row.names=FALSE)
    cat("SAVED 'meanOfMeanVotersExternalCostEachIteration.csv', which records the utility of the min voter for a given kMajority in each iteration. \n  It has been saved in the 'csv' folder. It can be read into R with read.csv. \n  See ?read.csv. \n\n", sep = "")
    
    write.csv(iterationsOutput$externalCost$meanOfbestOffGroupsMeanExternalCostEachIteration, file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/meanOfbestOffGroupsMeanExternalCostEachIteration.csv",sep=""),row.names=FALSE)
    cat("SAVED 'meanOfbestOffGroupsMeanExternalCostEachIteration.csv', which records the utility of the min voter for a given kMajority in each iteration. \n  It has been saved in the 'csv' folder. It can be read into R with read.csv. \n  See ?read.csv. \n\n", sep = "")
    
    write.csv(iterationsOutput$externalCost$meanOfworstOffGroupsMeanExternalCostEachIteration, file = paste("output_",folderName,"_",sysTimeStamp,"/csvs/meanOfworstOffGroupsMeanExternalCostEachIteration.csv",sep=""),row.names=FALSE)
    cat("SAVED 'meanOfworstOffGroupsMeanExternalCostEachIteration.csv', which records the utility of the min voter for a given kMajority in each iteration. \n  It has been saved in the 'csv' folder. It can be read into R with read.csv. \n  See ?read.csv. \n\n", sep = "")
  } # ends if(writeCSV==TRUE)
  


## Only write out the info if something else was stored or plotted
if( writeCSV | writeRObjects| plotExternalCostTotalCosts==TRUE | plotExpectedUtilityDecCostTotalUtil==TRUE | plotNumberOfRounds==TRUE | plotOnlyExternalCost==TRUE | plotExpectedUtilityDecCostTotalUtil==TRUE | plotPareto==TRUE| plotOnlyExpectedUtility==TRUE){
  sink(paste("output_",folderName,"_",sysTimeStamp,"/",nrow(iterationsOutput$allGroups[[1]]),"G_",iterationsOutput$theInputParameters$utilityDistribution[1],"Util_",iterationsOutput$theInputParameters$errorDistribution[1],"Error_Info.txt",sep=""))
  cat("This file is: ",nrow(iterationsOutput$allGroups[[1]]),"G_",iterationsOutput$theInputParameters$utilityDistribution[1],"Util_",iterationsOutput$theInputParameters$errorDistribution[1],"Error_Info.txt\n\n",sep="")
  cat("This file contains basic information about the simulation files contained in this folder.\n\n")
  cat("Based on",numberOfIterations," Iterations\n\n")
  cat("Rounds Limit =",iterationsOutput$theInputParameters$maximumNumberOfProposalsInASeries,"\n\n")
  cat(nrow(iterationsOutput$allGroups[[1]]), "Groups: ", iterationsOutput$allGroups[[1]]$groupSize,"\n\n")
  cat("Utility Drawn From: \n")
  for (i in 1:nrow(iterationsOutput$allGroups[[1]])){
    cat("Group ",i,": ",as.vector(iterationsOutput$allGroups[[1]]$utilityDistribution[i]),"(",iterationsOutput$allGroups[[1]]$utilityDistributionParam1[i],",",iterationsOutput$allGroups[[1]]$utilityDistributionParam2[i],")\n",sep="")
  }
  cat("\nError Drawn From: \n")
  for (i in 1:nrow(iterationsOutput$allGroups[[1]])){
    cat("Group ",i,": ",as.vector(iterationsOutput$allGroups[[1]]$errorDistribution[i]),"(",iterationsOutput$allGroups[[1]]$errorDistributionParam1[i],",",iterationsOutput$allGroups[[1]]$errorDistributionParam2[i],")\n",sep="")
  }
  cat("\nGroup Alpha: \n")
  for (i in 1:nrow(iterationsOutput$allGroups[[1]])){
    cat("Group ",i,": ", as.vector(iterationsOutput$allGroups[[1]]$groupPostFailingProposalMeanUiIncrease[i]),"\n",sep="")
  }
  

  
  ## The following output is only needed for multiple round cases
  if (iterationsOutput$theInputParameters$maximumNumberOfProposalsInASeries > 1 | iterationsOutput$theInputParameters$maximumNumberOfProposalsInASeries==FALSE){
    cat("Per-Round Decision Cost: ",iterationsOutput$theInputParameters$perProposalDecisionCost,"\n\n")
    cat("Min Rounds of Voting by kMaj: ",iterationsOutput$rounds$minRoundProposalPassedEachIteration,"\n\n")
    cat("Mean Rounds of Voting by kMaj: ",iterationsOutput$rounds$meanRoundProposalPassedEachIteration,"\n\n")
    cat("Max Rounds of Voting by kMaj: ",iterationsOutput$rounds$maxRoundProposalPassedEachIteration,"\n\n")
    cat("Mean Proposals Considered by kMaj: ",iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration,"\n\n")
    cat("Decision Costs by kMaj: ",iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost,"\n\n")
  } else {cat("Note there are no Decision Costs for this run because there is only one round of voting.\n\n")}
  

if (plotExternalCostTotalCosts == TRUE | plotOnlyExternalCost == TRUE){
  cat("Mean External Cost by kMaj: ",iterationsOutput$externalCost$meanOfMeanVotersExternalCostEachIteration,"\n\n")
  cat("Best External Cost by kMaj: ",iterationsOutput$externalCost$meanOfbestOffGroupsMeanExternalCostEachIteration,"\n\n")
  cat("Worst External Cost by kMaj: ",iterationsOutput$externalCost$meanOfworstOffGroupsMeanExternalCostEachIteration,"\n\n")
  
  cat("Mean Total Cost w/ External Cost by kMaj: ",iterationsOutput$externalCost$meanOfMeanVotersExternalCostEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
  cat("Best Total Cost w/ External Cost by kMaj: ",iterationsOutput$externalCost$meanOfbestOffGroupsMeanExternalCostEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
  cat("Worst Total Cost w/ External Cost by kMaj: ",iterationsOutput$externalCost$meanOfworstOffGroupsMeanExternalCostEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
  }

if (plotExpectedUtilityDecCostTotalUtil == TRUE | plotOnlyExpectedUtility == TRUE){
  cat("Mean Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfMeanVotersExpectedUtilityEachIteration,"\n\n")
  cat("Best Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfbestOffGroupsMeanExpectedUtilityEachIteration,"\n\n")
  cat("Worst Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfworstOffGroupsMeanExpectedUtilityEachIteration,"\n\n")
  
  cat("Mean Total Cost w/ Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfMeanVotersExpectedUtilityEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
  cat("Best Total Cost w/ Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfbestOffGroupsMeanExpectedUtilityEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
  cat("Worst Total Cost w/ Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfworstOffGroupsMeanExpectedUtilityEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
  }

sink()
  
  cat("The simulation output was be stored in \n  ",outputTo, paste("/output_",folderName,"_",sysTimeStamp,"\n\n**END SIMULATION**\n", sep=""), sep = "")
  
} # ends the if statement for sinking to a file  
  
  
  ### This prints the output to the screen if printToScreen==TRUE
  if (printOutputToScreen==TRUE){
    cat("\n\n This output contains basic information about the simulation that was just run.\n\n")
    cat("Based on",numberOfIterations," Iterations\n\n")
    cat("Rounds Limit =",iterationsOutput$theInputParameters$maximumNumberOfProposalsInASeries,"\n\n")
    cat(nrow(iterationsOutput$allGroups[[1]]), "Groups: ", iterationsOutput$allGroups[[1]]$groupSize,"\n\n")
    cat("Utility Drawn From: \n")
    for (i in 1:nrow(iterationsOutput$allGroups[[1]])){
      cat("Group ",i,": ",as.vector(iterationsOutput$allGroups[[1]]$utilityDistribution[i]),"(",iterationsOutput$allGroups[[1]]$utilityDistributionParam1[i],",",iterationsOutput$allGroups[[1]]$utilityDistributionParam2[i],")\n",sep="")
    }
    cat("\nError Drawn From: \n")
    for (i in 1:nrow(iterationsOutput$allGroups[[1]])){
      cat("Group ",i,": ",as.vector(iterationsOutput$allGroups[[1]]$errorDistribution[i]),"(",iterationsOutput$allGroups[[1]]$errorDistributionParam1[i],",",iterationsOutput$allGroups[[1]]$errorDistributionParam2[i],")\n",sep="")
    }
    cat("\nGroup Alpha: \n")
    for (i in 1:nrow(iterationsOutput$allGroups[[1]])){
      cat("Group ",i,": ", as.vector(iterationsOutput$allGroups[[1]]$groupPostFailingProposalMeanUiIncrease[i]),"\n",sep="")
    }
    
    
    ## The following output is only needed for multiple round cases
    if (iterationsOutput$theInputParameters$maximumNumberOfProposalsInASeries > 1 | iterationsOutput$theInputParameters$maximumNumberOfProposalsInASeries==FALSE){
      cat("Per-Round Decision Cost: ",iterationsOutput$theInputParameters$perProposalDecisionCost,"\n\n")
      cat("Min Rounds of Voting by kMaj: ",iterationsOutput$rounds$minRoundProposalPassedEachIteration,"\n\n")
      cat("Mean Rounds of Voting by kMaj: ",iterationsOutput$rounds$meanRoundProposalPassedEachIteration,"\n\n")
      cat("Max Rounds of Voting by kMaj: ",iterationsOutput$rounds$maxRoundProposalPassedEachIteration,"\n\n")
      cat("Mean Proposals Considered by kMaj: ",iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration,"\n\n")
      cat("Decision Costs by kMaj: ",iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost,"\n\n")
    } else {cat("Note there are no Decision Costs for this run because there is only one round of voting.\n\n")}
    
  
    if (plotExternalCostTotalCosts == TRUE | plotOnlyExternalCost == TRUE){
      cat("Mean External Cost by kMaj: ",iterationsOutput$externalCost$meanOfMeanVotersExternalCostEachIteration,"\n\n")
      cat("Best External Cost by kMaj: ",iterationsOutput$externalCost$meanOfbestOffGroupsMeanExternalCostEachIteration,"\n\n")
      cat("Worst External Cost by kMaj: ",iterationsOutput$externalCost$meanOfworstOffGroupsMeanExternalCostEachIteration,"\n\n")
      
      cat("Mean Total Cost w/ External Cost by kMaj: ",iterationsOutput$externalCost$meanOfMeanVotersExternalCostEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
      cat("Best Total Cost w/ External Cost by kMaj: ",iterationsOutput$externalCost$meanOfbestOffGroupsMeanExternalCostEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
      cat("Worst Total Cost w/ External Cost by kMaj: ",iterationsOutput$externalCost$meanOfworstOffGroupsMeanExternalCostEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
    }
    
    if (plotExpectedUtilityDecCostTotalUtil == TRUE | plotOnlyExpectedUtility == TRUE){
      cat("Mean Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfMeanVotersExpectedUtilityEachIteration,"\n\n")
      cat("Best Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfbestOffGroupsMeanExpectedUtilityEachIteration,"\n\n")
      cat("Worst Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfworstOffGroupsMeanExpectedUtilityEachIteration,"\n\n")
      
      cat("Mean Total Cost w/ Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfMeanVotersExpectedUtilityEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
      cat("Best Total Cost w/ Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfbestOffGroupsMeanExpectedUtilityEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
      cat("Worst Total Cost w/ Expected Utility by kMaj: ",iterationsOutput$expectedUtility$meanOfworstOffGroupsMeanExpectedUtilityEachIteration+(iterationsOutput$rounds$meanNumberOfProposalsConsideredEachIteration * iterationsOutput$theInputParameters$perProposalDecisionCost),"\n\n")
    }
    
  } # Ends if Print To Screen
  
  iterationsOutput
} # ends the aKMajorityRuleSimulation() function.