#' afficher_histo2
#'
#' @description Une fonction qui affiche un histogramme
#' à partir d'un vecteur numérique
#' @param inputselect un character
#' @param num un vecteur numérique
#'
#' @return un graph ggplot
#' @import ggplot2
#' @export
#' @examples b <- ajouter_valeurs_extremes(grandile,"REV_DISPONIBLE",nb=10)
#' afficher_boxplot2("REV_DISPONIBLE",b)
afficher_histo2 <- function(inputselect,num){
  c <- num %>% as.data.frame()
  names(c) <- inputselect
  ggplot(c) +
    aes(x = .data[[inputselect]]) +
    geom_histogram(col="black",fill="#3467AEff",bins = 20) +
    theme_minimal()
}
