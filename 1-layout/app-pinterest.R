library(shiny)

# https://codepen.io/ramenhog/pen/dvZVda
ui <- fluidPage(
  #suppressDependencies("bootstrap"),
  includeCSS("styles.css"),
  div(class = "masonry",
      div(class = "item",
          div(class = "item__content",
              #img(src = "https://via.placeholder.com/300x200"),
              #h1("hello")
          )
      ),
      div(class = "item",
          div(class = "item__content item__content--small",
              #img(src = "https://via.placeholder.com/300x400"),
              #h1("hello")
          )
      ),
      div(class = "item",
          div(class = "item__content",
              #img(src = "https://via.placeholder.com/150"),
              #h1("hello")
          )
      ),
      div(class = "item",
          div(class = "item__content item__content--medium",
              #img(src = "https://via.placeholder.com/300x400"),
              #h1("hello")
          )
      ),
      div(class = "item",
          div(class = "item__content item__content--large",
              #img(src = "https://via.placeholder.com/300x150"),
              #h1("hello")
          )
      )
  )
)

server <- function(input, output, session){

}

shinyApp(ui, server)

