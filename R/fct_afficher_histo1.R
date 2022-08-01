#' afficher_histo1
#'
#' @description Une fonction qui affiche un histogramme
#' @param df un dataframe
#' @param var un character
#'
#' @return a graph ggplot
#' @import ggplot2
#' @export
#' @examples afficher_histo1(mtcars,"mpg")
afficher_histo1 <- function(df,var){
  ggplot(df) +
    aes(x = .data[[var]]) +
    geom_histogram(col="black",fill="#FFC400ff",bins = 20) +
    theme_minimal()
}
