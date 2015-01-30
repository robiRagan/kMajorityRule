#' @param numberOfIterations The number of iterations the model is run.
#' @param maximumNumberOfProposalsInASeries An intiger or FALSE. If an integer,
#'   it represents the maximum possible number of proposals considered by a
#'   group of voters in one series of votes. Note though, that even if if
#'   maximumNumberOfProposalsInASeries is set to an integer, that voting will
#'   still stop if a proposal passes for all kMajority Rules being considerd. To
#'   allow the series of proposals to anly stop once all kMajority Rules have
#'   passes a proposal, set maximumNumberOfProposalsInASeries=FALSE.
#' @param perProposalDecisionCost The total decision costs a group faced given
#'   the number of rounds (R) it took to pass the proposal. Must be entered as a
#'   vector of strings.
#' @param silentSeries TRUE silences all of the notifications from the running
#'   of a series of proposals like "The vote on the proposal in round 126 is
#'   complete. kMajorities that passed proposal: 84". FALSE prints all the
#'   notifications to the console as the series of proposals runs.
#' @param silentIterations TRUE silences the notification that an iteration is
#'   complete, like "iteration 9 is complete.". FALSE prints all the
#'   notifications to the console as the iterations run.
