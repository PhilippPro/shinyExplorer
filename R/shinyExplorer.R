#' @title Run shinyMlr
#'
#' @description
#' Run a local instance of shinyMlr.
#'
#' @param ... [\code{any}]\cr
#'   Additional arguments passed to shiny's
#'   \code{runApp()} function.
#' @examples
#' \dontrun{
#'   shinyExplorer()
#' }
#' @import shiny
#' @import shinythemes
#' @export
shinyExplorer = function(...) {
  appDir = system.file("shinyExplorer", package = "shinyExplorer")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `shinyExplorer`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
