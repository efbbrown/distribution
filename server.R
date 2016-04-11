
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

pacman::p_load(shiny, jsonlite)

source("make_data.R")

shinyServer(function(input, output, session) {

  observe({
    
    json <- toJSON(data)
    
    session$sendCustomMessage(type = "myCallbackHandler", json)
    
  })
  
})
