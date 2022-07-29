#' valeurs_extremes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_valeurs_extremes_ui <- function(id){
  ns <- NS(id)


    tabPanel(
      "Valeurs extrêmes",

      fluidRow(

        h2("Situation initiale"),

        column(3,

                      wellPanel(


        selectInput(ns("select1"),
                    "Choisir une base de données",
                    choices = c("Grandile","Petitile")),

        selectInput(ns("select2"),
                    "Choisir une variable quantitative",
                    choices = c("REVENU","PATRIMOINE")),

        actionButton(ns("go1"),"Afficher la distribution")


      )),


      column(5,wellPanel(h3("Histogramme 1"),plotOutput(ns("plot1")))),


      column(3,

             fluidRow(wellPanel(h3("Moyenne"),verbatimTextOutput(ns("text1")))),
             fluidRow(wellPanel(h3("Médiane"),verbatimTextOutput(ns("text2")))),
             fluidRow(wellPanel(h3("Ecart-Type"),verbatimTextOutput(ns("text3"))))


             )


      ),



      fluidRow(

        h2("Ajout de valeurs extrêmes"),

        column(3,

                      wellPanel(


                        sliderInput(ns("slide1"),
                                            label = "Nombre de valeurs extrêmes",
                                            min = 1,
                                            max = 100,
                                            value = 1),
                        actionButton(
                                  ns("go1"),
                                  "Ajouter des valeurs extrêmes")




                                )

                      ),


        column(5,wellPanel(h3("Histogramme 2"),plotOutput(ns("plot2")))),



        column(3,


               fluidRow(wellPanel(h3("Moyenne"),verbatimTextOutput(ns("text4")))),
               fluidRow(wellPanel(h3("Médiane"),verbatimTextOutput(ns("text5")))),
               fluidRow(wellPanel(h3("Ecart-Type"),verbatimTextOutput(ns("text6"))))


               )
        )






      )




}

#' valeurs_extremes Server Functions
#'
#' @noRd
mod_valeurs_extremes_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

output$plot1 <- renderPlot(
  shinipsum::random_ggplot()
)

output$text1 <- renderPrint(
  shinipsum::random_print()
)

output$plot2 <- renderPlot(
  shinipsum::random_ggplot()
)

output$text2 <- renderText(
  shinipsum::random_text(nchars = 10)
)

output$text3 <- renderText(
  shinipsum::random_text(nchars = 10)
)

output$text4 <- renderText(
  shinipsum::random_text(nchars = 10)
)

output$text5 <- renderText(
  shinipsum::random_text(nchars = 10)
)

output$text6 <- renderText(
  shinipsum::random_text(nchars = 10)
)

  })
}

## To be copied in the UI
# mod_valeurs_extremes_ui("valeurs_extremes")

## To be copied in the server
# mod_valeurs_extremes_server("valeurs_extremes")
