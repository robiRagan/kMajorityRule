library(shiny)

shinyUI(fluidPage(
  
  titlePanel("kMajority Rule Simulation"),
  

    
  fluidRow( 
    column(3,
      wellPanel(
        h2("Group 1"),
             numericInput("group1Size", "Size", 35),
             numericInput("group1UiMean", "Utility Mean (Normal Dist.)", -.3),
             numericInput("group1UiStd", "Utility Std. Dev. (Normal Dist.)", .2),
             numericInput("group1EiMean", "Error Mean (Normal Dist.)", 0),
             numericInput("group1EiStd", "Error Std. Dev. (Normal Dist.)", .3),
             numericInput("group1Alpha", "Change in utility mean when proposal fails.", .1)
      )),
             
    column(3,
      wellPanel(
        h2("Group 2"),
             numericInput("group2Size", "Size", 30),
             numericInput("group2UiMean", "Utility Mean (Normal Dist.)", 0),
             numericInput("group2UiStd", "Utility Std. Dev. (Normal Dist.)", .2),
             numericInput("group2EiMean", "Error Mean (Normal Dist.)", 0),
             numericInput("group2EiStd", "Error Std. Dev. (Normal Dist.)", .3),
             numericInput("group2Alpha", "Change in utility mean when proposal fails.", .1)
             
      )),
             
    column(3,
      wellPanel(
        h2("Group 3"),
             numericInput("group3Size", "Size", 35),
             numericInput("group3UiMean", "Utility Mean (Normal Dist.)", .3),
             numericInput("group3UiStd", "Utility Std. Dev. (Normal Dist.)", .2),
             numericInput("group3EiMean", "Error Mean (Normal Dist.)", 0),
             numericInput("group3EiStd", "Error Std. Dev. (Normal Dist.)", .3),
             numericInput("group3Alpha", "Change in utility mean when proposal fails.", .1)
      )),     
        
    column(3,
      wellPanel(
        h2("All Groups"),
          numericInput("decisionCostPer", "Decision cost per round of voting.", .01)             
          
      )),
    
    
    column(3,
      wellPanel(
        h2("Model Parameters"),
             numericInput("numIter", "Number of Iterations", 100),
             numericInput("maxProposals", "Maximum proposals allowed in a series.", 1000)
      )),
    
    column(3,
           wellPanel(
              actionButton("runSim", label = "Run Simulation")
           )),
           
    column(7,
           plotOutput('plotBest')
    ), #ends column 9
    
    column(7,
           plotOutput('plotMean')
    ), #ends column 9
    
    column(7,
           plotOutput('plotWorst')
    ) #ends column 9
    
    ) # Ends FLuid Row
    
  ) #Ends Fluid Page
  
) #ends Shiny ui
