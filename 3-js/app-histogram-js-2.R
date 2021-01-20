
library(shiny)
library(shinyjs)

ui <- fluidPage(

  titlePanel("Hello Shiny!"),
  shinyjs::useShinyjs(),
  sidebarLayout(
    sidebarPanel(
      actionButton("hide_histogram", "Hide histogram"),
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 20,
                  value = 10),
      hidden(
      sliderInput(inputId = "index",
                  label = "Index",
                  min = 1,
                  max = 250,
                  value = 100)
      )
    ),
    mainPanel(
      plotOutput(outputId = "distPlot"),
      hidden(plotOutput(outputId = "distPlot2"))
    )
  )
)


server <- function(input, output) {

  observeEvent(input$hide_histogram,{
    # shinyjs::hide("bins")
    # shinyjs::hide("distPlot")
    shinyjs::toggle("bins")
    shinyjs::toggle("distPlot")
    shinyjs::toggle("index")
    shinyjs::toggle("distPlot2")

  })

  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })

  output$distPlot2 <- renderPlot({
    x    <- faithful$waiting[1:input$index]
    plot(x)
  })

}

shinyApp(ui, server)
