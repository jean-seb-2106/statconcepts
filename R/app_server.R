#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  global <- reactiveValues(dt1 = grandile,dt2 = mtcars,dt3=dplyr::starwars,dt4=petitile)

  mod_valeurs_extremes_server("valeurs_extremes",global=global)

  mod_effet_structure_server("effet_structure")

  mod_redistribution_server("redistribution",global=global)

  mod_classes_server("classes",global=global) #classe univariée

  mod_classes_biv_server("classes_biv")

}
