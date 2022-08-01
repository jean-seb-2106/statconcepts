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


      column(4,

             fluidRow(column(6,wellPanel(h4("Moyenne"),verbatimTextOutput(ns("text1")))),column(6,wellPanel(h4("Médiane"),verbatimTextOutput(ns("text2"))))),
             fluidRow(column(6,wellPanel(h4("Ecart-Type"),verbatimTextOutput(ns("text3")))),column(6,wellPanel(h4("Coeff variation (en %)"),verbatimTextOutput(ns("text4")))))



             # fluidRow(wellPanel(h2("Moyenne"),verbatimTextOutput(ns("text1")))),
             # fluidRow(wellPanel(h2("Médiane"),verbatimTextOutput(ns("text2")))),
             # fluidRow(wellPanel(h2("Ecart-Type"),verbatimTextOutput(ns("text3")))),
             # fluidRow(wellPanel(h2("Ecart-Type"),verbatimTextOutput(ns("text4"))))


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
                                  ns("go3"),
                                  "Ajouter des valeurs extrêmes")




                                )

                      ),


        column(5,wellPanel(h3("Distribution 2"),plotOutput(ns("plot2")))),



        column(4,


               fluidRow(column(6,wellPanel(h4("Moyenne"),verbatimTextOutput(ns("text5")))),column(6,wellPanel(h4("Médiane"),verbatimTextOutput(ns("text6"))))),
               fluidRow(column(6,wellPanel(h4("Ecart-Type"),verbatimTextOutput(ns("text7")))),column(6,wellPanel(h4("Coeff variation (en %)"),verbatimTextOutput(ns("text8")))))


#
#                fluidRow(wellPanel(h2("Moyenne"),verbatimTextOutput(ns("text5")))),
#                fluidRow(wellPanel(h2("Médiane"),verbatimTextOutput(ns("text6")))),
#                fluidRow(wellPanel(h2("Ecart-Type"),verbatimTextOutput(ns("text7")))),
#                fluidRow(wellPanel(h2("Coeff variation"),verbatimTextOutput(ns("text8"))))


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

      local2 <- reactiveValues(dt=NULL,var=NULL,graph=NULL)

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

output$text1 <- renderText({
  req(local2$dt)
  calculer_indicateurs1(df = local2$dt,var = local2$var)["Moyenne"] %>% formater_indicateurs1()
}
)



output$text2 <- renderText({
  req(local2$dt)
  calculer_indicateurs1(df = local2$dt,var = local2$var)["Médiane"] %>% formater_indicateurs1()
}
)

output$text3 <- renderText(
  {
    req(local2$dt)
    calculer_indicateurs1(df = local2$dt,var = local2$var)["Ecart-type"] %>% formater_indicateurs1()
  }
  # shinipsum::random_text(nchars = 10)
)

output$text4 <- renderText(
  {
    req(local2$dt)
    calculer_indicateurs1(df = local2$dt,var = local2$var)["Coeff de variation (en %)"] %>% formater_indicateurs1()
  }
  # shinipsum::random_text(nchars = 10)
)


#Partie avec les valeurs extrêmes

local3 <- reactiveValues(num = NULL,nb = NULL,var=NULL)

observeEvent(input$go3,{

  local3$nb <- input$slide1
  local3$var <- local2$var
  local3$num <- ajouter_valeurs_extremes(df = local2$dt,num = local3$var,nb = local3$nb)


})

output$plot2 <- renderPlot({
  validate(need(expr = !is.null(local3$nb),
                message = "Choisir une variable et un type de graphique et cliquer pour afficher la distribution"))
  # shinipsum::random_ggplot()

  if (local2$graph=="Histogramme"){
    afficher_histo2(inputselect = local3$var,num = local3$num)
  }else{
    afficher_boxplot2(inputselect = local3$var,num = local3$num)
  }


}
)

output$text5 <- renderText(
  {
    req(local3$nb)
    calculer_indicateurs2(num = local3$num)["Moyenne"] %>% formater_indicateurs1()
  }
  # shinipsum::random_text(nchars = 10)
)

output$text6 <- renderText(
  {
    req(local3$nb)
    calculer_indicateurs2(num = local3$num)["Médiane"] %>% formater_indicateurs1()
  }
  # shinipsum::random_text(nchars = 10)
)

output$text7 <- renderText({
  req(local3$nb)
  calculer_indicateurs2(num = local3$num)["Ecart-type"] %>% formater_indicateurs1()
}
  # shinipsum::random_text(nchars = 10)
)

output$text8 <- renderText({
  req(local3$nb)
  calculer_indicateurs2(num = local3$num)["Coeff de variation (en %)"] %>% formater_indicateurs1()
}

  # shinipsum::random_text(nchars = 10)
)

  })
}

## To be copied in the UI
# mod_valeurs_extremes_ui("valeurs_extremes")

## To be copied in the server
# mod_valeurs_extremes_server("valeurs_extremes")
