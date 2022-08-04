#' afficher_histo3
#'
#' @description Une fonction qui renvoie un histogramme à partir des paramètres
#' renseignés dans l'application
#' @param df un dataframe
#' @param varnum un character
#' @param nbclass une valeur numerique
#' @param type_decoup un character
#' @param breaknum un vecteur numérique
#'
#' @return un dataframe
#' @import ggplot2
#' @importFrom scales label_number_auto
#' @export
#' @examples df <- grandile
#'x <- "PATRIMOINE"
#'y <- 20
#'z <- "largeur_fixe"
#'a <- calculer_bornes(df,x,y,z)
#'afficher_histo3(df,x,y,z,a)
afficher_histo3 <- function(df,varnum,nbclass,type_decoup,breaknum){
  a <- dput(breaknum)
  ggplot(df)+
    aes(.data[[varnum]])+
    geom_histogram(aes(y = ..density..),breaks=a,color="#FFC400ff",fill="#3467AEff")+
    theme_minimal()+
    xlab(varnum)+
    scale_x_continuous(labels = scales::label_number_auto())
}
