
library(shiny)

ui <- fluidPage(

  tags$head(
    tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');

      time {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }

    "))
  ),

  tags$article(

  div(class = "time",
      tags$time("Some date")
      )
  )
)

server <- function(input, output, session){

}

shinyApp(ui, server)
