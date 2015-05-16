#' calheatmapR for plotting a calendar heatmap
#'
#' R interface to interactive plotting using the
#' \href{https://github.com/kamisama/cal-heatmap}{cal-heatmap} Javascript library
#'
#' @param data a list object, each element's name is a timestamp in seconds, with
#' a corresponding number, see \href{http://kamisama.github.io/cal-heatmap/#data-format}{here}
#' for details.
#' @param attrs a list object containing various options for altering the output
#' of the calendar heatmap, see \href{http://kamisama.github.io/cal-heatmap/}{here}
#' for available options.  Not all options are available, so the function
#' \link{calheatmap_attrs} will create a list of defaults, that can then be altered by
#' the user.
#'
#' @import htmlwidgets
#'
#' @source D3.js was created by Mike Bostock, see \url{http://d3js.org}, and
#' cal-heatmap.js was created by Wan Qi Chen, see \url{https://github.com/kamisama/cal-heatmap}
#'
#' @export
calheatmapR <- function(data, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    data = data
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'calheatmapR',
    x,
    width = width,
    height = height,
    package = 'calheatmapR'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
calheatmapROutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'calheatmapR', width, height, package = 'calheatmapR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderCalheatmapR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, calheatmapROutput, env, quoted = TRUE)
}