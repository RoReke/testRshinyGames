dataInputUI <- function(id) {
          box(width = 400, title =tagList(shiny::icon("filter",class = 'fa-lg'), "Filtros") ,
             solidHeader = T, collapsible = T, status = 'primary',
             numericInput(NS(id,"n"), "Elegir Top n Juegos:", value = 3, min = 1, max = 100),
             pickerInput(NS(id,'game'),'Elegir juego/s','',  
                         multiple = TRUE, options = list(`actions-box` = TRUE), width = NULL ),
             sliderInput(NS(id,"time"), "Elegir rango de fechas", 
                         min = min(df_games$mont_year),
                         max = max(df_games$mont_year),
                         value=c(min(df_games$mont_year),max(df_games$mont_year)),
                         timeFormat="%b %Y")
         )
}

dataServer <- function(id) {
  moduleServer(id, function(input, output, session) {

    df_games_reactive <- reactive({
      req(input$n)
      g_df <- juegos_mas_populares(df_games, avg, input$n ) 
    })
    
    df_games_reactive_2 <- reactive({
      req(input$n)
      req(input$game)
      df_games_reactive() %>% 
        filter (gameName %in% input$game) %>% 
        filter (mont_year >= input$time[[1]] & mont_year <= input$time[[2]])
       })
    
    gamesName <- reactive(
      unique(df_games_reactive()$gameName))

    observeEvent(input$n,{
      updatePickerInput(session, 
                        "game",
                        choices =   gamesName(),
                        selected = gamesName()
      )
    })
    return(df_games_reactive_2)
  })
}



  