
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

pacman::p_load(shiny, jsonlite)

data <- readRDS("data/data.rds")

shinyServer(function(input, output, session) {

  observe({
    
    json <- toJSON(data)
    
    session$sendCustomMessage(type = "myCallbackHandler", json)
    
  })
  
})
