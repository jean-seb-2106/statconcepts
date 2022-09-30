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

                            fluidRow(wellPanel(


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





                            ),wellPanel(

                              selectInput(ns("select4"),
                                            "Choisir une redistribution",
                                            choices = c("Augmenter les inégalités","Diminuer les inégalités")
                                            ),

                              sliderInput(ns("slide1"),
                                          label = "Part (en %)",
                                          min = 1,
                                          max = 99,
                                          value = 50),

                              actionButton(ns("go3"),"Calculer")


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

    local <- reactiveValues(dt = NULL,dt2 = NULL,var = NULL)



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

    observeEvent(input$go2,{

      local$dt2 <- local$dt
      local$var <- input$select3
      local$ineg <- NULL

    })


    observeEvent(input$go3,{

      local$dt3 <- local$dt2
      local$var2 <- local$var
      local$ineg <- if(input$select4 == "Augmenter les inégalités"){
        FALSE
        }else{
          TRUE
        }
      local$tx <- input$slide1
      local$num <- modifier_repartition2(df = local$dt3,slideinput = local$var2,dimin = local$ineg,tx = local$tx)

    })

    output$plot1 <- renderPlot({

      validate(need(expr = !is.null(local$var),
                    message = "Choisir une variable et cliquer pour afficher la courbe de Lorenz"))

if (is.null(local$ineg)){
  afficher_courbe_lorenz(local$dt2,local$var)
}
      else{
        afficher_courbe_lorenz2(varnum = local$num,varnumlib = local$var2)
      }

    })

    output$text1 <- renderText({

      req(local$dt2)
      if (is.null(local$ineg)){
      x <- calculer_indicateurs_redistrib(local$dt2,local$var)

      }else{
        x <- calculer_indicateurs_redistrib_vect(local$num)
      }
      formater_indicateurs1(x)["Indice de Gini"]
      # shinipsum::random_text(nchars = 4)

    })

    output$text2 <- renderText({

      req(local$dt2)
      if (is.null(local$ineg)){
        x <- calculer_indicateurs_redistrib(local$dt2,local$var)

      }else{
        x <- calculer_indicateurs_redistrib_vect(local$num)
      }
      formater_indicateurs1(x)["Minimum"]
      # shinipsum::random_text(nchars = 4)

    })

    output$text3 <- renderText({

      req(local$dt2)
      if (is.null(local$ineg)){
        x <- calculer_indicateurs_redistrib(local$dt2,local$var)

      }else{
        x <- calculer_indicateurs_redistrib_vect(local$num)
      }
      formater_indicateurs1(x)["Maximum"]
      # shinipsum::random_text(nchars = 4)

    })

    output$text4 <- renderText({

      req(local$dt2)
      if (is.null(local$ineg)){
        x <- calculer_indicateurs_redistrib(local$dt2,local$var)

      }else{
        x <- calculer_indicateurs_redistrib_vect(local$num)
      }
      formater_indicateurs1(x)["Rapport inter-décile"]
      # shinipsum::random_text(nchars = 4)

    })

    output$text5 <- renderText({

      req(local$dt2)
      if (is.null(local$ineg)){
        x <- calculer_indicateurs_redistrib(local$dt2,local$var)

      }else{
        x <- calculer_indicateurs_redistrib_vect(local$num)
      }
      formater_indicateurs1(x)["Médiane"]
      # shinipsum::random_text(nchars = 4)

    })



  })
}

## To be copied in the UI
# mod_redistribution_ui("redistribution")

## To be copied in the server
# mod_redistribution_server("redistribution")
