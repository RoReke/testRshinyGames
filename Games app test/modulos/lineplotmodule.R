plotUi <- function(id) {
           plotOutput(NS(id,"populargames"))
  }

plotServer <- function(id,df) {
  moduleServer(id, function(input, output, session) {
  
    output$populargames <- renderPlot(
      plotf(df(),"right","vertical"))
  })
}