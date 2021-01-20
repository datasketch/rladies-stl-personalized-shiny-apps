

library(shiny)


#IBM plex sans bold

custom_style <- "

.h1, h1 {
    font-size: 70px;
    margin-bottom: 38px;
}

.col-sm-4 {
    width: 33.33333333%;
    padding-top: 40px;
}
body{
background-color: #f5f5f5;
}

.row {
  padding-top: 20px;
}

.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #fff;
    text-align: center;
    border: 0px;
    border-radius: 0px;
}

.irs-min, .irs-max {
    color: #333;
    font-size: 16px;
    line-height: 1.333;
    text-shadow: none;
    top: 0;
    padding: 1px 3px;
    background: rgba(0,0,0,0.1);
    border-radius: 3px;
    -moz-border-radius: 3px;
    display: none;
}

.irs-from, .irs-to, .irs-single {
    color: #246fe0;
    font-size: 16px;
    line-height: 1.333;
    text-shadow: none;
    padding: 1px 3px 10px 3px;
    background: #ffffff;
    border-radius: 3px;
    -moz-border-radius: 3px;
    margin-top: -5px;
}

.irs-slider {
    top: 17px;
    width: 22px;
    height: 22px;
    border: 0px solid #AAA;
    background: #246fe0;
    border-radius: 27px;
    -moz-border-radius: 27px;
    box-shadow: 0px 0px 0px rgba(0,0,0,0.3);
    cursor: pointer;
}

.irs-bar {
    height: 8px;
    top: 25px;
    border-top: 0px solid #246fe0;
    border-bottom: 0px solid #246fe0;
    background: #246fe0;
}

.irs-line {
    height: 8px;
    top: 25px;
    background: #EEE;
    background: #ffffff;
    border: 1px solid #CCC;
    border-radius: 16px;
    -moz-border-radius: 16px;
}

.irs-grid-text {
    position: absolute;
    bottom: 0;
    left: 0;
    white-space: nowrap;
    text-align: center;
    font-size: 12px;
    line-height: 9px;
    padding: 0 3px;
    color: #000;
}

label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 15px;
    font-weight: 700;
}

"

ui <- fluidPage(
  #includeCSS("styles.css"),
  tags$style(custom_style),
  #titlePanel("Hello", br(),tags$span("Shiny!")),
  #h1("shinny!"),
  fluidRow(
  column(4,
         h1("Hello",br(),tags$span("Shiny!")),
         wellPanel(
           sliderInput(inputId = "bins",
                       label = "BINS",
                       min = 1,
                       max = 50,
                       value = 30)

         ),
  ),
  column(8,
         plotOutput(outputId = "distPlot")
  )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#246fe0", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })

}

shinyApp(ui, server)
