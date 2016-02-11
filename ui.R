
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  tags$h3("Eugene Brown"),

  fluidRow(class = "plot-row",
           column(12,
                  tags$div(id = "plot"))
           ),
  
  tags$ul(id = "dist_list",
            tags$li(id = "tri", "Triangular"),
            tags$li(id = "Normal", "Normal"),
            tags$li(id = "logis", "Logistic"),
            tags$li(id = "Exponential", "Exponential"),
            tags$li(id = "lognormal", "Lognormal"),
            tags$li(id = "Gamma", "Gamma")
            
          ),
  
  # Links to external files
  tags$head(tags$link(href="css/styles.css", rel="stylesheet")),
  tags$body(tags$script(src="js/g3/ebrown.g3.js", charset="utf-8")),
  tags$body(tags$script(src="//d3js.org/d3.v3.min.js", charset="utf-8")),
  tags$body(tags$script(src="js/script.js")),
  tags$head(tags$link(href='https://fonts.googleapis.com/css?family=Martel:200,300', rel='stylesheet', type='text/css'))
  
))
