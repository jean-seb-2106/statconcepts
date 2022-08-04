#' classes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_classes_ui <- function(id){
  ns <- NS(id)



  tabPanel("Classes 1",

           fluidPage(column(3,

                            wellPanel(

                              selectInput(ns("select1"),
                                          "Choisir une base de données",
                                          choices = c("Grandile","mtcars")),

                              actionButton(ns("go1"),"Mettre à jour"),

                              br(),
                              br(),

                              selectInput(ns("select2"),
                                          "Caractère quantitatif",
                                          choices = NULL),

                              selectInput(ns("select3"),
                                          "Type de découpage en tranche",
                                          choices = NULL),

                              sliderInput(
                                inputId = ns("slide1"),
                                label = "Nombre de tranches",
                                min = 1,
                                max = 40,
                                value = 4
                              ),

                              actionButton(ns("go2"),"Afficher le graphique")







           )
           ),column(5,wellPanel(h3("Histogramme"),plotOutput(ns("plot1")))),column(3,wellPanel(h3("Découpage en classes"),tableOutput(ns("tab1")))))

           )


}

#' classes Server Functions
#'
#' @noRd
mod_classes_server <- function(id,global){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

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
        choices = c("Largeur fixe"="largeur_fixe","Quantiles"="quantiles")
      )
    }
    )

    local2 <- reactiveValues(dt=NULL,var=NULL,type_class=NULL,nbclasses=NULL)

    observeEvent(input$go2,{

      local2$dt <- local$dt
      local2$var <- input$select2
      local2$type_class <- input$select3
      local2$nbclasses <- input$slide1
      local2$classes <- calculer_bornes(df = local2$dt,num = local2$var,nbclass = local2$nbclasses,type_decoup = local2$type_class)

    }
    )

    output$plot1 <- renderPlot({
      validate(need(expr = !is.null(local2$dt),
                    message = "Choisir une variable et un type de découpage en classe pour afficher la distribution"))
      # shinipsum::random_ggplot()
      afficher_histo3(df = local2$dt,varnum = local2$var,nbclass = local2$nbclasses,type_decoup = local2$type_class,breaknum = local2$classes)
    }
    )

    output$tab1 <- renderTable({
      validate(need(expr = !is.null(local2$dt),
                    message = "Choisir une variable et un type de découpage en classe pour afficher la distribution"))
      tabuler_bornes(num = local2$classes,nbclass = local2$nbclasses,type_decoup = local2$type_class)
      # shinipsum::random_table(nrow = 20,ncol = 2)
    }
    )





  })
}

## To be copied in the UI
# mod_classes_ui("classes")

## To be copied in the server
# mod_classes_server("classes")
