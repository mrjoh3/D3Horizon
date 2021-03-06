#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#' @importFrom jsonlite toJSON
#'
#' @export
D3Horizon <- function(data, axis = NULL, horizon_height = 80, title = '', padding = 0, message = 'dev - testing', width = NULL, height = NULL, elementId = NULL) {

  stopifnot(class(data) %in% c('numeric', 'data.frame'))
  
  if (class(data) == 'numeric') {
    data <- list(name = title, values = data)
  } else {
    data <- lapply(colnames(data), function(x){list(name = x, values = data[[x]])})
  } 
  
  data <- toJSON(data, auto_unbox = TRUE)
  
  if (!is.null(axis)) {
    axis <- list(min = min(axis),
                 max = max(axis))
    axis <- toJSON(axis, auto_unbox = TRUE)
  }
  
  # forward options using x
  x = list(
    message = message,
    data = data,
    axis = axis,
    padding = padding,
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
