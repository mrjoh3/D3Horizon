#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
D3Horizon <- function(data, horizon_height = 80, title = '', message = 'dev - testing', width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    message = message,
    data = data,
    title = title,
    horizon_height = horizon_height
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'D3Horizon',
    x,
    width = width,
    height = height,
    package = 'D3Horizon',
    elementId = elementId
  )
}

#' Shiny bindings for D3Horizon
#'
#' Output and render functions for using D3Horizon within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a D3Horizon
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name D3Horizon-shiny
#'
#' @export
D3HorizonOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'D3Horizon', width, height, package = 'D3Horizon')
}

#' @rdname D3Horizon-shiny
#' @export
renderD3Horizon <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, D3HorizonOutput, env, quoted = TRUE)
}
