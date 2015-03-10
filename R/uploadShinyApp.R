# rm(list = ls(all = TRUE)) # clear the workspace
# 
# 
#  install.packages("devtools") ## Only has to be done once.
#   
#    library(devtools) ## Installs devtools so you can load non-Offical packages
# 
# # install.packages("shinyapps")
#   
#    library(shinyapps)
# 
# 
#  install_github(repo = "codeforReviewer/kMajorityRule") # Install the Package
#   
#    library(kMajorityRule) # Load the Package
# 
# 
# # Get Authorization Token from shinyapps.io 
# 
#    shinyapps::setAccountInfo(name='codeforreviewer', token='C61850EF681E0BF839E96DD7238712C4', secret='caTAvRV31r6hj2s+cl3eexCwkrSnWCYdyYLEWjX9')
# 
# 
# # Navigate to the inst directory where server.R and ui.R live.
# 
#   setwd("~/Documents/RDev/kMajorityRule/inst/kMajorityGUI")
# 
# # Deploy the app
# 
#   deployApp()
# 
