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

                     column(3,wellPanel(h4("Indice de Gini"),verbatimTextOutput(ns("text1"))),wellPanel(h4("Minimum"),verbatimTextOutput(ns("text2"))),wellPanel(h4("Maximum"),verbatimTextOutput(ns("text3"))),wellPanel(h4("Rapport interdécile"),verbatimTextOutput(ns("text4"))),wellPanel(h4("Médiane"),verbatimTextOutput(ns("text5")))))

           )


}

#' redistribution Server Functions
#'
#' @noRd
mod_redistribution_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot1 <- renderPlot({

      shinipsum::random_ggplot()

    })

    output$text1 <- renderText({

      shinipsum::random_text(nchars = 4)

    })

    output$text2 <- renderText({

      shinipsum::random_text(nchars = 4)

    })

    output$text3 <- renderText({

      shinipsum::random_text(nchars = 4)

    })

    output$text4 <- renderText({

      shinipsum::random_text(nchars = 4)

    })

    output$text5 <- renderText({

      shinipsum::random_text(nchars = 4)

    })



  })
}

## To be copied in the UI
# mod_redistribution_ui("redistribution")

## To be copied in the server
# mod_redistribution_server("redistribution")
