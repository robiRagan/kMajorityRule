library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  

  

  
simOutput <- reactive({
  if(input$runSim == 0) {return()
                         }else{
                           
## ToDo: Should collect parameters here so the function will work with arbitrary numbers of gorups.                        

withProgress(                           
  aKMajorityRuleSimulation(folderName="Folder", 
                          numberOfIterations=input$numIter, 
                          groupSize=c(input$group1Size,input$group2Size,input$group3Size),
                          utilityDistribution=c("normal","normal","normal"), 
                          utilityDistributionParameters=c(input$group1UiMean,input$group1UiStd,input$group2UiMean,input$group2UiStd,input$group3UiMean,input$group3UiStd), 
                          errorDistribution=c("normal","normal","normal"), 
                          errorDistributionParameters=c(input$group1EiMean,input$group1EiStd,input$group2EiMean,input$group1EiStd,input$group3EiMean,input$group1EiStd), 
                          groupPostFailingProposalMeanUiIncrease=c(paste(input$group1Alpha),paste(input$group2Alpha),paste(input$group3Alpha)),
                          maximumNumberOfProposalsInASeries=input$maxProposals, 
                          perProposalDecisionCost=input$decisionCostPer, 
                          outputTo=getwd(),
                          silentSeries=TRUE,
                          silentIterations=TRUE,
                          writeCSV=FALSE,
                          writeRObjects=FALSE,
                          plotExternalCostTotalCosts=FALSE,
                          plotExpectedUtilityTotalCosts=FALSE,
                          plotOnlyExternalCost=FALSE,
                          plotOnlyExpectedUtility=FALSE,
                          plotNumberOfRounds=FALSE,
                          plotPareto=FALSE,
                          printOutputToScreen=FALSE)
, message='Calculation in Progress', detail='This may take a while.') # end withProgress
                         } # end else
}) #end reactive  


  output$plotBest <- renderPlot({if(input$runSim==0) return(NULL)
  plotExpectedUtilityTotalCost(outputDataList = simOutput(), plotMeanEU = FALSE, plotBestEU = TRUE, plotWorstEU = FALSE)
                                })

  output$plotMean <- renderPlot({if(input$runSim==0) return(NULL)
  plotExpectedUtilityTotalCost(outputDataList = simOutput(), plotMeanEU = TRUE, plotBestEU = FALSE, plotWorstEU = FALSE)
                              })
  
  output$plotWorst <- renderPlot({if(input$runSim==0) return(NULL)
  plotExpectedUtilityTotalCost(outputDataList = simOutput(), plotMeanEU = FALSE, plotBestEU = FALSE, plotWorstEU = TRUE)
                                })




} # ends function definition
)# ends shiny server



