## This script will help you install and use the package version of the code

rm(list = ls(all = TRUE)) # clear the workspace


# install.packages("devtools") ## Only has to be done once.
library(devtools) ## Installs devtools so you can load non-Offical packages


install_github()



# That should load the package now you can use it.





# Try figure 4A for example

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
                                       plotOnlyExternalCost=FALSE,
                                       plotOnlyExpectedUtility=TRUE,
                                       plotNumberOfRounds=FALSE,
                                       plotPareto=FALSE,
                                       printOutputToScreen=TRUE)




## Some of the nice things about using a package is that it makes looking at the code a little easier for a non-R programer.

  ## You can look at the code by just typing the name of a function in the console or sending just this line to the console:

  aKMajorityRuleSimulation  # running the name of a function displays all its code in the console


  ## You can look at a more detailed view by calling up the help file for the function. There you can see what each parameter is and what the options for it are. You can also see what the output will be and be provided with an example usage of the code. Call the help file with:

  ?aKMajorityRuleSimulation # this calls the help file for a function


## Those two things work for any function in the package so you can drill down as far as you would like. Try each of these:



iterations # lets you look at the code

seriesOfProposals # lets you look at the code

genGroupLevelDataFrame # lets you look at the code

genVoterLevelDataFrame # lets you look at the code



?iterations # calls the help file

?seriesOfProposals # calls the help file

?genGroupLevelDataFrame # calls the help file

?genVoterLevelDataFrame # calls the help file






## Each figure from the paper can also be replicated using the demo() function:

demo(demoFigure4A)

demo(demoFigure4B)

demo(demoFigure4C)

demo(demoFigure4D)

demo(demoFigure6A)

demo(demoFigure6B)

demo(demoFigure7A)

demo(demoFigure7B)

demo(demoFigure8A) # Issues a warning about the lenghth of time and offers and alternative demo that approximates 8A.

demo(demoFigure8B)


## Lastly there is a demo() that walks through all the functions in the package to demonstrate what each one does:

demo(demoWalThroughFunctions)



## You can see all the available demo files with this command
demo(package = "kMajorityRule")


