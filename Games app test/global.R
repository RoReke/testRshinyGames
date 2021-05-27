## Librerias ----
library(tidyverse)
library(shiny)
#library(shinyFeedback)
library(readr) 
library(shinyWidgets)
library(shinydashboard)
library(knitr)

## Data ----
url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv'
df_games <- readr::read_csv(url)
## Descripcion de variables ---- 

# variable	class	description
# gamename -	character	Name of video games
# year	- double	Year of measure
# month	- character	Month of measure
# avg	- double	Average number of players at the same time
# gain - double	Gain (or loss) Difference in average compared to the previous month (NA = 1st month)
# peak - double	Highest number of players at the same time
# avg_peak_perc	- character	Share of the average in the maximum value (avg / peak) in %

## Nuevas variables ----

df_games <- df_games %>% 
  mutate (
    mont_year = parse_date(paste(year,month, sep =  "-"),"%Y-%B ",locale=locale("en"))     
  )

## Modulos Y funciones----

source('modulos/valueboxmodule.R')
source('modulos/datamodule.R')
source('modulos/lineplotmodule.R')
source('modulos/reportmodule.R')
source('r/funciones.R')