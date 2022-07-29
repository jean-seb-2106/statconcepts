#' afficher_boxplot1
#'
#' @description Une fonction qui affiche une box plot
#' @param df un dataframe
#' @param var un character
#'
#' @return a graph ggplot
#' @import ggplot2
#' @export
#' @examples afficher_boxplot1(mtcars,"mpg")
afficher_boxplot1 <- function(df,var){
  ggplot(df) +
    aes(x = .data[[var]]) +
    geom_boxplot(col="black",fill="lightblue") +
    coord_flip()+
    theme_minimal()
}
