## Funciones ----

## agrega una variable que separa los n juegos con mayor cantidad promedio de jugadores de los otros
juegos_mas_populares <- function(df, var, n = 5) {
  df_temp <- df %>%
    group_by(fct_lump(gamename, n = n, w = {{ var }}/n())) %>%  
    summarize(Count = sum({{ var }}))
  
  df %>% 
    mutate(
      gameName = if_else(!(gamename %in% df_temp[[1]]), 
                         "Otros", 
                         gamename))
}
## genera un line plot. 
plotf <- function(df,legend.position,legend.direction) {
  ggplot(df) +
    aes(x = mont_year, y = avg, colour = gameName) +
    geom_line(size = 2L) +
    scale_color_brewer(palette = "BrBG")  +
    theme(panel.grid.major = element_line(linetype = "dashed"),
          panel.grid.minor = element_line(linetype = "dashed"),
          legend.text = element_text(size = 11),
          panel.background = element_rect(fill = NA),
          plot.background = element_rect(fill = "lightskyblue4")) + theme(axis.text = element_text(face = "bold", 
           colour = "black"), plot.background = element_rect(linetype = "solid"), 
          legend.key = element_rect(fill = NA), 
          legend.background = element_rect(fill = "aquamarine4")) +labs(x = "Fecha", y = "Q players", colour = "Juegos:") +
            theme(legend.position = legend.position, legend.direction =legend.direction )
}