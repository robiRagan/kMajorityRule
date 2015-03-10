library(shiny)

shinyUI(fluidPage(
  
  titlePanel("kMajority Rule Simulation"),
  
  fluidRow(
    column(10,
           p("This is the GUI interface for replicating the simulations in the paper",
             em("An expected utility analysis of the optimal k-majority rule")),
          h3("Replication Code:"),
           p("You can view and download the source code, as well as find instructions for installing the R package developed for the paper here:",
             a("GitHub for kMajorityRule.", 
               href = "https://github.com/codeForReviewer/kMajorityRule")),
          h4("A Note on the Number of Groups:"),
          p("This GUI allows a user to run simulations with 1, 2 or 3 groups. The", a("kMajorityRule R Package", href = "https://github.com/codeForReviewer/kMajorityRule"), "allows a user to run simulations with more than 3 groups.")
           )
  ),
    
  fluidRow( 
    column(3,
      checkboxInput("group1", "Use Group 1", value=TRUE),
        conditionalPanel(
          condition = "input.group1 == true",
      wellPanel(
        h2("Group 1"),
             numericInput("group1Size", "Size", 35),
             selectInput("group1UiDist", label = "Utility Distribution", 
                    choices = list("Normal" = "normal"), 
                    selected = "normal"),
             numericInput("group1UiMean", "Utility Mean", -.3),
             numericInput("group1UiStd", "Utility Std. Dev.", .2),
             selectInput("group1EiDist", label = "Error Distribution", 
                    choices = list("Normal" = "normal"), 
                    selected = "normal"),
             numericInput("group1EiMean", "Error Mean", 0),
             numericInput("group1EiStd", "Error Std. Dev.", .3),
             textInput("group1Alpha", "Change in utility mean when proposal fails.", .1)
      ))),
             
    column(3,
      checkboxInput("group2", "Use Group 2", value=TRUE),
           conditionalPanel(
             condition = "input.group2 == true",
        wellPanel(
        h2("Group 2"),
             numericInput("group2Size", "Size", 30),
             selectInput("group2UiDist", label = "Utility Distribution", 
                    choices = list("Normal" = "normal"), 
                    selected = "normal"),
             numericInput("group2UiMean", "Utility Mean", 0),
             numericInput("group2UiStd", "Utility Std. Dev.", .2),
             selectInput("group2EiDist", label = "Error Distribution", 
                    choices = list("Normal" = "normal"), 
                    selected = "normal"),
             numericInput("group2EiMean", "Error Mean", 0),
             numericInput("group2EiStd", "Error Std. Dev.", .3),
             textInput("group2Alpha", "Change in utility mean when proposal fails.", .1)
             
      ))),
             
    column(3,
      checkboxInput("group3", "Use Group 3", value=TRUE),
        conditionalPanel(
         condition = "input.group3 == true",
      wellPanel(
        h2("Group 3"),
             numericInput("group3Size", "Size", 35),
             selectInput("group3UiDist", label = "Utility Distribution", 
                    choices = list("Normal" = "normal"), 
                    selected = "normal"),
             numericInput("group3UiMean", "Utility Mean", .3),
             numericInput("group3UiStd", "Utility Std. Dev.", .2),
            selectInput("group3EiDist", label = "Error Distribution", 
                    choices = list("Normal" = "normal"), 
                    selected = "normal"),
             numericInput("group3EiMean", "Error Mean", 0),
             numericInput("group3EiStd", "Error Std. Dev.", .3),
             textInput("group3Alpha", "Change in utility mean when proposal fails.", .1)
      ))),
    
        
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
    ), #ends column 7
    
    column(7,
           plotOutput('plotMean')
    ), #ends column 7
    
    column(7,
           plotOutput('plotWorst')
    ) #ends column 7
  ) # Ends FLuid Row
    
    

    
    


  
  
  
  ) #Ends Fluid Page
  
) #ends Shiny ui
