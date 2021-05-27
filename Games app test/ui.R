body <- fluidPage(
  fluidRow(
    column(width =3,
           dataInputUI("input"),
           reportUi("reportE")
    ),
    column(width =6,
           h4("Cantidad de jugadores promedio"),
           plotUi("plot")
    ),
    column(width = 3, 
           h4("Mejores momentos: Picos de cantidad de jugadores"), 
           valueboxmoduleUi("peak")
    )
  )
)

dashboardPage(
  dashboardHeader( title = "Top N Games"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(body)
)
             