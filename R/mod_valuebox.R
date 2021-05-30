
valueboxmoduleUi <- function(id) {
  uiOutput(NS(id, "V"))
}

valueboxmoduleServer <- function(id, df) {
  
  moduleServer(id, function(input, output, session) {
 
    df_games_reactive_3 <- reactive({  # arma df con el top 1 de juegos s/ "picos" 
      df() %>% 
        select(
          gameName,
          peak ,
         mont_year) %>% 
        group_by(
          gameName
        ) %>% 
        top_n(1,peak)
    })
      
  z <- function(var_name,valor){
    output[[paste0("value_box_",var_name)]] <- renderValueBox({
      
      valueBox(
        formatC(valor, format="d", big.mark=','),
        var_name,
        color = "olive"
      )
    })
    valueBoxOutput(NS(id, paste0("value_box_",var_name)),width = NULL)
   
     }
  output$V <- renderUI({
      pmap(list(paste(substr(df_games_reactive_3()$gameName,1,10),df_games_reactive_3()$mont_year,sep = " "), df_games_reactive_3()$peak), function(var_name,valor) z(var_name,valor))
  }
  #View(list(c("A","B","C"),c(2,1,50))) 
  )
  
 # observe(print(df_games_reactive_3()))
  })
 
}
