#' redistribution UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_redistribution_ui <- function(id){
  ns <- NS(id)

  tabPanel("Redistribution",

           fluidPage(column(3,

                            fluidRow(h2("Situation initiale"),wellPanel(


                              selectInput(ns("select1"),
                                          "Choisir une base de données",
                                          choices = c("Grandile","Petitile")),

                              selectInput(ns("select2"),
                                          "Choisir une variable quantitative",
                                          choices = c("REVENU","PATRIMOINE")),

                              actionButton(ns("go1"),"Afficher")



                            ),h2("Redistribution"),wellPanel(

                              selectInput(ns("select3"),
                                                                         "Choisir une redistribution",
                                                                         choices = c("Augmenter les inégalités","Diminuer les inégalités")),

                              sliderInput(ns("slide1"),
                                          label = "Part (en %)",
                                          min = 1,
                                          max = 100,
                                          value = 50),

                              actionButton(ns("go2"),"Calculer")


                              )
                            )

                            ),

                     column(5,wellPanel(h3("Courbe de Lorenz"),plotOutput(ns("plot1")))),

                     column(3,h4("Situation initiale"),wellPanel(h4("Indice de Gini")),h4("Après redistribution"),wellPanel(h4("Indice de Gini")),wellPanel(h4("Minimum")),wellPanel(h4("Maximum")),wellPanel(h4("Rapport interdécile")),wellPanel(h4("Médiane"))))

           )


}

#' redistribution Server Functions
#'
#' @noRd
mod_redistribution_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot1 <- renderPlot(

      shinipsum::random_ggplot()
    )



  })
}

## To be copied in the UI
# mod_redistribution_ui("redistribution")

## To be copied in the server
# mod_redistribution_server("redistribution")
