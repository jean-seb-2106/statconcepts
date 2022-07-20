#' effet_structure UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_effet_structure_ui <- function(id){
  ns <- NS(id)


  tabPanel(
    "Effet de structure",

    fluidRow(

      h2("Situation initiale"),

      column(3,wellPanel(

      selectInput(ns("select1"),
                  "Première base de données",
                  choices = c("Grandile","Petitile")),

      selectInput(ns("select2"),
                  "Deuxième base de données",
                  choices = c("Grandile","Petitile"),selected = "Petitile"),

      selectInput(ns("select3"),
                  "Caractère quantitatif",
                  choices = c("REVENU","AGE")),

      selectInput(ns("select4"),
                  "Caractère qualitatif",
                  choices = c("SEXE","PCS")),

      actionButton(ns("go1"),"Afficher les tableaux")



    )),
    column(4,wellPanel(h3("Grandile"),tableOutput(ns("tab1")))),
    column(4,wellPanel(h3("Petitile"),tableOutput(ns("tab2"))))

    ),


    fluidRow(h2("Effet de structure"),

             column(3,wellPanel(


               sliderInput(ns("slide1"),
                           label = "Part d'une modalité (en %)",
                           min = 1,
                           max = 100,
                           value = 50),
               actionButton(
                 ns("go2"),
                 "Appliquer la structure")



             )),column(4,wellPanel(h3("Grandile avec structure de Petitile"),tableOutput(ns("tab3")))),column(4,wellPanel(h3("Petitile avec structure de Grandile"),tableOutput(ns("tab4")))))


    )

}

#' effet_structure Server Functions
#'
#' @noRd
mod_effet_structure_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns



    output$tab1 <- renderTable(
      shinipsum::random_table(nrow = 4,ncol = 6)
    )
    output$tab2 <- renderTable(
      shinipsum::random_table(nrow = 4,ncol = 6)
    )

    output$tab3 <- renderTable(
      shinipsum::random_table(nrow = 4,ncol = 6)
    )

    output$tab4 <- renderTable(
      shinipsum::random_table(nrow = 4,ncol = 6)
    )

  })
}

## To be copied in the UI
# mod_effet_structure_ui("effet_structure")

## To be copied in the server
# mod_effet_structure_server("effet_structure")
