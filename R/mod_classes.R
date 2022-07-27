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
                                          choices = c("Grandile","Petitile")),


                              selectInput(ns("select2"),
                                          "Caractère quantitatif",
                                          choices = c("REVENU","PATRIMOINE")),

                              selectInput(ns("select3"),
                                          "Type de découpage en tranche",
                                          choices = c("Largeur fixe","Quantiles")),

                              sliderInput(
                                inputId = ns("slide1"),
                                label = "Nombre de tranches",
                                min = 1,
                                max = 40,
                                value = 4
                              ),

                              actionButton(ns("go1"),"Afficher le graphique")







           )
           ),column(5,wellPanel(h3("Histogramme"),plotOutput(ns("plot1")))),column(3,wellPanel(h3("Découpage en classes"),tableOutput(ns("tab1")))))

           )


}

#' classes Server Functions
#'
#' @noRd
mod_classes_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns


    output$tab1 <- renderTable(
      shinipsum::random_table(nrow = 20,ncol = 2)
    )

    output$plot1 <- renderPlot(

      shinipsum::random_ggplot()
    )



  })
}

## To be copied in the UI
# mod_classes_ui("classes")

## To be copied in the server
# mod_classes_server("classes")
