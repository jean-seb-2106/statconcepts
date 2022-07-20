#' classes_biv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_classes_biv_ui <- function(id){
  ns <- NS(id)

  tabPanel("Classes 2",

           fluidPage(column(3,

                            wellPanel(

                              selectInput(ns("select1"),
                                          "Choisir une base de données",
                                          choices = c("Grandile","Petitile")),

                              selectInput(ns("select2"),
                                          "Caractère qualitatif",
                                          choices = c("SEXE","PCS")),

                              selectInput(ns("select3"),
                                          "Caractère quantitatif",
                                          choices = c("REVENU","PATRIMOINE")),

                              selectInput(ns("select4"),
                                          "Type de découpage en tranche",
                                          choices = c("Largeur fixe","Quantiles")),

                              sliderInput(
                                inputId = ns("slide1"),
                                label = "Nombre de tranches",
                                min = 1,
                                max = 40,
                                value = 4
                              ),

                              actionButton(ns("go1"),"Stat Bivariée")



                            )


                            ),column(5,

                                     fluidRow(wellPanel(h3("Tableau effectifs",tableOutput(ns("tab1"))))),
                                     fluidRow(wellPanel(h3("Tableau effectifs théoriques",tableOutput(ns("tab2")))))


                                     ),column(3,

                                              wellPanel(h3("Chi-2"),textOutput(ns("text1"))),
                                              wellPanel(h3("V de Cramer"),textOutput(ns("text2")))



                                              ))


           )


}

#' classes_biv Server Functions
#'
#' @noRd
mod_classes_biv_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$tab1 <- renderTable(
      shinipsum::random_table(nrow = 4,ncol = 6)
    )

    output$tab1 <- renderTable(
      shinipsum::random_table(nrow = 4,ncol = 6)
    )

    output$text1 <- renderText(
      shinipsum::random_text(nchars = 10)
    )

    output$text2 <- renderText(
      shinipsum::random_text(nchars = 10)
    )

  })
}

## To be copied in the UI
# mod_classes_biv_ui("classes_biv")

## To be copied in the server
# mod_classes_biv_server("classes_biv")
