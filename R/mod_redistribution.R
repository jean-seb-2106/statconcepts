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
                                          "1 - Choisir une base de données",
                                          choices = c("Grandile","Petitile")),

                              actionButton(ns("go1"),"Extraire les quantitatives"),

                              br(),
                              br(),

                              selectInput(ns("select2"),
                                          "2 - Sélectionner les variables cumulables",
                                          choices = NULL,multiple = TRUE),


                              selectInput(ns("select3"),
                                          "3 - Choisir la variable à étudier",
                                          choices = NULL),

                              actionButton(ns("go2"),"Afficher la courbe de Lorenz")





                            ),h2("Redistribution"),wellPanel(

                              selectInput(ns("select4"),
                                                                         "Choisir une redistribution",
                                                                         choices = c("Augmenter les inégalités","Diminuer les inégalités")),

                              sliderInput(ns("slide1"),
                                          label = "Part (en %)",
                                          min = 1,
                                          max = 100,
                                          value = 10),

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
mod_redistribution_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    local <- reactiveValues(dt = NULL)



    #Bouton qui selectionne les variables quantitatives
    observeEvent(input$go1,{

      local$dt <- if (input$select1 == "Grandile"){
        global$dt1
      } else if (input$select1=="Petitile"){
        global$dt4
      }
      updateSelectInput(
        session = session,
        inputId = "select2",
        choices = select_class_df(local$dt,"numeric")
      )

    }
    )

    observeEvent(input$select2,{
      updateSelectInput(
        session = session,
        inputId = "select3",
        choices = input$select2
      )


    })


    output$plot1 <- renderPlot({

      validate(need(expr = !is.null(local$dt),
                    message = "Choisir une variable et cliquer pour afficher la distribution"))


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
