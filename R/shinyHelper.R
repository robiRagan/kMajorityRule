#' kMajorityGUI
#' 
#' Runs the kMajority GUI built with Shiny Server.
#'
#'
kMajorityGUI <- function(){shiny::runApp(system.file('kMajorityGUI', package='kMajorityRule'),launch.browser = TRUE)}