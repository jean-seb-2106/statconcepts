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
                    # choices = NULL),
                    choices = c("Grandile","mtcars"),selected = NULL),

        actionButton(ns("go1"),"Mettre à jour"),

        br(),
        br(),

        selectInput(ns("select2"),
                    "Choisir une variable quantitative",
                    choices = NULL),
        selectInput(ns("select3"),"Choisir un graphique",choices = NULL),

        actionButton(ns("go2"),"Afficher la distribution")


      )),


      column(5,wellPanel(h3("Distribution 1"),plotOutput(ns("plot1")))),


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


        column(5,wellPanel(h3("Distribution 2"),plotOutput(ns("plot2")))),



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

#
      local <- reactiveValues(dt = NULL)
      local2 <- reactiveValues(dt=NULL,var=NULL,graph=NULL)


      #Bouton qui selectionne les variables quantitatives
      observeEvent(input$go1,{

        local$dt <- if (input$select1 == "Grandile"){
          global$dt1
        } else if (input$select1=="mtcars"){
          global$dt2
        }
        updateSelectInput(
          session = session,
          inputId = "select2",
          choices = select_class_df(local$dt,"numeric")
        )

        updateSelectInput(
          session = session,
          inputId = "select3",
          choices = c("Histogramme","Box-Plot")
        )
      }
      )


      observeEvent(input$go2,{

        local2$dt <- local$dt
        local2$var <- input$select2
        local2$graph <- input$select3

      }
      )

output$plot1 <- renderPlot({
  # shinipsum::random_ggplot()
  validate(need(expr = !is.null(local2$dt),
                               message = "Choisir une variable et un type de graphique et cliquer pour afficher la distribution"))
  if (local2$graph=="Histogramme"){
  afficher_histo1(local2$dt,local2$var)
  }else{
      afficher_boxplot1(local2$dt,local2$var)
    }
})

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
