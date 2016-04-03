
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  HTML(
    '<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="http://www.genebrown.info">Home</a>
    </div>
    <!-- <div class="navbar-title center">Distribution</div> -->
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
    <li>
    <a href="mailto:efbbrown@gmail.com" title="Email Me"><img class="link-icon" src="imgs/email.png"></a>
    </li>
    <li>
    <a href="https://github.com/efbbrown" title="GitHub"><img class="link-icon" src="imgs/GitHub-Mark-Light-32px.png"></a>
    </li>
    <li>
    <a href="https://www.linkedin.com/in/eugene-brown-a9435773" title="LinkedIn"><img class="link-icon" src="imgs/In-White-34px-R.png"></a>
    </li>
    </ul>
    </div>
    <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
    </nav>'
  ),
  
  # tags$h3(tags$div("Distribution")),

  tags$div(id = "plot"),
  
  tags$div(class = "container-menu",
    tags$ul(id = "dist_list",
            tags$li(id = "tri", "Triangular"),
            tags$li(id = "Normal", "Normal"),
            tags$li(id = "logis", "Logistic"),
            tags$li(id = "Exponential", "Exponential"),
            tags$li(id = "lognormal", "Lognormal"),
            tags$li(id = "Gamma", "Gamma")
            
    )
  ),
  
  # Links to external files
  tags$head(
    tags$title("Eugene Brown's Portfolio"),
    HTML('<meta http-equiv="X-UA-Compatible" content="IE=edge">'),
    tags$link(rel="icon", href="imgs/favicon.ico"),
    tags$link(href="css/styles.css", rel="stylesheet"),
    tags$link(href='https://fonts.googleapis.com/css?family=Martel:200,300', rel='stylesheet', type='text/css')
  ),
  
  tags$body(
    tags$script(src="js/g3/ebrown.g3.js", charset="utf-8"),
    tags$script(src="//d3js.org/d3.v3.min.js", charset="utf-8"),
    tags$script(src="js/script.js")
  )
  
))
