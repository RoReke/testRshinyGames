#reactiveConsole(TRUE)
function(input, output, session) {
  df <- dataServer("input")
  plotServer("plot",df)
  #browser()
  valueboxmoduleServer("peak", df)
 #browser()
  reportServer("reportE",df)
  }






