#' calculer_bornes
#'
#' @description Une fonction qui calcule les bornes des classes à partir d'un vecteur numérique
#' @param df un dataframe
#' @param num un character
#' @param nbclass une valeur numerique
#' @param type_decoup un character
#'
#' @return un vecteur numerique
#' @import ggplot2
#' @export
#' @examples df <- grandile
#'x <- "PATRIMOINE"
#'y <- 5
#'z <- "quantiles"
#'calculer_bornes(df,x,y,z)
calculer_bornes <- function(df,num,nbclass,type_decoup){
  x <- df[,num]
  if (type_decoup == "largeur_fixe"){
    max <- max(x)
    min <- min(x)
    largeur <- (max-min)/nbclass #largeur de chaque tranche
    bornes <- seq(min,max,largeur) #vecteur numérique avec les bornes
  }else if (type_decoup == "quantiles"){
    vect_quantiles <- seq(0,1,1/nbclass)
    bornes <- quantile(x,vect_quantiles)
  }
  return(bornes)
}
