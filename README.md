# KMajorityRule
## Replication Code for: An expected utility analysis of the optimal k-majority rule.

This is the repository for the replication code for the paper "An expected utility analysis of the optimal k-majority rule." The code is packaged as a Package for R. It also contains information about accessing the web GUI. 

There are *three ways that you can review the simulations* associated with the paper. The first two assume you have R installed. R is a free software program and you can aquire the basic version at one of these mirrors:

http://cran.stat.ucla.edu

http://cran.case.edu

http://cran.wustl.edu

## 1. Download the source code.

On the page https://github.com/codeForReviewer/kMajorityRule in the bottom corner you will see a button called "Download Zip" this will allow you to download the source code for the R Package. 

Once you have downloaded and unzipped the file you will find an R file called evaluateViaSource.R. This is a heavily commented file that will allow you to run the commands line by line necessary to replicate the figures in the paper.

## 2. Install the R Package (Recomended)
This is the simplest way to review the code and replicate the figures in the paper. Because this R Package is not an offical package reviewed by the offical R organization (CRAN) you need to install a package to R before you can install this package.

* Install R and run it.
* At the console prompt ">" type: install.packages("devtools")
* Now load devtools by typing at the console prompt ">": library(devtools)
* Now you can install the kMajorityCost package with: install.github("kMajorityRule")

## 3. View the Web Based GUI

A web based interface for running the simulations from the paper (and others). It can be quite slow, compared to running the simulations with the R Package on your own computer.

https://expectedutilityanalysis.shinyapps.io/kMajorityGUI/
