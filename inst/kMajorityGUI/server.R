library(shiny)
library(kMajorityRule)

shinyServer(function(input, output) {
  

  

  
simOutput <- reactive({
  if(input$runSim == 0) return()
      isolate({
                           
#Gather the input parameters and set as correct vector                           
if (input$group1==TRUE){
 g1S <- input$group1Size 
g1UD <- input$group1UiDist
g1UM <- input$group1UiMean
g1US <- input$group1UiStd
g1ED <- input$group1EiDist
g1EM <- input$group1EiMean
g1ES <- input$group1EiStd
g1A <- input$group1Alpha
} else {
  g1S <- NA
  g1UD <- NA
  g1UM <- NA
  g1US <- NA
  g1ED <- NA
  g1EM <- NA
  g1ES <- NA
  g1A <- NA
}         


if (input$group2==TRUE){
  g2S <- input$group2Size 
  g2UD <- input$group2UiDist
  g2UM <- input$group2UiMean
  g2US <- input$group2UiStd
  g2ED <- input$group2EiDist
  g2EM <- input$group2EiMean
  g2ES <- input$group2EiStd
  g2A <- input$group2Alpha
} else {
  g2S <- NA
  g2UD <- NA
  g2UM <- NA
  g2US <- NA
  g2ED <- NA
  g2EM <- NA
  g2ES <- NA
  g2A <- NA
}  


if (input$group3==TRUE){
  g3S <- input$group3Size 
  g3UD <- input$group3UiDist
  g3UM <- input$group3UiMean
  g3US <- input$group3UiStd
  g3ED <- input$group3EiDist
  g3EM <- input$group3EiMean
  g3ES <- input$group3EiStd
  g3A <- input$group3Alpha
} else {
  g3S <- NA
  g3UD <- NA
  g3UM <- NA
  g3US <- NA
  g3ED <- NA
  g3EM <- NA
  g3ES <- NA
  g3A <- NA
} 

withProgress(                           
  aKMajorityRuleSimulation(folderName="Folder", 
                          numberOfIterations=input$numIter, 
                          groupSize=na.omit(c(g1S,g2S,g3S)),
                          utilityDistribution=na.omit(c(g1UD,g2UD,g3UD)), 
                          utilityDistributionParameters=na.omit(c(g1UM,g1US,g2UM,g2US,g3UM,g3US)), 
                          errorDistribution=na.omit(c(g1ED,g2ED,g3ED)),  
                          errorDistributionParameters=na.omit(c(g1EM,g1ES,g2EM,g2ES,g3EM,g3ES)), 
                          groupPostFailingProposalMeanUiIncrease=na.omit(c(g1A,g2A,g3A)),
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

      })

}) #end reactive  

  output$plotBest <- renderPlot({if(input$runSim== 0) return(NULL)
  plotExpectedUtilityTotalCost(outputDataList = simOutput(), plotMeanEU = FALSE, plotBestEU = TRUE, plotWorstEU = FALSE)
                                })

  output$plotMean <- renderPlot({if(input$runSim== 0) return(NULL)
  plotExpectedUtilityTotalCost(outputDataList = simOutput(), plotMeanEU = TRUE, plotBestEU = FALSE, plotWorstEU = FALSE)
                              })
  
  output$plotWorst <- renderPlot({if(input$runSim== 0) return(NULL)
  plotExpectedUtilityTotalCost(outputDataList = simOutput(), plotMeanEU = FALSE, plotBestEU = FALSE, plotWorstEU = TRUE)
                                })


} # ends function definition
)# ends shiny server



