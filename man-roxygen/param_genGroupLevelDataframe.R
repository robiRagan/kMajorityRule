#' @param groupSize This is a vector that has a length of numberOfGroups. Each
#'   element indicates the number of voters in each group.
#' @param utilityDistribution The distribution the utility ui values will be
#'   drawn from. This can currently only be "normal".
#' @param utilityDistributionParameters The relevant parameters needed for the
#'   distribution provided as utilityDistribution. You must provide a pair of
#'   parameters for each group. For "normal" you must provide the mean and
#'   standard deviation.  For example for 5 groups and
#'   utilityDistribution="normal", you might provide
#'   c(-.7,.2,-.1,.2,0,.2,-.3,.2,.2,.2).
#' @param errorDistribution The distribution the error ei values will be drawn
#'   from. This can be "uniform", "normal".
#' @param errorDistributionParameters The relevant parameters needed for the
#'   distribution provided as errorDistribution. For "normal" you must provide
#'   the mean and standard deviation. For "uniform" you must provide the lower
#'   bound and upper bound. For example for 5 groups and
#'   errorDistribution="uniform", you might provide
#'   c(-.7,0,-.1,.3,0,.2,-.3,.2,-.2,.2).
#' @param groupPostFailingProposalMeanUiIncrease The amount the mean used to
#'   sample a group's ui goes up after a failing proposal. Must be entered as a
#'   string vector.
