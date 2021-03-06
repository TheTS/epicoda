% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_transfers.R
\name{plot_transfers}
\alias{plot_transfers}
\title{plot_transfers: Plots model predictions.}
\usage{
plot_transfers(
  from_part,
  to_part,
  model,
  dataset,
  comp_labels,
  terms = TRUE,
  fixed_values = NULL,
  transformation_type = "ilr",
  comparison_part = NULL,
  part_1 = NULL,
  yllimit = NULL,
  yulimit = NULL,
  xllimit = NULL,
  xulimit = NULL,
  y_label = NULL,
  plot_log = FALSE,
  lower_quantile = 0.05,
  upper_quantile = 0.95,
  units = "unitless",
  specified_units = NULL,
  rounded_zeroes = TRUE,
  det_limit = NULL,
  granularity = 10000,
  point_specification = ggplot2::geom_point(size = 2),
  error_bar_colour = "grey",
  theme = NULL,
  cm = NULL
)
}
\arguments{
\item{from_part}{Should be an element of \code{comp_labels}.}

\item{to_part}{Should be an element of \code{comp_labels}. Should have compositional mean less than \code{from_part}.}

\item{model}{Model to use in generating predictions.}

\item{dataset}{Should be dataset used to develop \code{model}.}

\item{comp_labels}{The labels of the compositional columns.}

\item{terms}{Are estimates for differences in outcome associated with differences in compositional variables? If \code{terms = TRUE} all estimates and plots will be for difference in outcome associated with differences in the compositional variables. If \code{terms = FALSE}, \code{fixed_values} is used to set the values of the non-compositional covariates, and outputs are predictions for the outcome based on these values of the non-compositional covariates and the given value of the compositional variables (and confidence intervals include uncertainty due to all variables in the model, not just the compositional variables). If the model uses splines (from \code{comp_spline_model}), \code{terms} must be set to \code{FALSE}.}

\item{fixed_values}{If \code{terms = FALSE}, this is used as giving the fixed values of the non-compositional covariates at which to calculate the prediction. If it is not set, it can be automatically generated.}

\item{transformation_type}{The type of transformation desired. Should be \code{"ilr", "alr"} or \code{"clr"}.}

\item{comparison_part}{Only needed for alr transformation. Should be an element of \code{comp_labels}. Name of part that all other parts will be compared to.}

\item{part_1}{Only used if First part in ilr-pivot coordinate transformation. Passed to \code{alter_order_comp_labels} unless \code{NULL}.}

\item{yllimit}{Lower limit to show on y-axis on plot.}

\item{yulimit}{Upper limit to show on y-axis on plot.}

\item{xllimit}{Lower limit to show on x-axis on plot. Should be in same scale as \code{units}.}

\item{xulimit}{Upper limit to show on x-axis on plot. Should be in same scale as \code{units}.}

\item{y_label}{Label for y-axis on plot.}

\item{plot_log}{If this is \code{TRUE}, the y-axis will be log-transformed.}

\item{lower_quantile}{See \code{vary_time_of_interest} and \code{make_new_data}}

\item{upper_quantile}{See \code{vary_time_of_interest} and \code{make_new_data}}

\item{units}{What should the units of the compositional variables be in any output? Currently available are "unitless" (where working in terms of proportions), "hr/day", "hr/wk", "min/day", "min/wk" and "specified", in which case the \code{specified_units} argument should be set. Note that this doesn't specify the input units, as this is not relevant for any function.}

\item{specified_units}{If units are being specified via the composition sum, this is where it is done. It should be a vector where the first argument is a string describing the units, and the second argument is the expected sum of a composition e.g. \code{c("hr/day", 24)}}

\item{rounded_zeroes}{Are zeroes rounded zeroes?}

\item{det_limit}{Detection limit if zeroes are to be imputed. This must be set if \code{rounded_zeroes} is \code{TRUE} and should be the
minimum measurable value in the compositional columns of data. It should be on the same scale as the (input) compositional columns in \code{dataset} (NB it doesn't need to match \code{new_data}).}

\item{granularity}{Doesn't usually need setting. Parameter indicating how many predictions to make. If too low, plotted curve has gaps. If too high, calculation is slow.}

\item{point_specification}{Should be a \code{ggplot2::geom_point} object specifying how the points on the graph will be plotted.}

\item{error_bar_colour}{Should be an R-recognised colour, specified by name in quotation marks.}

\item{theme}{Optional \code{theme} argument which can be set as a \code{ggplot2::theme} object and will control how the plot appears.}

\item{cm}{Can be set with compositional mean to speed up calculation. As it is easy to make mistakes using this, this should not be set manually and should only be passed from other functions.}
}
\value{
Plot with balance of two parts plotted as exposure/ independent variable.
}
\description{
Plots model predictions for transfers between the given parts.
}
\examples{

lm_outcome <- comp_model(type = "linear",
outcome = "linear_outcome",
covariates = c("agegroup", "sex"),
data = simdata,
comp_labels = c("partA", "partB", "partC", "partD", "partE"))


 epicoda::plot_transfers(from_part = "partD",
to_part = "partA",
model = lm_outcome ,
dataset = simdata,
transformation_type = "ilr",
comp_labels = c("partA", "partB", "partC", "partD", "partE"),
y_label = "Model-predicted outcome",
units = "hr/day",
terms = TRUE)

}
