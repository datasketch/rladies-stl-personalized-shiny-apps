
library(shiny)

ui <- fluidPage(
  h1("Hello"),
  tags$blockquote("Lorem teat tesatas tast at at eat"),
  div(style = "background-color: red;",
    p("Hello R Ladies"),
    h2("Subtitle")
  ),
  fluidRow(
    column(3,
      img(src="https://via.placeholder.com/150"),
           ),
    column(9,
           img(src="https://via.placeholder.com/450"),
    )
  )
)

server <- function(input, output, session){

}

shinyApp(ui, server)
