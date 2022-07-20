#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(

      h1("Les concepts en statistique"),

      navbarPage(

          "Concepts stats",


                mod_valeurs_extremes_ui("valeurs_extremes"),

                mod_effet_structure_ui("effet_structure"),

                mod_redistribution_ui("redistribution"),

                mod_classes_ui("classes"),

                mod_classes_biv_ui("classes_biv")

                 )


    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "statconcepts"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
