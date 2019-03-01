require(shiny)
require(shinydashboard)
require(shinyjs)
require(shinyBS)
require(DT)
require(plotly)
require(shinythemes)

source("./helpers/helpers_ui.R", local = TRUE)$value

ui.files = list.files(path = "./ui", pattern = "*.R")
ui.files = paste0("ui/", ui.files)

for (i in seq_along(ui.files)) {
  source(ui.files[i], local = TRUE)
}

shinyUI(
  tagList(
    useShinyjs(),
    loading.screens,
    div(id = "app-content",
      navbarPage(title = div(img(src = "new_shiny_logo.png", height = 35)),
        theme = shinytheme("united"), id = "top-nav",
        tabPanel("Import", tabpanel.import,
          icon = icon("folder-open")),
        navbarMenu("Data", icon = icon("database"),
          tabPanel("Summary", tabpanel.summary,
            icon = icon("bar-chart")),
          tabPanel("Preprocessing", tabpanel.preprocessing,
            icon = icon("magic"))
        ),
        tabPanel("Report", tabpanel.report,
          icon = icon("book")),
        tabPanel(title = "hide_me"),
        tabPanel(title = "", icon = icon("github", "fa-lg"),
          value = "https://github.com/philipppro/shinyExplorer"),
        
        footer = tagList(
          includeScript("scripts/top-nav-links.js"),
          includeScript("scripts/app.js"),
          tags$link(rel = "stylesheet", type = "text/css",
            href = "custom.css"),
          tags$link(rel = "stylesheet", type = "text/css",
            href = "https://fonts.googleapis.com/css?family=Roboto"),
          tags$link(rel = "stylesheet", type = "text/css",
            href = "AdminLTE.css"),
          tags$footer(title = "", # align = "right",
            # tags$a(id = "show_help",
            # href = "https://github.com/mlr-org/mlr_shiny", target = "_blank",
            # div(id = "copyright-container",
            #   column(width = 6, align = "left",
            tags$p(id = "copyright",
              tags$img(icon("copyright")),
              2019,
              tags$a(href = "https://github.com/philipppro",
                target = "_blank", "Philipp Probst")
            ),
            tags$p(id = "help_toggler",
              bsButton(inputId = "show_help", label = "show help",
                type = "toggle", icon = icon("question-circle"))
            )
          )
        ), windowTitle = "shinyMlr"
      )
    )
  )
)
