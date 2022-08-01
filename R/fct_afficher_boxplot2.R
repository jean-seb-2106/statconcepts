#' afficher_boxplot2
#'
#' @description Une fonction qui affiche une box plot
#' à partir d'un vecteur numérique
#' @param inputselect un character
#' @param num un vecteur numérique
#'
#' @return un graph ggplot
#' @import ggplot2
#' @export
#' @examples b <- ajouter_valeurs_extremes(grandile,"REV_DISPONIBLE",nb=10)
#' afficher_boxplot2("REV_DISPONIBLE",b)
afficher_boxplot2 <- function(inputselect,num){
  c <- num %>% as.data.frame()
  names(c) <- inputselect
  ggplot(c) +
    aes(x = .data[[inputselect]]) +
    geom_boxplot(col="black",fill="#3467AEff") +
    coord_flip()+
    theme_minimal()
}
